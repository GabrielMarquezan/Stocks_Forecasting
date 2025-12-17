from google import genai
import os
from dotenv import load_dotenv

def analyze_sentiment(news_title, news_body, stock_name):
    context = f"Assume you are a investor who invests in brazilian stocks. "
    task = f"Read the following news and decide if it is relevant to {stock_name}'s prices and, if it is, analyze the sentiment caused by it. "
    response_structure = f"You must respond only with the following options: 'irrelevant', 'very negative', 'negative', 'neutral', 'positive' or 'very positive'. "
    restriction = f"Do not respond anything else!"
    news = f"\n\nTitle: {news_title}\n\n Body Text: {news_body}"
    
    load_dotenv()
    client = genai.Client(api_key=os.getenv('GEMINI_API_KEY'))
    
    response = client.models.generate_content(
        model="gemini-2.5-flash-lite",
        contents=context + task + response_structure + restriction + news
    )

    text = response.text
    text.replace('*', '')
    return text