import yfinance as yf
from crud import Connector
from utils import initial_date, final_date

asset_ticker = {'Oil': 'CL=F', 'Soy': 'ZS=F', 'Gold': 'GC=F', 'USD/BRL': 'USDBRL=X', 'Banco do Brasil': 'BBAS3.SA', 'Marfrig': 'MRFG3.SA', 'SLC Agrícola': 'SLCE3.SA'}

for asset_name, ticker in asset_ticker.items():
    asset = yf.Ticker(ticker)
    asset_price_history = asset.history(period="3mo")

    for row in asset_price_history.iterrows():
        date = row[0].strftime('%Y-%m-%d')
        
        if date >= initial_date and date <= final_date:
            opening = row[1]
            high = row[2]
            low = row[3]
            closing = row[4]
            volume = row[5]
            
            Connector().insert_price(date, opening, closing, high, low, volume, ticker)