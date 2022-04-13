FROM python:latest

ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt update && apt upgrade -y

RUN apt install python3-pip -y

RUN apt-get install -y ffmpeg opus-tools bpm-tools

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install -y nodejs

RUN npm i -g npm

RUN mkdir /app/

COPY . /app

WORKDIR /app

RUN pip3 install --upgrade pip

RUN pip3 install -U -r requirements.txt

CMD python3 main.py
# docker build -t tgcalls .
# docker run -it --rm --env-file ./envfile --name tgvc-userbot tgcalls
