DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $DIR

[ -d ./dist ] || mkdir ./dist
[ -d ./src ] || mkdir ./src

curl -o ./src/payment-api.yaml https://ratenkauf.easycredit.de/api/payment/v3/openapi
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/payment-api.yaml > ./dist/payment-api.json

curl -o ./src/merchant-api.yaml https://partner.easycredit-ratenkauf.de/api/merchant/v3/openapi
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/merchant-api.yaml > ./dist/merchant-api.json
sed -i 's/OrderDetails"/TransactionOrderDetails"/g' ./dist/merchant-api.json
sed -i 's/Customer"/TransactionCustomer"/g' ./dist/merchant-api.json

curl -o ./src/calculator-api.yaml https://ratenkauf.easycredit.de/api/ratenrechner/v3/openapi
docker run --rm -v ${DIR}:/workdir mikefarah/yq eval -o=json ./src/calculator-api.yaml > ./dist/calculator-api.json

npx openapi-merge-cli -c config.json
