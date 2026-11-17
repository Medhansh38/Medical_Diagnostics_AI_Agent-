from langchain_openai import ChatOpenAI
import os

def get_llm():
    return ChatOpenAI(
        model="openai/gpt-oss-20b",
        temperature=0,
        base_url="https://api.groq.com/openai/v1",
        api_key=os.getenv("GROQ_API_KEY")
    )