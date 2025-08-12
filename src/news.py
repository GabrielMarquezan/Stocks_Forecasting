from dotenv import load_dotenv
from newsapi import NewsApiClient
import os
from crud import Connector
from utils import assets, initial_date, final_date

load_dotenv(override=True)

def collect_news():
    newsapi = NewsApiClient(api_key=os.getenv('NEWS_API_KEY'))

    for assetName, ticker in assets.items():
        all_articles = newsapi.get_everything(q=ticker,
                                              from_param=initial_date,
                                              to=final_date,
                                              language='pt',
                                              sort_by='relevancy')

        for article in all_articles['articles']:

            title = article['title']
            date = article['publishedAt'][0:10]
            emotion = input(f"Qual a emoção do artigo '{title}'?\n")

            if emotion != '':
                Connector().insert_news(title, date, emotion, assetName)
            else:
                print("Emoção não informada, artigo não inserido.")