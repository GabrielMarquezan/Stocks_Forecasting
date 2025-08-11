from dotenv import load_dotenv
from newsapi import NewsApiClient
import os
from crud import Connector

load_dotenv(override=True)


newsapi = NewsApiClient(api_key=os.getenv('NEWS_API_KEY'))


all_articles = newsapi.get_everything(q='SLCE',
                                      from_param='2025-07-12',
                                      language='pt',
                                      sort_by='relevancy')


for article in all_articles['articles']:
    
    title = article['title']
    date = article['publishedAt'][0:10]
    emotion = input(f"Qual a emoção do artigo '{title}'?\n")
    assetName = 'SLC Agrícola'
    
    if emotion != '':
        Connector().insert_news(title, date, emotion, assetName)
    else:
        print("Emoção não informada, artigo não inserido.")