# OpenAPI Generator Config for ratenkaufbyeasycredit-v3 API's 

This repository holds the OpenAPI specifications of the ratenkauf by easyCredit API v3 (payment, merchant, calculator) and the configuration files to generate clients for different programming languages, most importantly the PHP client.

## API Docs

The automatically generated API docs can be found here:
https://netzkollektiv.github.io/ratenkaufbyeasycredit-api-v3/

The docs include the payment, merchant and calculation API.

## PHP Generator Configuration & Templates

The main goal is to generate a universal PHP API client for the v3 API. The client itself will not be part of this repository.
The current version (work in progress) can be found here: https://github.com/netzkollektiv/ratenkaufbyeasycredit-payment-api-v3-php

### Generate the client

The client can be generated using the commands in the `package.json` or by simply using the commands with `yarn` or `npm run`. Before the codegen works, the `openapi.yaml` file needs to be converted to JSON using the `convert-spec` command

```
yarn install
./converter/merge.sh
yarn codegen:php
``` 

