# Rancher

## Reset admin password

```bash
kubectl -n cattle-system exec $(kubectl -n cattle-system get pods -l app=rancher --no-headers | head -1 | awk '{ print $1 }') -c rancher -- reset-password
```

Ref. [How can I reset the administrator password?](https://ranchermanager.docs.rancher.com/faq/technical-items#how-can-i-reset-the-administrator-password)

## Read admin bootstrap password

```bash
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{"\n"}}'
```
