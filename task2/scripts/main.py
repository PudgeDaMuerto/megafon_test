import time
import database
import os


def main():
    db = database.DBConnection(
        os.environ['DB_HOST'],
        os.environ['POSTGRES_DB'],
        os.environ['POSTGRES_USER'],
        os.environ['POSTGRES_PASSWORD'],
        os.environ['DB_PORT']
    )

    if (row := db.select_last()) is None:
        row_id = 1
    else:
        row_id = row[0] + 1

    while True:
        db.send_data(row_id, 10)
        print("INSERTED DATA: ", db.select_last())
        print("ROWS COUNT: ", db.count_rows())
        row_id += 1
        time.sleep(float(os.environ['APP_DELAY']))


if __name__ == '__main__':
    main()
