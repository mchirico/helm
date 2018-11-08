pulsar-admin tenants create ten --admin-roles admin --allowed-clusters gke_mchirico_us-central1-a_pulsar-gke-cluster

bin/pulsar initialize-cluster-metadata \
  --cluster pulsar-gke \
  --zookeeper zookeeper \
  --global-zookeeper zookeeper \
  --web-service-url http://broker.default.svc.cluster.local:8080/ \
  --broker-service-url pulsar://broker.default.svc.cluster.local:6650/


pulsar-admin tenants create ten --admin-roles admin --allowed-clusters pulsar-gke
pulsar-admin namespaces create ten/ns

pulsar-admin namespaces delete tt/ns
pulsar-admin tenants delete tt



