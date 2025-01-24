FROM python:3.9-slim

WORKDIR /app

COPY datagenerator.py ./datagenerator.py

RUN pip install graphyte

ENV GRAPHITE_HOST=localhost
ENV GRAPHITE_PORT=2003

CMD ["python", "-u", "datagenerator.py"]
