# When setup correctly, this code does 2 things:
#   1. It uses your OpenAI account to generate a random story.
#   2. It stores the output in your Firestore database.
#
# Please note that sensible information such as your OpenAI key, 
# project id, etc., shouldn't be hardcoded in this file.

from google.cloud import firestore
from google.oauth2 import service_account
from openai_to_firestore import OpenAI
import json

client = OpenAI(
  api_key="<your_openai_key>",
  organization='<your_organization_id',
  project='<your_project_id>',
)

# Path to your service account key file
SERVICE_ACCOUNT_FILE = '<YOUR_SERVICE_ACCOUNT_FILE>'

# Initialize Firestore DB
credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE
)
db = firestore.Client(credentials=credentials)

user_content = '''
Generate 1 random fact or interesting story about any topic you want. 

The story must follow these rules:
- No dangerous content
- Story must not be something well known
- A story must have: a title (max 1 sentence), a description, a tag of the main topic
- The description must be at least 4 paragraphs, each one with at least 3 sentences. Separate each paragraphs with "\n". Don't leave empty lines but just use the escape character.

A script will automatically parse your response, so: only give me the JSON response. 

You MUST give me the story in a json format by passing three arguments: title, description, tag:

{
    "title": "The title you generate",
    "description": "The description you generate",
    "tag": "The tag you generate"
}
'''

def fetch_and_store_data() :
    try:
        completion = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {
                    "role": "system", 
                    "content": "You are an expert about real random facts and real interesting stories."
                },
                {
                    "role": "user", 
                    "content": user_content
                }
            ],
        )

        data = completion.choices[0].message.content

        # Debug purpose only
        print(f'\n\nDATA:\n{data}\n\n')

        parsed_data = json.loads(data)

        collection_ref = db.collection('<your_collection_name>')
        doc_ref = collection_ref.document()  # Automatically generate a unique document ID
        doc_ref.set(parsed_data)

        print('Data fetched and stored successfully.')
    except Exception as e:
        print(f'An error occurred: {e}')


if __name__ == '__main__':
    fetch_and_store_data()