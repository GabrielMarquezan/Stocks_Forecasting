from dotenv import load_dotenv
from newsapi import NewsApiClient
import os
from crud import Connector
from utils import assets, languages, initial_date, final_date
from llm import analyze_sentiment
import time

load_dotenv(override=True)

def collect_news():
    newsapi = NewsApiClient(api_key=os.getenv('NEWS_API_KEY'))
    all_articles = []
    connector = Connector()

    for ticker in assets.values():
        for language in languages:
            isNational = True if language == 'pt' else False

            all_articles = newsapi.get_everything(q=ticker,
                                                  from_param=initial_date,
                                                  to=final_date,
                                                  language=language,
                                                  sort_by='relevancy')

            for article in all_articles['articles']:
                sentiment = analyze_sentiment(news_title=article['title'],
                                           news_body=article['content'],
                                           stock_name=ticker)
                if sentiment != 'irrelevant':
                    connector.insert_news(title=article['title'],
                                          body_text=article['content'],
                                          date=article['publishedAt'],
                                          isNational=isNational,
                                          emotion=sentiment,
                                          assetTicker=ticker)

                time.sleep(70)

if __name__ == '__main__':
    collect_news()