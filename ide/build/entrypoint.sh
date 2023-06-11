#!/bin/bash
set -e
echo "activating python venv for reticulate"
source /home/rstudio/venv/bin/activate
echo "spinning up IDE"
(trap 'kill 0' SIGINT; jupyter-lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' --port=4815 --allow-root & /usr/lib/rstudio-server/bin/rserver --server-daemonize 0 --auth-none 1)