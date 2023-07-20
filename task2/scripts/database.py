import string
import psycopg2
import datetime
import random


class DBConnection:
    instance = None

    def __new__(cls, *args, **kwargs):
        if cls.instance is None:
            cls.instance = super().__new__(DBConnection)
            return cls.instance
        return cls.instance

    def __init__(self, db_host, db_name, db_user, db_pass, db_port):
        self.host = db_host
        self.name = db_name
        self.user = db_user
        self.password = db_pass
        self.port = db_port
        self.conn = self.connect()
        self.cursor = self.conn.cursor()

    def connect(self):
        try:
            conn = psycopg2.connect(
                dbname=self.name,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port
            )
            print("database connected")
            return conn
        except Exception as err:
            print(err)

    def send_data(self, row_id, length):
        data = (row_id, self.get_random_string(length), datetime.datetime.now(),)
        self.cursor.execute(f"INSERT INTO data_table (id, data, date) VALUES (%s, %s, %s)", data)
        self.conn.commit()

    def select_all(self):
        self.cursor.execute("SELECT * FROM data_table")
        return self.cursor.fetchall()

    def select_last(self):
        self.cursor.execute("SELECT * FROM data_table ORDER BY date DESC LIMIT 1")
        return self.cursor.fetchone()

    def count_rows(self):
        self.cursor.execute("SELECT COUNT(*) FROM data_table")
        return self.cursor.fetchone()[0]

    @staticmethod
    def get_random_string(length):
        letters = string.ascii_lowercase
        return ''.join(random.choice(letters) for i in range(length))

    def __del__(self):
        self.cursor.close()
        self.conn.close()
