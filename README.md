# Project Overview

This is a project to deploy Django app on Amazon EKS using Docker and Kubernetes manifests. Terraform was used to created the VPC infrastructure.

## Installation and Cofiguration Guide

### 1. Deploy VPC Services
Initialize and apply
terraform init
terraform apply


### 2. Set up Amazon EKS configuration
Login to AWS console and create EKS services  


### 3. Clone the Repository

```bash
git clone https://github.com/cognetiks/Technical_DevOps_app.git
cd Technical_DevOps_app
```
### 4. Install Dependencies

Make sure you have Python 3.8+ and pip installed. Then, create a virtual environment and install the required packages:

```bash
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
pip install -r requirements.txt
```

### 5. Environment Variables

For the project to work in production with an Amazon RDS instance, you need to set the following environment variables:

- `RDS_DB_NAME` – Your RDS database name.
- `RDS_USERNAME` – Your RDS username.
- `RDS_PASSWORD` – Your RDS password.
- `RDS_HOSTNAME` – The endpoint of your RDS instance.
- `RDS_PORT` – The port your RDS instance uses (default for PostgreSQL is 5432).

In development, if these environment variables are not set, the project will default to using SQLite.

### 4. Configure Environment Variables for Production

For production deployment with RDS, export the required environment variables. Example configuration:

```bash
export RDS_DB_NAME=mydbname
export RDS_USERNAME=mydbuser
export RDS_PASSWORD=mypassword
export RDS_HOSTNAME=mydbinstance.000000000.us-east-1.rds.amazonaws.com
export RDS_PORT=5432
```

Alternatively, you can add these to a .env file or your deployment tool (e.g., Docker, AWS Elastic Beanstalk).

### 5. Run Database Migrations

Apply migrations to set up your database schema:

```bash
python manage.py migrate
```

### 6. Run the Application

To start the Django development server:

```bash
python manage.py runserver
```

For production, you'll need to configure a web server like NGINX or Gunicorn.

## Local Development Setup

For local development, the app will default to using an SQLite database. No special configuration is needed unless you wish to connect to PostgreSQL locally.

### Running Local Server

To run the server locally:

```bash
python manage.py runserver
```

### Production Deployment
When deploying to production (e.g., on AWS or any other cloud provider), ensure the required environment variables are set. The app will automatically connect to the PostgreSQL RDS instance once the variables are correctly configured.

### 7. Create Dockerfile for the Django Application
FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

### 8. Deploy Django app on EKS cluster
Use the created docker image in step 7 and the kubernetes manifest files to deploy Django Apllication on the EKS cluster. 

