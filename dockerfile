# 1. Official lightweight Python runtime
FROM python:3.11-slim

# 2. Prevent Python from buffering stdout/stderr (crucial for live streaming logs)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Set workspace directory inside container
WORKDIR /app

# 4. Copy requirements first to leverage Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your project files
COPY . .

# 6. Expose the port FastAPI listens on
EXPOSE 8000

# 7. Start Uvicorn pointing directly to app/main.py
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]