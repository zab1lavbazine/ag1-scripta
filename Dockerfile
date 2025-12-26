FROM python:3.11-slim

WORKDIR /app

# Install MkDocs and theme dependencies first to leverage Docker layer caching.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files.
COPY . .

EXPOSE 8000

# Run the MkDocs development server.
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
