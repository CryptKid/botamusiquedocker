FROM ubuntu:rolling
RUN apt update
RUN apt install python3 opus-tools ffmpeg curl python3-venv -y
RUN rm -rf /var/lib/apt/lists/*
RUN curl -Lo botamusique.tar.gz http://packages.azlux.fr/botamusique/sources.tar.gz
RUN tar -xzf botamusique.tar.gz
WORKDIR /botamusique/
RUN python3 -m venv venv
RUN venv/bin/pip install wheel
RUN venv/bin/pip install -r pymumble/requirements.txt
RUN venv/bin/pip install -r requirements.txt
COPY ["configuration.ini", "/botamusique/configuration.ini"] 
CMD ["venv/bin/python", "mumbleBot.py", "--config", "/botamusique/configuration.ini"]
