FROM openjdk:jre-alpine

MAINTAINER Jefry D. <jefry.denny@sap.com>
LABEL name="Docker image for the Robot Framework http://robotframework.org/"

## Install  Python ***
RUN apk add --update --no-cache \
    python2 \
    py-pip \
    git \
    openssh

## Install: Robot-Framework, Selenium and dependencies ****
RUN pip install -U \
    robotframework \
    robotframework-pabot \
    selenium==2.53.6 \
    robotframework-selenium2library \
    robotframework-ftplibrary \
    robotframework-excellibrary \
    robotframework-sudslibrary \
    robotframework-requests \
    robotframework-faker \
    requests \
    simplejson \
    beautifulsoup4 \
    python-dateutil \
    certifi \
    urllib3



##  Run a script: Initializes and updates submodule for hybris-automation-shared **** TODO: this part should have been done BEFORE
# RUN chmod +x /gitProjectCode/hybris-automation-cintas/run_init.sh
# RUN /gitProjectCode/hybris-automation-cintas/run_init.sh


## Add Code Repository ****
RUN mkdir /gitProjectCode
#ADD Project_Files/git_code_repository/ gitProjectCode/
#ADD ./Automation/Cintas/Project_Files/git_code_repository/ gitProjectCode/

## Add selenium drivers ****
COPY ./selenium-webdriver/selenium_drivers/chromedriver /usr/bin
COPY ./selenium-webdriver/selenium_drivers/geckodriver /usr/bin

## Set ENV ****
ENV PATH /usr/bin:$PATH
ENV PATH /usr/local/bin:$PATH
ENV PATH /usr/local/lib:$PATH
ENV PATH /usr/lib/python2.7/site-packages:$PATH

## Set The WORKDIR ****
WORKDIR /gitProjectCode/hybris-automation-cintas/
