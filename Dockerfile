# Light version of docker, which run the docker in python
FROM python:3.7-alpine
# Choose any name to maintain your docker image
MAINTAINER DB App Developer

# python environment - it doesn't allow buffer output
ENV PYTHONUNBUFFERED 1

# Dependencise - which will copy json directory of a dockerfile and copy all the docker image
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
# it will copy the docker image requirements.txt and store into the pip
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# It will create a empty folder on our docker image 'app'
RUN mkdir /app
# Then it'll switches on that default directory
# So any application we run from the docker container, it will start run from this location
WORKDIR /app
# this will allow to copy the app folder from the local machine to docker image
COPY ./app /app

# it will create a user, -D allows us to running application only
RUN adduser -D user
# This user switches docker to the user we created
USER user
# We've created a seperate user for the security purpose, to protect our docker image
