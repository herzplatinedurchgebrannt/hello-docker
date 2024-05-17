# FROM ubuntu

# RUN apt-get update
# RUN apt-get install python3-pip -y
# RUN apt-get install python3-venv -y
# RUN apt-get install python3-flask -y

# # RUN python3 -m venv /opt/venv

# # RUN source /opt/venv/bin/activate
# # RUN pip install flask -y

# WORKDIR /app


# COPY . .

# CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]

# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]
