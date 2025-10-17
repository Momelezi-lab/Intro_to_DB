k# MySQLServer.py

import mysql.connector

def create_database():
    try:
        # Connect to MySQL server (replace with your credentials)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",       # your MySQL username
            password=""        # your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()

