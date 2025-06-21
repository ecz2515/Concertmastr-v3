import os
from dotenv import load_dotenv
from anthropic import Anthropic

# Load .env file
load_dotenv()

# Get the key from .env
ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY")

if not ANTHROPIC_API_KEY:
    raise EnvironmentError("ANTHROPIC_API_KEY not set in .env")

client = Anthropic(api_key=ANTHROPIC_API_KEY)

def run_claude(prompt: str):
    response = client.messages.create(
        model="claude-sonnet-4-20250514",
        max_tokens=1024,
        temperature=0.7,
        messages=[
            {"role": "user", "content": prompt}
        ]
    )
    return response.content[0].text

if __name__ == "__main__":
    user_prompt = input("Enter your prompt: ")
    output = run_claude(user_prompt)
    print("\nClaude says:\n")
    print(output)
