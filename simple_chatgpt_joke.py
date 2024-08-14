# A simple example of how to use the OpenAI API to generate a joke about Java
# programmers using ChatGPT.
#
# To run this script, you need:
# 1. An OpenAI API key. You can create an OpenAI account and get your API key at https://platform.openai.com.
# 2. The OpenAI Python client library. You can install it via `pip install openai`.
from openai import OpenAI


OPENAI_KEY = "<YOUR_OPENAI_API_KEY>"  # Replace with your OpenAI API key

client = OpenAI(
  api_key=OPENAI_KEY,
  organization="$YOUR_ORGANIZATION_ID",  # Replace with your organization ID
  project="$YOUR_PROJECT_ID"  # Replace with your project ID
)

system_content = "You are an expert in making jokes about Java programmers."

user_content = f'''
Make a joke about Java programmers.
'''

def fetch_and_store_data() :
    try:
        completion = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {
                    "role": "system", 
                    "content": system_content
                },
                {
                    "role": "user", 
                    "content": user_content
                }
            ],
        )

        data = completion.choices[0].message.content
        print(f'\n\nDATA:\n{data}\n\n')
            
    except Exception as e:
        print(f'An error occurred: {e}')


if __name__ == '__main__':
    fetch_and_store_data()