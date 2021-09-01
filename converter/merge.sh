DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $DIR

[ -d ./dist ] || mkdir ./dist
[ -d ./src ] || mkdir ./src

curl -o ./src/payment-api.yaml https://raw.githubusercontent.com/teambank/ratenkaufbyeasycredit-payment-api-v3/main/openapi.yaml
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/payment-api.yaml > ./dist/payment-api.json
curl -o ./src/merchant-api.yaml https://raw.githubusercontent.com/teambank/ratenkaufbyeasycredit-merchant-api-v3/main/openapi.yml
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/merchant-api.yaml > ./dist/merchant-api.json

# calculator-api.yaml not yet publicly available
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/calculator-api.yaml > ./dist/calculator-api.json

npx openapi-merge-cli -c config.json
