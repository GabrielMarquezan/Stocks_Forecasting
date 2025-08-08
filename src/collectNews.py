from dotenv import load_dotenv
from newsapi import NewsApiClient
import os
from crud import Connector

load_dotenv(override=True)


newsapi = NewsApiClient(api_key=os.getenv('NEWS_API_KEY'))


all_articles = newsapi.get_everything(q='BBAS3',
                                      from_param='2025-07-08',
                                      language='pt',
                                      sort_by='relevancy')


for article in all_articles['articles']:
    title = article['title']
    date = article['publishedAt'][0:10]
    emotion = input(f"Qual a emoção do artigo '{title}'?\n")
    assetName = 'Banco do Brasil'

    Connector().insert_news(title, date, emotion, assetName)
