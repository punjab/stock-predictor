FROM python:3.10.5
WORKDIR .
RUN apt-get -y update  && apt-get install -y \
    python3-dev \
    apt-utils \
    python-dev \
    build-essential \   
&& rm -rf /var/lib/apt/lists/* 

RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -U cython
RUN pip install --no-cache-dir -U numpy
RUN pip install --no-cache-dir -U pystan

COPY requirements.txt .
RUN pip install --no-cache-dir -U -r  requirements.txt

COPY src/ .
CMD uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 8000


## Interview Readiness:
# What does it mean to create a Docker image and why do we use Docker images?
# **Ans**: Creating a docker image is a process of creating a template of a container. We use docker images to create containers. 

# Please explain what is the difference from a Container vs a Virtual Machine?
# **Ans**: A container is a lightweight virtual machine. It is a process that runs on the host machine. A virtual machine is a full-blown virtual machine that runs on a hypervisor. It is isolated from other processes on the host machine. It has its own file system, memory, CPU, and network.
# Virtual machine has its guest operating system above the host operating system, which makes virtual machines heavy. While on the other hand, Docker containers share the host operating system, and that is why they are lightweight.

# What are 5 examples of container orchestration tools (please list tools)?
# **Ans**: Kubernetes, Docker Swarm, Nomad, Mesos, and Apache Mesos.

# How does a Docker image differ from a Docker container?
# **Ans**: A Docker image is a template of a container. A Docker container is a running instance of a Docker image.