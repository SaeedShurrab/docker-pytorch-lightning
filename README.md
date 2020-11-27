# Pytorch Lightning

Docker image for [Pytorch](https://pytorch.org/),  [pytorch-lightning](https://www.pytorchlightning.ai/), [torchtext](https://pytorch.org/text/stable/index.html), [Tensorboard](https://www.tensorflow.org/tensorboard) and [Jupyter notebook](https://jupyter.org/), with GPU support

This image is suitable for testing and running your Pytorch experiments on your local machine and migrating them to the cloud flawlessly

## Getting Started

### Prerequisites


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

If you want to enable GPU inside the container, you'll need to have a [Nvidia Docker Drivers](https://github.com/NVIDIA/nvidia-docker) installed, [check the installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide) if you're running it on your local machine, otherwise most cloud providers have all the required drivers installed and configured when you start the instance



To get this image either pull the latest version from [Dockerhub](https://hub.docker.com/r/yazansh/pytorch-lightning)

```shel
docker pull yazansh/pytorch-lightning
```

Or clone this repository and build it locally

```shell
git clone https://github.com/YazanShannak/docker-pytorch-lightning.git
cd docker-pytorch-lightning
docker image build -t image-name:latest .
```

### Usage

#### Volumes

Source code in the container lives in the */src* directory, you can change it from the Dockerfile by creating and specifying the location of the *WORKDIR*

#### Ports

The image uses the following ports by default:

- 8888 for Jupyter Notebook
- 6006 for Tensorboard



You can change these default ports by passing the required ports to the *CMD* instructions for each of them

- Start the container **without GPU** support

```shell
docker container run -d -p 8888:8888 -p 6006:6006 --name container-name -v /path/to/your-codebase:/src yazansh/pytorch-lightning:latest
```

- To start the container **with GPU** support  add --gpus all

```shell
docker container run --gpus all -d -p 8888:8888 -p 6006:6006 --name container-name -v /path/to/your-codebase:/src yazansh/pytorch-lightning:latest
```

- To change the port bindings on your local machine

```shell
docker container run --gpus all -d -p 80:8888 -p 5000:6006 --name container-name -v /path/to/your-codebase:/src yazansh/pytorch-lightning:latest
```

- To get the token for the Jupyter Notebook, run the following command and lookup the notebook's token

```shell
docker container logs container-name  
```

- To start a shell inside your container , you can use the terminal utility in the Jupyter Notebook or run 

```shell
docker container exec -it container-name bash
```

- It's recommended to run your experiments in a background shell process with [nohup](https://linuxhint.com/how_to_use_nohup_linux/) for example, to do so start a bash shell inside your container with the previous command and run 

```shell
nohup python train.py > example-log.out &
```

- To install other packages

  - Add them to *requirements.txt* file and build locally

  - From a notebook cell with 

    ```python
    !pip install package 
    ```

  - Using a shell 

    ```shell
    pip install package
    ```

    

## Built With

* Docker v19.03.13

* Python v3.8.3

* Pytorch v1.7.0

* Pytorch Lightning v1.0.8

* Tensorboard v2.4.0

  You can check the *requirements.txt* file for all the dependencies

  

## Author

[Yazan Shannak](https://www.linkedin.com/in/yazan-shannak/) - yazan.shannak@arabiaweather.com - ywshannak19@cit.just.edu.jo - yazansh7@hotmail.com



## License

This project is licensed under the MIT License

