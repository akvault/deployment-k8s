helm install <RELEASE_NAME> stable/external-dns \
--set provider=aws \
--set domainFilters[0]=<DOMAIN_FILTER>\
--set policy=sync \
--set registry=txt \
--set txtOwnerId=<HOSTED_ZONE_ID> \
--set interval=3m \
--set rbac.create=true \
--set rbac.serviceAccountName=external-dns \
--set rbac.serviceAccountAnnotations.eks\.amazonaws\.com/role-arn=<ROLE_ARN>

