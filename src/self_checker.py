import json
import argparse

import mysql.connector
import numpy as np

from logging_config import logger


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-u', '--user', type=str, help='Username for MySQL')
    parser.add_argument('-p', '--passwd', type=str, help='Password for MySQL')
    parser.add_argument(
        '-o', '--output_path', type=str, help='Output path for the answer'
    )
    parser.add_argument(
        '-a', '--answer_shapes_path', type=str,
        help='Path for the answer shape'
    )
    parser.add_argument(
        '-f', '--file_path', type=str, help='Path to the SQL queries file'
    )
    args = parser.parse_args()
    return args


def main(args):
    mydb = mysql.connector.connect(
      host="localhost",
      user=args.user,
      passwd=args.passwd,
      database="starwar"
    )

    mycursor = mydb.cursor()

    with open(args.answer_shapes_path, 'r') as fin:
        answer_shapes = json.load(fin)

    result_shapes = {}
    shape_correct = 0
    error = 0
    with open(args.file_path, 'r') as fin:
        lines = fin.readlines()
        for i, line in enumerate(lines):
            try:
                mycursor.execute(line)
            except Exception as err:
                error += 1
                logger.error(err, exc_info=True)
            else:
                results = mycursor.fetchall()
                for x in results:
                    logger.info(x)
                result_shapes[i+1] = np.array(results).shape

                result_shape = np.array(results).shape
                answer_shape = answer_shapes[f"{i+1}"]
                if answer_shape != list(result_shape):
                    logger.error(
                        f"Question {i+1} shape not match: "
                        f"yours: {result_shape} / ans: {answer_shape}"
                    )
                else:
                    shape_correct += 1
                    logger.info(
                        f"Question {i+1} shape correct"
                    )

    logger.info("-------------------------------------------------------")
    logger.info(f"Shape correct: {shape_correct} / {len(answer_shapes)}")
    logger.info(f"Error: {error} / {len(answer_shapes)}")
    logger.warning(
        "Note that this checker only checks the shape."
        "Your answer may still be wrong."
    )
    logger.warning(
        "The answer is not guaranteed to be correct as well; "
        "open a issue if you think the answer shape is incorrect."
    )


if __name__ == '__main__':
    args = parse_args()
    main(args)
