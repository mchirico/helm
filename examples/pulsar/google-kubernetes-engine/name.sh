pulsar-admin tenants create ten --admin-roles admin --allowed-clusters gke_mchirico_us-central1-a_pulsar-gke-cluster

bin/pulsar initialize-cluster-metadata \
  --cluster pulsar-gke \
  --zookeeper zookeeper \
  --global-zookeeper zookeeper \
  --web-service-url http://broker.default.svc.cluster.local:8080/ \
  --broker-service-url pulsar://broker.default.svc.cluster.local:6650/

alias pulsar-admin='kubectl exec pulsar-admin -it -- bin/pulsar-admin'
pulsar-admin tenants create ten --admin-roles admin --allowed-clusters pulsar-gke
pulsar-admin namespaces create ten/ns

pulsar-admin namespaces delete tt/ns
pulsar-admin tenants delete tt



alias pulsar-perf='kubectl exec pulsar-admin -it -- bin/pulsar-perf'
pulsar-perf produce persistent://ten/us-central/ns/my-topic \
  --rate 10000

