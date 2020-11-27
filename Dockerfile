FROM pytorch/pytorch:latest

RUN pip install -U pip

RUN mkdir /src

WORKDIR /src

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8888
EXPOSE 6006

CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
CMD tensorboard --logdir logs/ --host=0.0.0.0

