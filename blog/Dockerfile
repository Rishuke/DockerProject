FROM rustlang/rust:nightly



WORKDIR /usr/src/blog

COPY . . 

RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo install diesel_cli --no-default-features --features postgres

RUN cargo install --path .

RUN cp /usr/local/cargo/bin/blog .

CMD diesel migration run && ./blog 