FROM debian:10.1

LABEL "version"="0.0.6"
LABEL "com.github.actions.name"="Debug APK Publisher"
LABEL "com.github.actions.description"="Build & Publish Debug APK on Github"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/ShaunLWM/action-release-debugapk"
LABEL "maintainer"="ShaunLWM"

RUN apt update \
	&& apt -y upgrade \
	&& apt -y install curl 

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |\
 	dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
 	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |\
 	tee /etc/apt/sources.list.d/github-cli.list > /dev/null

RUN apt update \
	&& apt install -y gh \
	&& apt autoremove \
	&& apt autoclean \
	&& apt clean

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
