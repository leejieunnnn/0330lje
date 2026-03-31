resource "aws_lb" "web-lb" {
    name = "web-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.terraform-sg-bastion.id]
    subnets = [aws_subnet.terraform-pub-subnet-2a.id, aws_subnet.terraform-pub-subnet-2c.id]
}

resource "aws_lb_target_group" "terraform-prd-tg" {
    name = "terraform-prd-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.terraform-vpc.id
    health_check {
        path = "/"
        port  = "80"
    }
}

resource "aws_lb_listener" "terraform-prd-listener" {
    load_balancer_arn = aws_lb.web-lb.arn
    port = "80"
    protocol = "HTTP"
    default_action  {
        type =  "forward"
        target_group_arn = aws_lb_target_group.terraform-prd-tg.arn
    }
}