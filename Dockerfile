FROM ubuntu:18.04 AS build

WORKDIR /build
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential libboost-dev libboost-date-time-dev libmysql++-dev libglib2.0-dev libgsl-dev
COPY . /build
RUN make


FROM ubuntu:18.04

WORKDIR /srv
ENV PATH "/srv:${PATH}"
RUN useradd -ms /bin/bash aga
RUN apt-get update \
  && apt-get install -y libgsl23 libgslcblas0 libmysql++3v5 libboost-date-time1.65.1 libglib2.0-0 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build --chown=aga:aga /build/bayrate /build/check /srv/
USER aga
ENTRYPOINT ["/bin/bash", "-l", "-c"]
