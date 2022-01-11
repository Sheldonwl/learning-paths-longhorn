# Important Prerequisites

- open-iscsi
- NFSv4 client

## Environment Check Script
See: https://longhorn.io/docs/1.2.3/deploy/install/#using-the-environment-check-script

``` 
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.2.3/scripts/environment_check.sh | bash
```

## Install open-iscsi
See: https://longhorn.io/docs/1.2.3/deploy/install/#installing-open-iscsi


ISCSI installer:
```
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.1.1/deploy/prerequisite/longhorn-iscsi-installation.yaml
kubectl get pod | grep longhorn-iscsi-installation
```

## Install NFSv4 client (when using the experimental RWX feature)
See: https://longhorn.io/docs/1.2.3/deploy/install/#installing-nfsv4-client

For SLES and openSUSE: 
```
zypper install open-iscsi
```

For Debian and Ubuntu: 
```
apt install nfs-common -y
```

# Tips 

## Single Node Deployment
- Set the default volume replica count to 1, in the Longhorn UI or when creating a new storageClass. 
- Or enable Replica Node Level Soft Anti-Affinity, however this is not as useful for just 1 node. It is useful if you have a 2 node cluster and want some resiliency. 

## RPO / RTO 
See: https://longhorn.io/docs/1.2.3/concepts/#34-backupstore-update-intervals-rto-and-rpo 
- Adjust the Recovery Point Objective (RPO) by setting a recurring backup interval.
- Adjust the Recovery Time Objective (RTO) by changing the Backupstore Poll Interval setting in the backup cluster.