resource "aws_route_table" "terraform-pub-rt" {
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {"Name" = "terraform-pub-rt"}
}

resource "aws_route" "terraform-pub-route" {
    route_table_id = aws_route_table.terraform-pub-rt.id
    destination_cidr_block =  "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
}

resource "aws_route_table" "terraform-pri-rt" {
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {"Name" = "terraform-pri-rt"}
}

resource "aws_route" "terraform-pri-route" {
    route_table_id = aws_route_table.terraform-pri-rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform-ngw.id
}

resource"aws_route_table_association" "pub-2a" {
    subnet_id = aws_subnet.terraform-pub-subnet-2a.id
    route_table_id = aws_route_table.terraform-pub-rt.id
}

resource "aws_route_table_association" "pub-2c"{
    subnet_id = aws_subnet.terraform-pub-subnet-2c.id
    route_table_id = aws_route_table.terraform-pub-rt.id
}

resource "aws_route_table_association" "pri-2a" {
    subnet_id = aws_subnet.terraform-pri-subnet-2a.id
    route_table_id = aws_route_table.terraform-pri-rt.id
}
 
resource "aws_route_table_association" "pri-2c" {
    subnet_id = aws_subnet.terraform-pri-subnet-2c.id
    route_table_id = aws_route_table.terraform-pri-rt.id
}