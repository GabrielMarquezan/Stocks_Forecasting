from dotenv import load_dotenv
from newsapi import NewsApiClient
import os
from crud import Connector
from utils import assets, languages, initial_date, final_date
from llm import analyze_sentiment

load_dotenv(override=True)

def collect_news():
    newsapi = NewsApiClient(api_key=os.getenv('NEWS_API_KEY'))
    all_articles = []

    for ticker in assets.values():
        for language in languages:
            all_articles = newsapi.get_everything(q=ticker,
                                                  from_param=initial_date,
                                                  to=final_date,
                                                  language=language,
                                                  sort_by='relevancy')

            for article in all_articles['articles']:
                result = analyze_sentiment(news_title=article.title,
                                           news_body=article.content,
                                           stock_name=ticker)
                result.replace('*', '')

                
        
if __name__ == "__main__":
