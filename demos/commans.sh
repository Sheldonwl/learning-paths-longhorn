## Disaster Recovery Volume Demo

## Add the Bitnami repo to Helm
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

## Install Wordpress with Longhorn persistant volume. DON'T FORGET TO CHANGE THE PASSWORD.
helm install wordpress bitnami/wordpress --set persistence.accessMode=ReadWriteOnce --set global.storageClass=longhorn --set persistence.size=8Gi --set volumePermissions.enabled=true --set image.debug=true --set ingress.enabled=true --set ingress.hostname=sslip.io --set mariadb.auth.rootPassword=supaS3crt --set wordpressPassword=supaS3crt

## Install Wordpress using existing PVC's after activating the Disaster Recovery volume
helm install wordpress bitnami/wordpress --set persistence.accessMode=ReadWriteOnce  --set image.debug=true --set persistence.enabled=true --set ingress.enabled=true --set ingress.hostname=sslip.io --set persistence.existingClaim=data-wordpress-mariadb-0 --set persistence.existingClaim=wordpress --set mariadb.auth.rootPassword=supaS3crt --set wordpressPassword=supaS3crt