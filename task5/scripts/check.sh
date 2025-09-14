#!/bin/bash
NAMESPACE=tenant

FRONTEND_POD=$(kubectl -n $NAMESPACE get pod -l role=front-end -o jsonpath='{.items[0].metadata.name}')
ADMIN_FRONTEND_POD=$(kubectl -n $NAMESPACE get pod -l role=admin-front-end -o jsonpath='{.items[0].metadata.name}')

BACKEND_API_SVC=$(kubectl -n $NAMESPACE get svc -l role=back-end-api -o jsonpath='{.items[0].spec.clusterIP}')
ADMIN_BACKEND_API_SVC=$(kubectl -n $NAMESPACE get svc -l role=admin-back-end-api -o jsonpath='{.items[0].spec.clusterIP}')

echo "Front-end pod: $FRONTEND_POD"
echo "Admin Front-end pod: $ADMIN_FRONTEND_POD"
echo "Back-end API svc: $BACKEND_API_SVC"
echo "Admin Back-end API svc: $ADMIN_BACKEND_API_SVC"
echo

function test_conn() {
  POD=$1
  DEST=$2
  NAME=$3

  echo -n "[$POD → $NAME] "
  kubectl -n $NAMESPACE exec -it $POD -- wget -qO- http://$DEST:80 --timeout=3 >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "+ доступно"
  else
    echo "x запрещено"
  fi
}

test_conn $FRONTEND_POD $BACKEND_API_SVC "back-end-api"
test_conn $FRONTEND_POD $ADMIN_BACKEND_API_SVC "admin-back-end-api"

test_conn $ADMIN_FRONTEND_POD $BACKEND_API_SVC "back-end-api"
test_conn $ADMIN_FRONTEND_POD $ADMIN_BACKEND_API_SVC "admin-back-end-api"
