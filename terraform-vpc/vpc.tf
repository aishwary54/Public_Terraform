resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags {
        Name = "myvpc"
    }
}


resource "aws_subnet" "public-1" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"                              		 //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags {
        Name = "subnet-public-1"
    }
}

resource "aws_subnet" "ec2-private-1" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "10.0.2.0/24"

    availability_zone = "us-east-2a"                             		 // private ec2 subnet
    tags {
        Name = "ec2-subnet-private-1"
    }
}

resource "aws_subnet" "db-private-1" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "10.0.3.0/24"
                                                               			 //private DB subnet
    availability_zone = "us-east-2a"
    tags {
        Name = "DB-subnet-private-1"
    }
}

resource "aws_subnet" "db-private-2" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "10.0.4.0/24"
    
    availability_zone = "us-east-2a"                                            //private DB subnet
    tags {
        Name = "DB-subnet-private-2"
    }
}