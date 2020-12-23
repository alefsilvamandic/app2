FROM python:alpine3.7
run mkdir -p /app && pip install --upgrade pip
COPY my-app.py /app
COPY requirements.txt /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
CMD python ./my-app.py