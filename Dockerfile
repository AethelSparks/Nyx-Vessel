# Use a stable, ancient foundation
FROM python:3.9-slim-bullseye

# Install the necessary runes
RUN apt-get update && apt-get install -y libssl1.1 libgomp1

# Set the home for the vessel
WORKDIR /app

# Copy the scriptures and install the knowledge
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire soul into the home
COPY . .

# Ignite the vessel
CMD ["gunicorn", "server:app", "--bind", "0.0.0.0:10000"]

