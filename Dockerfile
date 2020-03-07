FROM 1.41.1-buster AS binarybuilder
RUN apt-get update && apt-get install git
RUN rustup component add rustfmt
RUN git clone https://github.com/toshi-search/Toshi toshi
RUN cd toshi && cargo build --release

FROM debian:buster
COPY --from=binarybuilder /toshi/target/release/toshi /bin/toshi
COPY start.sh /

ENV PORT=8080 DATAPATH=data/ WRITERMEMORY=200000000 LOGLEVEL=info JSONPARSINGTHREADS=4 BULKBUFFERSIZE=10000 AUTOCOMMITDURATION=10 KIND=log MINMERGESIZE=8 MINLAYERSIZE=10_000 LEVELLOGSIZE=0.75

EXPOSE 8080

RUN chmod +x start.sh
CMD ["./start.sh"]