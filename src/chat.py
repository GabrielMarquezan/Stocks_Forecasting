from openai import OpenAI
import os
import dotenv

dotenv.load_dotenv()

client = OpenAI(api_key=os.getenv('OPENAI_KEY'))

completion = client.chat.completions.create(
  model="gpt-5",
  messages=[
    {"role": "developer", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Hello!"}
  ]
)

print(completion.choices[0].message)
