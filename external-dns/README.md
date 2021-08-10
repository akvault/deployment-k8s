## Deploy External DNS

## Prerequisite

Setting up the identity provider
To create an identity provider you need 3 things: 
- a type of identity provider
- an audience 
- provider URL. 

we will use OpenId Connect for the provider type and sts.amazonaws.com for the audience.

##### To get provider:- 

aws eks describe-cluster --name <CLUSTER_NAME> --query “cluster.identity.oidc.issuer” --output text

* The output should look something like this:

https://oidc.eks.<region>.amazonaws.com/id/EXAMPLE86F27C29EF05B482628D9790EA7066.


* Head over to the identity provider section of IAM in the AWS console and create a new provider.

* Click here - https://console.aws.amazon.com/iam/home?#/providers 

Click - Add Provider Button
Click - Open ID Connect
Provide - Provider URL (Created Above)
Provide - Audience (sts.amazonaws.com)

* Now that we have an identity provider, all that’s left to do is creating an IAM role with Route53 permissions and a trust relationship with new provider.

* First, create a new role in IAM and trust the provider by selecting Web Identity and inputting provider information

* Once this has been completed, click create a new policy and input the following in JSON:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}



  

## Installing the external DNS

kubectl config set-context --current --namespace=kube-system
  
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

RELEASE_NAME - name of the helm release, can be anything you want (external-dns for example)

DOMAIN_FILTER - name of your Route53 hosted zone if *.youlearn.link would be youlearn.link. 

HOSTED_ZONE_ID - id of your hosted zone in AWS. You can find this information in the AWS console (Route53)

ROLE_ARN - ARN of the role you created earlier in the tutorial

Once you’ve run the command you can check that your newly created service is running in your cluster:



