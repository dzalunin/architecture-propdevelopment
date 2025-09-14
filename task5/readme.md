# Подготовка
```
cd ./task5/scripts
chmod +x ./*.sh
```

# Создание сервисов

```
./create_services.sh
namespace/tenant created
deployment.apps/admin-back-end-api-app created
service/admin-back-end-api-app created
deployment.apps/admin-front-end-app created
service/admin-front-end-app created
deployment.apps/back-end-api-app created
service/back-end-api-app created
deployment.apps/front-end-app created
service/front-end-app created
networkpolicy.networking.k8s.io/deny-all created
networkpolicy.networking.k8s.io/allow-dns created
networkpolicy.networking.k8s.io/allow-frontend-to-backend-api created
networkpolicy.networking.k8s.io/frontend-egress-only-backend created
networkpolicy.networking.k8s.io/allow-admin-frontend-to-admin-backend-api created
networkpolicy.networking.k8s.io/admin-frontend-egress-only-admin-backend created
```

# Проверка

```
./check.sh
Front-end pod: front-end-app-856c4d6998-czjbb
Admin Front-end pod: admin-front-end-app-89975fcf8-q7q26
Back-end API svc: 10.43.144.239
Admin Back-end API svc: 10.43.196.186

[front-end-app-856c4d6998-czjbb → back-end-api] + доступно
[front-end-app-856c4d6998-czjbb → admin-back-end-api] x запрещено
[admin-front-end-app-89975fcf8-q7q26 → back-end-api] x запрещено
[admin-front-end-app-89975fcf8-q7q26 → admin-back-end-api] + доступно
```