FROM jenkins/jenkins:jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release curl ca-certificates gnupg2 git sudo apt-transport-https
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs 2>/dev/null) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli docker-compose-plugin \
    && apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins
RUN jenkins-plugin-cli --plugins "scm-api git-client git"