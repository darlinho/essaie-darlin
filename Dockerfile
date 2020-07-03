FROM ubuntu:18.04

MAINTAINER tnougosso <tnougosso@irex.aretex.ca>

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc
  
  COPY conf/forward.dev.irex.aretex.ca.db /etc/bind/
