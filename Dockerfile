# Use an official Python runtime as a parent image
FROM python:3.11.0a1-alpine3.14

# Set environment variable to prevent buffering of Python output
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt /code/

# Install the Python dependencies
RUN pip install -r requirements.txt

# Copy the current directory into the container
COPY . /code/

# Expose the port that Django listens on
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver"]
