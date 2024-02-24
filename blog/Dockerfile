FROM rustlang/rust:nightly

COPY . /usr/src/blog

WORKDIR /usr/src/blog


RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

#RUN cargo install diesel_cli --no-default-features --features postgres


ENV PATH="/root/.cargo/bin:${PATH}"

