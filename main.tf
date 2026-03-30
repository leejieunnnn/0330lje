provider  "aws" {
    region    =  "ap-northeast-2"
}

resource  "aws_vpc" "main"  {
    cidr_block        =    "10.0.0.0/16"
    instance_tenancy  =  "default"

    tags  =  {
        Name  =  "my-test-vpc"
    }
}

resource  "aws_subnet"  "subnet1" {
    vpc_id      =  aws_vpc.main.id
    cidr_block  =  "10.0.1.0/24"

    tags = {
        Name  =  "subnet-1"
    }
}