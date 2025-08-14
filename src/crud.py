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

        self.cursor = self.connection.cursor()

    def insert_news(self, title, date, emotion, assetName):
        self.cursor.execute(f'INSERT INTO news (title, date, emotion, assetName) VALUES ("{title}", "{date}", "{emotion}", "{assetName}");')
        self.connection.commit()

    def insert_price(self, date, price, openingOrClosing, assetName):
        self.cursor.execute('INSERT INTO prices (date, price, openingOrClosing, assetName) VALUES ("{date}", {price}, "{openingOrClosing}", "{assetName}");')
        self.connection.commit()

    def read_emotions_and_date(self, assetName):
        self.cursor.execute(f'SELECT date, emotion FROM news WHERE assetName = "{assetName}" ORDER BY date ASC;')
        return self.cursor.fetchall()

    def read_asset_history(self, assetName):
        self.cursor.execute(f'SELECT date, price, openingOrClosing FROM prices WHERE assetName = "{assetName}" ORDER BY date ASC;')
        return self.cursor.fetchall()

    def read_asset_closing_prices(self, assetName):
        self.cursor.execute(f'SELECT date, price FROM prices WHERE assetName = "{assetName}" AND openingOrClosing = "closing" ORDER BY date ASC;')
        return self.cursor.fetchall()

    def read_emotions_history(self, assetName):
        self.cursor.execute(f'SELECT date, emotion FROM news WHERE assetName = "{assetName}" ORDER BY date ASC;')
        return self.cursor.fetchall()