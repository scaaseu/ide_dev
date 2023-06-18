FROM rocker/rstudio:4.3.0 

# system configuration
ENV ENVIRONMENT_NAME="dev"
ENV R_INSTALL_STAGED="FALSE"
ENV DEBIAN_FRONTEND=noninteractive
ENV PYODIDE_CDN="https://cdn.jsdelivr.net/pyodide/v0.23.2/full/"
ENV CRAN_MIRROR="https://cloud.r-project.org"
ENV USER="rstudio"
RUN usermod -aG sudo rstudio
RUN echo "${USER}:4815162342" | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p "/home/rstudio/.jupyter"
RUN mkdir -p "/home/rstudio/.vim/pack/plugins/start"
RUN mkdir -p "/home/rstudio/sourcecode"
WORKDIR /home/rstudio
COPY requirements.txt /home/rstudio/requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8787 4815

# install linux dependencies
RUN apt-get update --fix-missing \
	&& apt-get install -y \
		ca-certificates \
		build-essential \
		apt-transport-https \
		sudo \
		net-tools \
		putty-tools \
		libprotobuf-dev \
		protobuf-compiler \
		cmake \		
		libcurl4-gnutls-dev \ 
		libxml2-dev \ 
		libssl-dev \		    	
		libglib2.0-0 \
		libgdal-dev \
		libudunits2-dev \
		libxext6 \
	   	libsm6  \		
		r-cran-rgdal \
		r-cran-raster \
		libsqlite3-dev \		
	   	libxrender1 \
		libxml2-dev \
		libsndfile1 \
		libx11-dev \
		libatlas-base-dev \
		libgtk-3-dev \
		libboost-all-dev \
		libboost-python-dev \
		openssl \
		python3-openssl \
		pkg-config \
		wget \
		dos2unix \
		bash-completion \
		r-cran-reticulate \
		nodejs \
		npm	\
		dotnet6 \
		vim \
		python3-neovim \
		neovim \
		gnucobol

# install python dependencies
RUN npm install pyodide
RUN apt-get -y install python3 python3-pip python3.10-venv
RUN python3 -m venv /home/rstudio/venv
RUN /home/rstudio/venv/bin/pip3 install --upgrade pip setuptools wheel
RUN /home/rstudio/venv/bin/pip3 install -r /home/rstudio/requirements.txt
ENV RETICULATE_PYTHON="/home/rstudio/venv/bin/python"
		
# install R packages
RUN install2.r --error --repos ${CRAN_MIRROR}\
		renv \		
		devtools \
		usethis \
		rstudioapi \
		roxygen2 \
		lintr \
		testthat \
		log4r \
		future \
		docstring \			
		js \		
		Rcpp \
		oysteR \		
		reticulate \
		fasttime \ 		
		tidyverse \
		RColorBrewer \
		imager \		
		flextable \
		knitr \
		rmarkdown \ 
		highcharter \		
		openxlsx \
		yaml \
		pool \		
		rjson \
		RPostgres \
		RPostgreSQL \
		RSQLite \
		shiny \
		shinydashboard \
		shinyjs \
		htmltools \
		plotly \
		rgdal \ 
		leaflet \
		mapview \
		adehabitatHR \
		hms \
		suncalc

RUN sudo chown -R rstudio:rstudio /home
RUN sudo chown -R rstudio:rstudio /usr
RUN echo 'Sys.setenv(R_INSTALL_STAGED = FALSE)' >> /home/rstudio/.Rprofile  
	
# spin up RStudio server, JupyterLab, .NET 6, nodejs, and customized VI editor 
ENTRYPOINT [ "/entrypoint.sh" ]