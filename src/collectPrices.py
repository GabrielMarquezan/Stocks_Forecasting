import yfinance as yf
import pandas as pd
import os
#from crud import Connector
from utils import initial_date, final_date
from datetime import datetime,timezone, timedelta

def collect_prices():
    asset_ticker = {'Oil': 'CL=F', 'Soy': 'ZS=F', 'Gold': 'GC=F', 'USD/BRL': 'USDBRL=X', 'Banco do Brasil': 'BBAS3.SA', 'Marfrig': 'MBRF3.SA', 'SLC Agrícola': 'SLCE3.SA'}

    time_zone = timezone(timedelta(hours=-5))
    for asset_name, ticker in asset_ticker.items():
        asset = yf.Ticker(ticker)
        asset_price_history = asset.history(period="3mo")

        for row in asset_price_history.iterrows():
            file_exists = os.path.isfile('prices.csv')
            date = row[0].strftime('%Y-%m-%d')
            date = datetime.strptime(date, '%Y-%m-%d')
            date += timedelta(2)

            if date >= initial_date and date <= final_date:
                opening = row[1]['Open']
                high = row[1]['High']
                low = row[1]['Low']
                closing = row[1]['Close']
                volume = row[1]['Volume']

                
                price = pd.DataFrame({'date': [date.strftime('%Y-%m-%d')],
                                      'opening': [opening],
                                      'closing':[closing],
                                      'high': [high],
                                      'low': [low],
                                      'volume': [volume],
                                      'assetTicker': [ticker]}
                )

                price.to_csv('prices.csv', mode='a', header=not file_exists, index=False)

                #Connector().insert_price(date, opening, closing, high, low, volume, ticker)

if __name__ == '__main__':
    collect_prices()
    #asset = yf.Ticker('CL=F')
    #asset_price_history = asset.history(period="3mo")
    #for row in asset_price_history.iterrows():
    #    print(row[1])