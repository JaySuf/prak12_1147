import mysql.connector
from mysql.connector import Error

from config import Config


def get_connection():
    """
    Membuat koneksi ke database MySQL.
    """

    try:
        connection = mysql.connector.connect(
            host=Config.HOST,
            port=Config.PORT,
            user=Config.USER,
            password=Config.PASSWORD,
            database=Config.DATABASE,
            use_pure=True
        )

        return connection

    except Error as e:
        print(f"Gagal terhubung ke database: {e}")
        return None