## Run the IDE
The needed pre-requisites for this IDE is an installed docker on your local computer. Switch in your terminal to the root path of this git repository, and execute:

docker-compose up 

After this command you can open your web browser and navigate to RStudio or Jupyter Lab. 

RStudio with reticulate: http://localhost:8787

Jupyter Lab: http://localhost:4815


## Description

The purpose of this project is to provide an out of the box DEV data science ready internal development environment (IDE).
 
Use cases: 
- all developers in a team has the same environment, which leads in general to less technical debts of a project. 
- accelerate the process of setting up an environment for new projects.
- provide students a common environment for teaching courses
- and many more...

As the aim of this is to have a fast local DEV IDE all authentification mechanisms where deactivated. Local development! Therefore => do not run this in the cloud, or if then hide this IDE behind an auth page, in example: reverse proxy -> shiny proxy -> this IDE  

As this IDE has general development purpose it offers much more then for i.e. a R package development is needed. 



