#!/bin/bash

# IMPRTANT: it will load code from the /data volume

# docker run --rm -v "${PWD}":/data -t -i log4jdetect /bin/sh
docker run --rm -v "${PWD}":/data log4jdetect