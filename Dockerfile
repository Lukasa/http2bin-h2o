FROM ubuntu:trusty

ENV SHA=b40d531d1a7fa8b7ae8a4d9979077465ca0a2972

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget cmake libyaml-dev libssl-dev build-essential

RUN \
  wget https://github.com/h2o/h2o/archive/${SHA}.tar.gz && \
  tar -xzvf ${SHA}.tar.gz && \
  cd h2o-${SHA} && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local . && \
  make && \
  make install

ADD rp.conf /etc/h2o/rp.conf
ADD server.crt /etc/h2o/server.crt
ADD server.key /etc/h2o/server.key

EXPOSE 80 443

CMD ["h2o", "-c", "/etc/h2o/rp.conf"]
