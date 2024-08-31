# Dockerized AWS CLI on Ubuntu

This repository provides a Docker setup for running the AWS CLI within an Ubuntu environment. The setup includes a `Dockerfile` to build the image and a `Makefile` to streamline common tasks such as building the image, running the container, and configuring AWS credentials.

## Prerequisites

Before you begin, ensure that you have the following software installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/)

### Step 1: Configure AWS Credentials

Create a .env.local file in the root of the project directory. This file should contain your AWS credentials and the default region. The .env-example file with real values:

<pre>
    <code>
        AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE 
        AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY 
        AWS_DEFAULT_REGION=eu-south-2 
    </code>
 </pre>

### Step 2: Build the Docker Image

<pre>
    <code>
        make build
    </code>
 </pre>

Build command will automatically export as env variables the configured aws credentials.

 ### Step 4: Run the Docker Container

 <pre>
    <code>
        make run
    </code>
 </pre>

 This command starts a Docker container with an interactive bash shell.

### Contributions

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or fixes.