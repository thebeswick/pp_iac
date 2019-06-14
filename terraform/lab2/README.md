![Terraform Logo](https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.packet.com%2Fmedia%2Fpages%2Fimages%2F0f49c89d1e7298bb9930789c8ed59d48%2F3K3l-terraform.400x400_350.png&f=1)
# Lab 2 Getting Started with Terraform

1.  Install Terraform with Chocolatey
`choco install terraform`
2. Go in to your AWS EC2 console and create a "Key Pair"  called "iac_demo", then relocate the download "iac_demo.pem" from your downloads directory to  ```C:\Users\<username>\.ssh``` (create the .ssh directory if necessary). Note that terraform picks up the AWS credentials from environment variables.
3. Open a Git bash window and navigate to the terraform/lab1 dir in the github repo you downloaded in the Packer lab
4. Inspect the contents of each of the .cf files, terraform will parse every file in the directory that has a .cf extension
5. Edit the ```resources.tf``` and change the AMI name to the AMI name you created with Packer in lab1
6. Initialise terraform
```terraform init```
7. Validate the config
`terraform validate`
8. Now run terraform plan, and check the resulting output as per the example below

`terraform plan`

```yaml   
    Refreshing Terraform state in-memory prior to plan...
    The refreshed state will be used to calculate this plan, but will not be
    persisted to local or remote state storage.
    ------------------------------------------------------------------------
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
        create
    Terraform will perform the following actions:
        aws_ebs_volume.iac_ebs_volume
          id:                                          <computed>
          arn:                                         <computed>
          availability_zone:                           "${aws_subnet.sub_pub_iac_demo.availability_zone}"
          encrypted:                                   <computed>
          iops:                                        <computed>
          kms_key_id:                                  <computed>
          size:                                        "1"
          snapshot_id:                                 <computed>
          tags.%:                                      "1"
          tags.Name:                                   "iac-EBS-volume"
          type:                                        <computed>
        aws_instance.iac_ec2_instance
          id:                                          <computed>
          ami:                                         "ami-001dae151248753a2"
          arn:                                         <computed>
          associate_public_ip_address:                 <computed>
          availability_zone:                           "${aws_subnet.sub_pub_iac_demo.availability_zone}"
          cpu_core_count:                              <computed>
          cpu_threads_per_core:                        <computed>
          ebs_block_device.#:                          <computed>
          ephemeral_block_device.#:                    <computed>
          get_password_data:                           "false"
          host_id:                                     <computed>
          instance_state:                              <computed>
          instance_type:                               "t2.small"
          ipv6_address_count:                          <computed>
          ipv6_addresses.#:                            <computed>
          key_name:                                    "iac_demo"
          network_interface.#:                         <computed>
          network_interface_id:                        <computed>
          password_data:                               <computed>
          placement_group:                             <computed>
          primary_network_interface_id:                <computed>
          private_dns:                                 <computed>
          private_ip:                                  <computed>
          public_dns:                                  <computed>
          public_ip:                                   <computed>
          root_block_device.#:                         <computed>
          security_groups.#:                           <computed>
          source_dest_check:                           "true"
          subnet_id:                                   "${aws_subnet.sub_pub_iac_demo.id}"
          tags.%:                                      "1"
          tags.Name:                                   "iac-EC2-instance"
          tenancy:                                     <computed>
          user_data:                                   "5fcfa9f44583d02ee1a94afb5562ea441e95f0f2"
          volume_tags.%:                               <computed>
          vpc_security_group_ids.#:                    <computed>
        aws_internet_gateway.ig_iac_demo
          id:                                          <computed>
          owner_id:                                    <computed>
          tags.%:                                      "1"
          tags.Name:                                   "ig_iac_demo"
          vpc_id:                                      "${aws_vpc.vpc_iac_demo.id}"
        aws_route_table.rt_iac_demo
          id:                                          <computed>
          owner_id:                                    <computed>
          propagating_vgws.#:                          <computed>
          route.#:                                     "1"
          route.~3875478034.cidr_block:                "10.0.0.0/0"
          route.~3875478034.egress_only_gateway_id:    ""
          route.~3875478034.gateway_id:                "${aws_internet_gateway.ig_iac_demo.id}"
          route.~3875478034.instance_id:               ""
          route.~3875478034.ipv6_cidr_block:           ""
          route.~3875478034.nat_gateway_id:            ""
          route.~3875478034.network_interface_id:      ""
          route.~3875478034.transit_gateway_id:        ""
          route.~3875478034.vpc_peering_connection_id: ""
          tags.%:                                      "1"
          tags.Name:                                   "rt_iac_demo"
          vpc_id:                                      "${aws_vpc.vpc_iac_demo.id}"
        aws_route_table_association.iac-public-1-a
          id:                                          <computed>
          route_table_id:                              "${aws_route_table.rt_iac_demo.id}"
          subnet_id:                                   "${aws_subnet.sub_pub_iac_demo.id}"
        aws_security_group.sg_iac_demo
          id:                                          <computed>
          arn:                                         <computed>
          description:                                 "Allow SSH inbound traffic"
          egress.#:                                    "1"
          egress.482069346.cidr_blocks.#:              "1"
          egress.482069346.cidr_blocks.0:              "0.0.0.0/0"
          egress.482069346.description:                ""
          egress.482069346.from_port:                  "0"
          egress.482069346.ipv6_cidr_blocks.#:         "0"
          egress.482069346.prefix_list_ids.#:          "0"
          egress.482069346.protocol:                   "-1"
          egress.482069346.security_groups.#:          "0"
          egress.482069346.self:                       "false"
          egress.482069346.to_port:                    "0"
          ingress.#:                                   "1"
          ingress.2541437006.cidr_blocks.#:            "1"
          ingress.2541437006.cidr_blocks.0:            "0.0.0.0/0"
          ingress.2541437006.description:              ""
          ingress.2541437006.from_port:                "22"
          ingress.2541437006.ipv6_cidr_blocks.#:       "0"
          ingress.2541437006.prefix_list_ids.#:        "0"
          ingress.2541437006.protocol:                 "tcp"
          ingress.2541437006.security_groups.#:        "0"
          ingress.2541437006.self:                     "false"
          ingress.2541437006.to_port:                  "22"
          name:                                        "sg_iac_demo"
          owner_id:                                    <computed>
          revoke_rules_on_delete:                      "false"
          vpc_id:                                      "${aws_vpc.vpc_iac_demo.id}"
        aws_subnet.sub_pub_iac_demo
          id:                                          <computed>
          arn:                                         <computed>
          assign_ipv6_address_on_creation:             "false"
          availability_zone:                           <computed>
          availability_zone_id:                        <computed>
          cidr_block:                                  "10.0.0.0/16"
          ipv6_cidr_block:                             <computed>
          ipv6_cidr_block_association_id:              <computed>
          map_public_ip_on_launch:                     "true"
          owner_id:                                    <computed>
          tags.%:                                      "1"
          tags.Name:                                   "sub_pub_iac_demo"
          vpc_id:                                      "${aws_vpc.vpc_iac_demo.id}"
        aws_volume_attachment.iac_vol_attachment
          id:                                          <computed>
          device_name:                                 "/dev/xvdh"
          force_detach:                                "true"
          instance_id:                                 "${aws_instance.iac_ec2_instance.id}"
          volume_id:                                   "${aws_ebs_volume.iac_ebs_volume.id}"
        aws_vpc.vpc_iac_demo
          id:                                          <computed>
          arn:                                         <computed>
          assign_generated_ipv6_cidr_block:            "false"
          cidr_block:                                  "10.0.0.0/16"
          default_network_acl_id:                      <computed>
          default_route_table_id:                      <computed>
          default_security_group_id:                   <computed>
          dhcp_options_id:                             <computed>
          enable_classiclink:                          <computed>
          enable_classiclink_dns_support:              <computed>
          enable_dns_hostnames:                        "true"
          enable_dns_support:                          "true"
          instance_tenancy:                            "default"
          ipv6_association_id:                         <computed>
          ipv6_cidr_block:                             <computed>
          main_route_table_id:                         <computed>
          owner_id:                                    <computed>
          tags.%:                                      "1"
          tags.Name:                                   "vpc_iac_demo"
    Plan: 9 to add, 0 to change, 0 to destroy.
    ------------------------------------------------------------------------
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
```

9.  Review the plan output and look out for any errors or warning and also try and follow what will get deployed when we apply the configuration to AWS
10. Now deploy the configuration to AWS
```terraform apply -auto-approve```
11. You should see terraform working through the configuration elements and you can also follow the infrastructure spinning up in the AWS EC2 console and AWS VPC console. I recommend opening a browser window/tab for each
12. Once apply has completed identify the public_dns name the terraform apply command (or use "terraform show | grep public_dns" if you are using the Git bash terminal) or go through the EC2 console to get public_dns from the Instances menu
13. Try ssh'ing into the EC2 instance
```ssh -i ~/.ssh/iac_demo.pem ubuntu@<public_dns>```
14. In the Packer lab we created an image that has the nginx web server installed by default, to test this when logged into the instance run the following command. You should see wget save the file to index.html
```wget localhost```
15. Now if you try to wget the public_dns name from a local terminal, you should see it fail because port 80 has not been declared in the Inbound rules of the EC2 security group "sg_iac_demo"
16. To correct this we will edit the resources.tf file and add an ingress rule (inbound) to the "sg_iac_demo" resource (see lines below)
```yaml
      ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks =  [ "0.0.0.0/0" ]
      }
```
17. Rerun the terraform validate, plan and apply commands and review how terraform handles the required changes
18. Verify that you can now wget from the local terminal (i.e. over the internet) using the new instance DNS created as a result of the change or use your browser
19. Review the contents of the terraform.tfstate file
20. Now try adding a new instance to the resources.tf file

# End of Lab 2
