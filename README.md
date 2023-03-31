# Python jupyter notebook in docker

This is the repository to generate a docker image for jupyter notebook for a personnal use. This is NOT for  jupyter hub installation!


## Configuration ##

### 1. The first step is to edit the .env file in the conf folder.

#### 1.1. password
As is, the default password is hardcoded to be abc 
To use your own password use the following commands in ipython, or in a jupyter notebook:
 
from notebook.auth import passwd
passwd()

This will generate a hash for your password. Replace the default hash in the .env file with your hashed password

#### 1.2. IP
If the docker file is intended to be served by a web server, put the domain name or your public IP address that will be allowed to use the image in the .env file in the IP field. See the option c.NotebookApp.allow_origin in the Jupyter Notebook configuration.

#### 1.3. PORT
Set the listening internal port the .env file. This should be synchronized with the docker run command below.

### 2. In a second step, you can configure the default set of pre-installed packages by editing the requirement.txt file in the conf folder. By default the following packages are installed:

- scikit-learn
- opencv-contrib-python
- numpy
- pandas
- tensorflow
- keras
- fastai

### #pytorch (cpu)
- torch==1.5.0+cpu
- torchvision==0.6.0+cpu

## Installation Instructions ##

You have to build the images locally after cloning this GitHub repository. Note that building the image may take a few minutes depending on your machine.

* git clone git@github.com:lgalarno/lg-jupyter-docker.git

* cd lg-jupyter-docker

* docker build -t lg-jupyter-docker -f Dockerfile .

* create a local folder to allow storing your noteboks. See the parameters in usage, below.
## Usage

docker run -v /LOCAL-PATH:/app/data -it -p 8888:8888 lg-jupyter-docker

### parameters
- LOCAL-PATH : the path to the storage spce on your server. This is where your noteboks can be saved and kept.
- -p : The listening port can be changed, but be sure to synchronize with the .env file configuration above.

## Notes

* You can find document on how to deploy a docker image in a production server. WARNING: this is intended for a simple personnal jupyter notebook, with a simple password to log in. For more robust and secured applications, please read the Jupiter Notebook documentation. You may also be interested to set up a Jupyter hub server.  
* The repository was inspired by: https://github.com/codingforentrepreneurs/Jupyter-x-Docker-on-Heroku 