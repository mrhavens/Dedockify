#!/usr/bin/python3

import docker

cli = docker.APIClient(base_url='unix://var/run/docker.sock')
print (cli.history('example'))
