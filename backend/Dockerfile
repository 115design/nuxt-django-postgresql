FROM python:3.6
ENV PYTHONUNBUFFERED 1
COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# docker-compose execの開始位置
WORKDIR /app/django
