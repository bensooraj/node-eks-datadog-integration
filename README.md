To test the API locally:

```sh
$ kubectl port-forward service/eks-datadog-demo-node-app 8080:8080
```

```
$ helm install datadog-agent -f datadog/values.yml  --set datadog.apiKey=<DATADOG_API_KEY> datadog/datadog
```