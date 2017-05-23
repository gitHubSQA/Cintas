FROM openjdk:jre-alpine

MAINTAINER Jefry D. <jefry.denny@sap.com>
LABEL name="Docker image for the Robot Framework http://robotframework.org/"

# Install  Python ***
RUN apk add --update --no-cache \
    python2 \
    py-pip \
    git \
    openssh

# Install: Robot-Framework, Selenium and dependencies ****cd
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

# Add Code Repository ****
RUN mkdir /gitProjectCode
ADD Project_Files/git_code_repository/ gitProjectCode/

# Add selenium drivers ****
COPY Project_Files/selenium_drivers/chromedriver /usr/bin
COPY Project_Files/selenium_drivers/geckodriver /usr/bin

# Set ENV ****
ENV PATH /usr/bin:$PATH
ENV PATH /usr/local/bin:$PATH
ENV PATH /usr/lib/python2.7/site-packages:$PATH

# Set The WORKDIR ****
WORKDIR /gitProjectCode/hybris-automation-cintas/

#  Run a script: Initializes and updates submodule for hybris-automation-shared ****
#RUN chmod +x /gitProjectCode/hybris-automation-cintas/run_init.sh
#RUN /gitProjectCode/hybris-automation-cintas/run_init.sh

RUN chmod +x run_init.sh
RUN run_init.sh
