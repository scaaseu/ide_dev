FROM rocker/rstudio:4.3.0 

# system configuration
ENV DEBIAN_FRONTEND=noninteractive
ENV PYODIDE_CDN="https://cdn.jsdelivr.net/pyodide/v0.23.2/full/"
ENV CRAN_MIRROR="https://cloud.r-project.org"
ENV USER="rstudio"
RUN usermod -aG sudo rstudio
RUN echo "${USER}:4815162342" | chpasswd
RUN mkdir -p "/home/rstudio/.jupyter"
RUN mkdir -p "/home/rstudio/.vim/pack/plugins/start"
RUN mkdir -p "/home/rstudio/persistent" && chmod -R 775 "/home/rstudio/persistent"
VOLUME /home/rstudio/persistent
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
		neovim 

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
		rstudioapi \
		roxygen2 \
		lintr \
		testthat \
		log4r \
		future \
		docstring \			
		js \		
		Rcpp \			
		reticulate \
		fasttime \ 		
		tidyverse \
		RColorBrewer \
		imager \		
		flextable \
		knitr \
		rmarkdown \ 		
		openxlsx \
		yaml \			
		rjson \
		RSQLite \
		shiny \
		shinydashboard \
		htmltools \
		plotly \
		rgdal \ 
		leaflet \
		mapview \
		adehabitatHR \
		hms \
		suncalc
		
# spin up RStudio server, JupyterLab, .NET 6, nodejs, and customized VI editor 
ENTRYPOINT [ "/entrypoint.sh" ]