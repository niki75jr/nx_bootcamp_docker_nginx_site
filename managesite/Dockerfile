FROM ubuntu:18.04

# RUN apt update && apt install python3 python-pip mkdocs curl -y \

RUN apt update && apt install python3 python-pip mkdocs curl -y \
	&& pip install mkdocs

WORKDIR /site/manage/

COPY ./src/docker-entrypoint.sh /site/manage/
COPY ./src/docs/ /site/manage/site/docs/
COPY ./src/mkdocs.yml /site/manage/site/

RUN mkdocs new site \
	&& curl https://raw.githubusercontent.com/niki75jr/nx_bootcamp_nix_diary/main/README.md > index.md \
	&& curl https://raw.githubusercontent.com/niki75jr/nx_bootcamp_docker_nginx_site/main/README.md > second.md

WORKDIR /site/manage/site

ENTRYPOINT ["../docker-entrypoint.sh"]
