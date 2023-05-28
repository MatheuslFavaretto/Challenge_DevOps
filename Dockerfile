FROM python:3.9

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY run.sh /

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV port 8000
EXPOSE 8000
EXPOSE 5432

RUN chmod +x run.sh

# iniciando o servidor
CMD ["./run.sh"]