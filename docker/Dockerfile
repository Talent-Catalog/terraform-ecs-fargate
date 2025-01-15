# Use the official Apache Superset image as the base
# FROM apache/superset:latest
FROM apache/superset:latest

ENV SUPERSET_ADMIN_USERNAME=admin
ENV SUPERSET_ADMIN_PASSWORD=admin
ENV SUPERSET_ADMIN_FIRSTNAME=Admin
ENV SUPERSET_ADMIN_LASTNAME=User
ENV SUPERSET_ADMIN_EMAIL=admin@example.com

# Install dependencies for Athena
USER root
RUN apt-get update && apt-get install -y sudo vim \
    && pip install psycopg2-binary

# Add the superset_config.py file from the current directory
# this helps us to overide default parameters and configurations
COPY superset_config.py /app/pythonpath/superset_config.py

# Switch back to the superset user
USER superset

# Expose the port that superset runs on
EXPOSE 8088

