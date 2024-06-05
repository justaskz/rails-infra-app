# README

Supported environments:
`docker` - docker-compose

Before launching, make sure that `.env` is present and defines these variables:
```bash
#!/usr/bin/env bash

export MYSQL_HOST=localhost
export MYSQL_USERNAME=app
export MYSQL_PASSWORD=app
export MYSQL_PORT=3306
```

# ---
# on:
#   push:
#     branches:
#       - **

# jobs:
#   test:
#     name: Run RSpec tests
#     runs-on: self-hosted
#     steps:
#       - name: Checkout code
#         uses: actions/checkout@v2

#       - name: Build Docker image
#         run: docker build --tag infra-app:test .

#       - name: Run test
#         run: docker run infra-app:test rspec
