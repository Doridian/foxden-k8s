helm repo add postgres-operator-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator
helm repo add postgres-operator-ui-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator-ui
helm repo add redis-operator https://spotahome.github.io/redis-operator
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.8.0

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

kubectl create namespace postgresql
helm install postgres-operator postgres-operator-charts/postgres-operator --namespace=postgresql
helm install postgres-operator-ui postgres-operator-ui-charts/postgres-operator-ui --namespace=postgresql

helm install redis-operator redis-operator/redis-operator --namespace=redis-operator --create-namespace
