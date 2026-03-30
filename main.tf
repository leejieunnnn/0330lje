provider  "aws" {
    regin    =  "ap-northeast-2"
}

resource  "aws_vpc" "main"  {
    cidr_block        =    "10.0.0.0/16"
    instancd_tenancy  =  "default"

    tags  =  {
        Name  =  "my-test-vpc"
    }
}

resource  "aws_subnet"  "subnet1" {
    vpc_id      =  aws_vpc.main.vpc_id
    cidr_block  =  "10.0.1.0/24"

    tags = {
        Name  =  "subnet-1"
    }
}