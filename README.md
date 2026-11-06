# Medical Diagnostics AI Agent Framework

This project is a sophisticated medical diagnostics tool that leverages the Octochains framework and FastAPI to coordinate a multidisciplinary medical team through parallel AI reasoning. By simulating isolated specialists, the system evaluates complex patient reports independently to prevent "groupthink" and cognitive bias, ultimately synthesizing a collaborative diagnosis.

# Features

Multi-Agent Parallel Reasoning: Utilizes four specialized agents (Cardiologist, Psychologist, Pulmonologist, and Neurologist) running concurrently.

Streaming API Responses: The FastAPI backend streams individual agent completions to the frontend in real-time using NDJSON format.

Bring-Your-Own-LLM: Pre-configured to use Groq's high-speed inference (llama-3.1-8b-instant) via the standard LangChain OpenAI wrapper.

Interactive Chat: Allows users to chat directly with the synthesized "Multidisciplinary Team Lead" regarding the generated report.

Compliance & Traceability: Includes an endpoint to download a comprehensive, EU AI Act compliance-ready trace log of the agent interactions and original input data.

Docker Ready: Includes a lightweight Dockerfile for quick containerized deployment.

# Setup and Installation

1. Environment Configuration

Create a .env file in the root of your project directory and add your Groq API key:

GROQ_API_KEY=your_groq_api_key_here


2. Local Installation

Ensure you have Python 3.11+ installed. Install the required dependencies:

python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
pip install -r requirements.txt


# Usage

Option A: Run the FastAPI Web Application

Start the FastAPI server using Uvicorn. The application uses real-time streaming and disk-backed session storage.

uvicorn main:app --reload


Once running, open your web browser and navigate to: http://127.0.0.1:8000

Option B: Run via Docker

You can easily containerize and run the application using the provided Dockerfile.

# Build the Docker image
docker build -t octochains-medical-app .

# Run the container
docker run -p 8000:8000 --env-file .env octochains-medical-app


Access the application at http://localhost:8000.

Option C: Run the CLI Demo Script

If you prefer a terminal-based execution to see the raw Octochains Engine in action, you can run the provided demo script:

python run_demo.py


Note: Ensure you update the file_path inside run_demo.py to point to a valid text file before running.

# Project Structure

main.py: The FastAPI backend entry point containing endpoints for analysis, chat, and logging.

prompts.py: Centralized file containing the specialized prompts for each medical agent and the aggregator.

run_demo.py: A standalone script demonstrating the Octochains Engine and Synthesizer logic without the web interface.

app/core/llm.py: LLM factory function configuring the LangChain OpenAI client to route through Groq.

app/static/: Contains the frontend assets (index.html, etc.) served by FastAPI.

results/: A local directory auto-generated to store session data (.json), markdown reports, and compliance logs.

Dockerfile: Production-ready, slim Python 3.11 image configuration.

requirements.txt: Python dependencies (fastapi, uvicorn, octochains, langchain_openai, etc.).

# Disclaimer

[!CAUTION]
Research and Educational Use Only: This project is designed as a proof-of-concept for multi-agent LLM coordination. It is NOT a certified medical device and should never be used for actual clinical diagnosis, treatment planning, or medical advice.