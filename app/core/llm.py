from langchain_openai import ChatOpenAI
import os

def get_llm():

    return ChatOpenAI(
        model="llama-3.1-8b-instant",
        temperature=0,
        base_url="https://api.groq.com/openai/v1",
        api_key=os.getenv("GROQ_API_KEY")
    )