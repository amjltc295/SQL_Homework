import pickle
import json
import argparse
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))  # NOQA

import mysql.connector

from src.logging_config import logger


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-u', '--user', type=str, help='Username for MySQL')
    parser.add_argument('-p', '--passwd', type=str, help='Password for MySQL')
    parser.add_argument(
        '-go', '--grade_output_path', type=str,
        help='Output path for the answer'
    )
    parser.add_argument(
        '-a', '--answer_path', type=str,
        help='Path for the answer'
    )
    parser.add_argument(
        '-rsd', '--root_submission_dir', type=str,
        help='Root submission directory'
    )
    args = parser.parse_args()
    return args


def main(args):

    with open(args.answer_path, 'rb') as fin:
        answers = list(pickle.load(fin).values())

    result_dict = {}
    answer_correct = 0
    student_num = 0
    total_grade = 0
    dirnames = os.listdir(args.root_submission_dir)
    with open(args.grade_output_path, 'w') as f_grade_out:
        for student_id in dirnames:
            message = ''
            grade = 0
            try:
                student_dir = os.path.join(
                    args.root_submission_dir, student_id)
                if len(student_id) != 9 or os.path.isfile(student_dir):
                    continue

                logger.info(f"Grading {student_id}")
                wrong_answers = []
                errors = []
                mydb = mysql.connector.connect(
                  host="localhost",
                  user=args.user,
                  passwd=args.passwd,
                  database="starwar"
                )

                mycursor = mydb.cursor()

                student_num += 1
                if len(os.listdir(student_dir)) != 2:
                    grade -= 10
                    message += "Error: multiple files under your directory (-10), "
                if 'report.pdf' in os.listdir(student_dir):
                    grade += 10

                student_answer_path = os.path.join(student_dir, f"{student_id.swapcase()}.txt")
                if not os.path.exists(student_answer_path):
                    student_answer_path = os.path.join(student_dir, f"{student_id}.txt")
                answer_correct = 0
                with open(student_answer_path, 'r') as fin:
                    lines = fin.readlines()
                    for i, (line, answer) in enumerate(zip(lines, answers)):
                        try:
                            mycursor.execute(line)
                            results = mycursor.fetchall()
                        except Exception as err:
                            errors.append(i+1)
                            logger.error(err, exc_info=True)
                        else:
                            result_dict[i] = results
                            if set(results) == set(answer):
                                answer_correct += 1
                            else:
                                wrong_answers.append(i+1)
                                logger.warning(f"{set(results)} / {set(answer)}")
                grade += answer_correct * 6

            except Exception as err:
                grade = max(grade, 0)
                if 'byte' in str(err):
                    message += f"/ error: {type(err)} {err} (invalid file type; is it a plain text file?)"
                message += f"/ error: {type(err)} {err}"
                logger.error(f"{student_id}, {grade}, {message}\n")
                f_grade_out.write(f"{student_id}, {grade}, {message}\n")
            else:
                grade = max(grade, 0)
                message += f" wrong_answers: {wrong_answers}"
                message += f"/ errors: {errors}"
                f_grade_out.write(f"{student_id}, {grade}, {message}\n")
                logger.info(f"{student_id}, {grade}, {message}\n")
            total_grade += grade
    logger.info(f"Student num: {student_num}")
    logger.info(f"Student avg: {total_grade / student_num}")


if __name__ == '__main__':
    args = parse_args()
    main(args)
