FROM ubuntu:18.04 AS build

WORKDIR /build
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y build-essential libboost-dev libboost-date-time-dev libmysql++-dev libglib2.0-dev libgsl-dev
COPY . /build
RUN make


FROM ubuntu:18.04

WORKDIR /srv
RUN useradd -ms /bin/bash aga
ENV PATH="/srv:${PATH}"
RUN echo "export PATH=/srv:$PATH" >> /etc/environment
RUN apt update && apt install -y libgsl23 libgslcblas0 libmysql++3v5 libboost-date-time1.65.1 libglib2.0-0
COPY --from=build --chown=aga:aga /build/bayrate /build/check /build/basicrate /build/copyMembership /build/syncDBs /srv/
USER aga
ENTRYPOINT ["/bin/bash", "-l", "-c"]
