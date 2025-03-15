# Use the official Python 3.10 image as the base image
FROM python:3.10

# Set environment variable to define the application directory
ENV APP_HOME /app

# Set the working directory inside the container to /app
WORKDIR $APP_HOME

# Copy the requirements.txt file from the host to the working directory in the container
COPY requirements.txt .

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files from the host to the working directory in the container
COPY . .

# Expose port 8000 to allow external access to the application
EXPOSE 8000

# Specify the command to run the FastAPI application using uvicorn
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
