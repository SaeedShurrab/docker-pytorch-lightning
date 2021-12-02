FROM pytorch/pytorch:latest

RUN pip install -U pip

RUN mkdir /src

WORKDIR /src


RUN pip install --no-cache-dir pandas \ 
	numpy \ 
	jupyter \
	matplotlib \ 
	pytorch-lightning \
	mlflow
  


EXPOSE 8888
EXPOSE 5000

ENTRYPOINT jupyter notebook --ip 0.0.0.0 --no-browser --allow-root #& tensorboard --logdir logs/ --host=0.0.0.0
