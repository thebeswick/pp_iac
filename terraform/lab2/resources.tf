# Create the EC2 instance - EC2 console
resource "aws_instance" "iac_ec2_instance" {
 ami               = "ami-08586e874d2dde4e4"
 availability_zone = "${aws_subnet.sub_pub_iac_demo.availability_zone}"
 instance_type     = "${var.instance_type}"

 tags {
   Name = "iac-EC2-instance"
 }
 key_name = "iac_demo"
 security_groups = [ "${aws_security_group.sg_iac_demo.id}" ]
 subnet_id = "${aws_subnet.sub_pub_iac_demo.id}"
 user_data = "${file("files/attach_ebs.sh")}"
 depends_on = ["aws_internet_gateway.ig_iac_demo"]

}

# Create the Elastic Block Storage Volume - EC2 console
resource "aws_ebs_volume" "iac_ebs_volume" {
 availability_zone = "${aws_subnet.sub_pub_iac_demo.availability_zone}"
 size              = 1

  tags {
   Name = "iac-EBS-volume"
 }
}

# Attach the EBS resource to the EC2 instance - EC2 console
resource "aws_volume_attachment" "iac_vol_attachment" {
 device_name = "/dev/xvdh"
 volume_id   = "${aws_ebs_volume.iac_ebs_volume.id}"
 instance_id = "${aws_instance.iac_ec2_instance.id}"
 depends_on = ["aws_instance.iac_ec2_instance"]
 force_detach = true
}

# Create the Internet Gateway resource - VPC console
resource "aws_internet_gateway" "ig_iac_demo" {
  vpc_id = "${aws_vpc.vpc_iac_demo.id}"

  tags = {
    Name = "ig_iac_demo"
  }
}
# Create the VPC resource - VPN console
resource "aws_vpc" "vpc_iac_demo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

}

# Create the Subnet - VPC console
resource "aws_subnet" "sub_pub_iac_demo" {
  vpc_id     = "${aws_vpc.vpc_iac_demo.id}"
  cidr_block = "10.0.0.0/16"
  map_public_ip_on_launch = true

}

# Create the Route Table - VPC console
resource "aws_route_table" "rt_iac_demo" {
  vpc_id = "${aws_vpc.vpc_iac_demo.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig_iac_demo.id}"
  }
  tags = {
    Name = "rt_iac_demo"
  }
}

# Create the Security Group - EC2 console
resource "aws_security_group" "sg_iac_demo" {
  name        = "sg_iac_demo"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${aws_vpc.vpc_iac_demo.id}"

  ingress {
    # SSH (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =  [ "0.0.0.0/0" ] # add a CIDR block here
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [ "0.0.0.0/0" ]
  }
}
# Associate the Subnet and Route Table - VPC
resource "aws_route_table_association" "iac-public-1-a" {
    subnet_id = "${aws_subnet.sub_pub_iac_demo.id}"
    route_table_id = "${aws_route_table.rt_iac_demo.id}"
}
