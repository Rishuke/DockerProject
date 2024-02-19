#!/bin/bash
cargo install diesel_cli --no-default-features --features postgres

diesel migration run

cargo run