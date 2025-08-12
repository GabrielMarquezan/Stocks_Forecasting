import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv(override=True)

class Connector():
    def __init__(self):
        self.connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password=os.getenv('MYSQL_PASSWORD'),
            database='stock_forecasting'
        )

    def insert_news(self, title, date, emotion, assetName):
        cursor = self.connection.cursor()
        insert_query = f'INSERT INTO news (title, date, emotion, assetName) VALUES ("{title}", "{date}", "{emotion}", "{assetName}");'

        cursor.execute(insert_query)
        self.connection.commit()

    def insert_price(self, date, price, openingOrClosing, assetName):
        cursor = self.connection.cursor()
        insert_query = f'INSERT INTO prices (date, price, openingOrClosing, assetName) VALUES ("{date}", {price}, "{openingOrClosing}", "{assetName}");'

        cursor.execute(insert_query)
        self.connection.commit()

    def read_emotions_and_date(self, assetName):
        cursor = self.connection.cursor()
        cursor.execute(f'SELECT date, emotion FROM news WHERE assetName = "{assetName}" ORDER BY date ASC;')
        return cursor.fetchall()
    
    def read_asset_history(self, assetName):
        cursor = self.connection.cursor()
        cursor.execute(f'SELECT date, price, openingOrClosing FROM prices WHERE assetName = "{assetName}" ORDER BY date ASC;')
        return cursor.fetchall()