resource "aws_internet_gateway" "terraform-igw"{
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {"Name" = "terraform-igw"}
}

resource "aws_eip" "terraform-eip" {
    domain ="vpc"
}

resource "aws_nat_gateway" "terraform-ngw" {
    allocation_id = aws_eip.terraform-eip.id
    subnet_id = aws_subnet.terraform-pub-subnet-2a.id
    tags = {"Name" = "terraform-ngw"}
}