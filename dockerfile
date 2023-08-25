FROM ubuntu:20.04



WORKDIR /myBlog

ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y golang-go
RUN apt-get install -y --reinstall ca-certificates
ADD golangGinBlog.tar.gz /myBlog/

WORKDIR /myBlog/golangGinBlog
RUN go mod download

CMD /bin/bash