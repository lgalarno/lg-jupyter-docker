# Python jupyter notebook in docker

This is the repository to generate a docker image for jupyter notebook.


## Configuration ##
from notebook.auth import passwd
passwd()

default: abc

set .env

in requirement.txt:

scikit-learn
opencv-contrib-python
numpy
pandas
tensorflow
keras
# pytorch (cpu)
torch==1.5.0+cpu
torchvision==0.6.0+cpu
fastai


## Installation Instructions ##

Build the Docker image locally

You can build the images locally from this GitHub repository. Note that building the image may take a few minutes depending on your machine.

* git clone git@github.com:lgalarno/telomerehunterMPU-docker.git

* cd telomerehunterMPU-docker

* docker build -t lg-jupyter-docker -f Dockerfile .


## Usage

docker run -v /LOCAL-PATH:/app/data -it -p 8888:8888 lg-jupyter-docker

### parameters
- LOCAL-PATH : the path to the storage spce on your server. This is where your noteboks can be saved and kept.


## Notes

* The repository was inspired by: https://github.com/codingforentrepreneurs/Jupyter-x-Docker-on-Heroku .
