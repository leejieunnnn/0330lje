resource "aws_insance" "webserver" {
    ami = "ami-0bb8c0d387143b435"
    instance_type = "t2.micro"

    tags = {
        Name = "My-Terraform-EC2"
    }
}