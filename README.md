# Introduction

## Getting started

This guide details the process of setting up a Bloxberg validator node using a Docker image.

Validator nodes play a crucial role in the Bloxberg blockchain by verifying transactions and contributing to the consensus mechanism.

## System Requirements

· Operating System: Ubuntu 22.04 or later (Other OSes may be compatible with adjustments)
· CPU: Minimum 4 cores
· RAM: Minimum 4GB
· Storage: Recommended 250GB SSD (more for futureproofing)
· Firewall: Port 30303 open for communication with other nodes
· CPU Instruction Set: AES support (verify with cat /proc/cpuinfo for "aes" in flags)

## Steps

### Clone the Repository

· Access the server where you'll host the validator node.
· Utilize a Git client to clone the bloxberg-validator-node repository.

### Configure the Validator

· Edit the docker-compose.yml file with a text editor (e.g., nano or vim).
· Locate the NATIP variable and replace it with your server's external IP address.
· Save the changes.

### Set Validator Password

· Navigate to the src/validator-data directory.
· Open the validator/validator.pwd file using a text editor.
· Create a strong password to encrypt your private key.
· Save the password securely.

### Initial Setup

· Navigate to the src/ directory.
· Execute the script with the command `sudo ./setup.sh.`

### Start the Validator

· Return to the root directory (/) on the server.
· Run the `command docker-compose up` in the terminal.
· This initiates the Docker container and generates an Authority Address.

### Register with Bloxberg Association

· Copy the Authority Address obtained in step 5.
· Provide this address to the Bloxberg Association for registration purposes.

### Run the Validator in Background

· Terminate the currently running container by pressing Ctrl+C.
· To execute the validator in the background, use the command `docker-compose up -d`

## Important Notes

· The specified system requirements represent minimums. Allocate more resources for optimal performance and stability.
· Ports 8545 (JSON-RPC API) and 8546 (Web-Socket) are used for local interaction with the blockchain and do not necessitate internet exposure.
· This guide assumes familiarity with working on the command line and editing text files.

## Additional Resources

· bloxberg-validator-node repository: https://github.com/bloxberg-org/bloxberg-validator-node
