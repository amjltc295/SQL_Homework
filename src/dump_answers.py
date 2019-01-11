import pickle
import argparse

import mysql.connector

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

    result_dict = {}
    error = 0
    with open(args.file_path, 'r') as fin, \
            open(args.output_path, 'wb') as fout:
        lines = fin.readlines()
        for i, line in enumerate(lines):
            try:
                mycursor.execute(line)
            except Exception as err:
                error += 1
                logger.error(f"{i}: {err}", exc_info=True)
            else:
                results = mycursor.fetchall()
                result_dict[i] = set(results)
        pickle.dump(result_dict, fout)

    logger.info("-------------------------------------------------------")
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
