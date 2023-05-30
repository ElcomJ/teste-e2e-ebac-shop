FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl wget openjdk-11-jre git libgtk2.0-0 libgtk-3-0 libgbm-dev fontconfig maven \
    libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y

RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null

RUN apt-get update -y

RUN apt-get install jenkins -y

RUN apt-get update -y

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash -

RUN apt-get update -y

RUN apt-get install nodejs -y

RUN apt-get update -y

CMD ["bash"]