FROM python:3.9.2-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}


COPY . ./

RUN apt-get update && apt-get -y install gcc python3-dev mono-mcs && rm -rf /var/lib/apt/lists/*

# RUN pip install jupyter
# RUN pip install python-dotenv
RUN pip install --upgrade pip
RUN pip install -r ./build/requirements.txt
RUN chmod +x ./scripts/entrypoint.sh

# pytorch (cpu)

RUN pip install torch==2.0.0+cpu torchvision==0.15.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

CMD ["./scripts/entrypoint.sh"]
