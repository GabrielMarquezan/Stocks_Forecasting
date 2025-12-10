import pymysql 
from dotenv import load_dotenv
import os

load_dotenv(override=True)

class Connector():
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user='root',
            password=os.getenv('MYSQL_PASSWORD'),
            database='stock_forecasting'
        )

        self.cursor = self.connection.cursor()

    def insert_price(self, date, opening, closing, high, low, volume, assetTicker):
        sql = '''
            INSERT INTO prices (date, opening, closing, high, low, volume, assetTicker) 
            VALUES (?, ?, ?, ?, ?, ?, ?);
        '''
        self.cursor.execute(sql, (date, opening, closing, high, low, volume, assetTicker))
        self.connection.commit()

    def insert_news(self, title, body_text, date, isNational, emotion, assetTicker):
        sql = '''
            INSERT INTO news (title, body_text, date, isNational, emotion, assetTicker)
            VALUES (?, ?, ?, ?, ?, ?);
        '''
        
        self.cursor.execute(sql, (title, body_text, date, isNational, emotion, assetTicker))
        self.connection.commit()

    def read_emotions_history(self, assetTicker):
        sql = '''
            SELECT date, emotion FROM news WHERE assetTicker = ? ORDER BY date ASC;
        '''

        self.cursor.execute(sql, (assetTicker))
        return self.cursor.fetchall()

    def read_asset_history(self, assetTicker):
        sql = '''
            SELECT date, opening, closing, high, low, volume, assetTicker FROM prices WHERE assetTicker = ? ORDER BY date ASC;
        '''

        self.cursor.execute(sql, (assetTicker))
        return self.cursor.fetchall()
    
    def close_connection(self):
        self.connection.close()