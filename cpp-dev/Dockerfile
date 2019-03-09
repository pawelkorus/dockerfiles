FROM debian:sid-slim

ARG USER_ID=1000
ARG USER_GROUP_ID=1000

RUN groupadd -g $USER_GROUP_ID user && useradd -m -u $USER_ID -g user user

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                libcurl4-openssl-dev libssl-dev uuid-dev zlib1g-dev ca-certificates \ 
                git cmake vim less valgrind gdb qtcreator make g++ gettext strace less \
        && rm -rf /var/lib/apt/lists/*

USER user

CMD ["qtcreator"]
