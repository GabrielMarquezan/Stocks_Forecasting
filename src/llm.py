from google import genai
from dotenv import load_dotenv

load_dotenv()

def analyze_sentiment(news_title, news_body, stock_name):
    context = f"Assume you are a investor who invests in brazilian stocks. "
    task = f"Read the following news and decide if it is relevant to {stock_name}'s prices and, if it is, analyze the sentiment caused by it. "
    response_structure = f"You must respond only with the following options: 'irrelevant', 'very negative', 'negative', 'neutral', 'positive' or 'very positive'. "
    restriction = f"Do not respond anything else!"
    news = f"\n\nTitle: {news_title}\n\n Body Text: {news_body}"
    
    client = genai.Client()
    
    response = client.models.generate_content(
        model="gemini-2.5-pro",
        contents=context + task + response_structure + restriction + news
    )

    response.replace('*', '')
    return response