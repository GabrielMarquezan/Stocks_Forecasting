import yfinance as yf
from crud import Connector

asset_ticker = {'Oil': 'CL=F', 'Soy': 'ZS=F', 'Gold': 'GC=F', 'USD/BRL': 'USDBRL=X'}

for commodity, ticker in asset_ticker.items():
    asset = yf.Ticker(ticker)
    asset_price_history = asset.history(period="1mo")

    # TO DO: there's some days in which the price does not change. So, I need to handle that case by creating 
    # those days, then inserting the price of the previous day.

    for row in asset_price_history.iterrows():
        for i in range(0, 2):
            date = row[0].strftime('%Y-%m-%d')
            price = row[1]['Close'] if i == 0 else row[1]['Open']
            openingOrClosing = "Closing" if i == 0 else "Opening"

            Connector().insert_price(date, price, openingOrClosing, commodity)
