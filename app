#app.py
#!/usr/bin/env python3

import aws_cdk as cdk

#from ec2_isolation_cdk_demo.ec2_isolation_cdk_demo_stack import Ec2IsolationCdkDemoStack
from ec2_isolation_cdk_demo.pipeline_stack import PipelineStack
#INSTANCE_ID = 'i-02794c41318d77d39'
#VPC_ID =  'vpc-0bd4b61810acf1bbe'
app = cdk.App()

accountid = app.node.try_get_context("accountid")
region = app.node.try_get_context("region")
vpc_id = app.node.try_get_context("VPC_ID")

env_EU = cdk.Environment(account=accountid, region=region)

#PipelineStack(app, "pipelineStack", env=cdk.Environment(account="600032437742", region="eu-central-1"), vpc_id=VPC_ID)
PipelineStack(app, "pipelineStack", env=env_EU, vpc_id=vpc_id)

app.synth()
