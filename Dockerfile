FROM swift
WORKDIR /app
ADD . ./

RUN apt-get -qq update
RUN apt-get update && apt-get install -y libicu-dev
RUN apt-get install -yq libssl-dev

RUN swift package clean
RUN swift build -c release
RUN mkdir /app/bin
RUN mv `swift build -c release --show-bin-path` /app/bin
EXPOSE 8090
ENTRYPOINT ./bin/release/Run -e prod -b 0.0.0.0 --port 80
