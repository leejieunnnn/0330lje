resource "aws_launch_template" "as_template" {
    name_prefix = "terraform-lc-backend-"
    image_id = "ami-0bb8c0d387143b435"
    instance_type = "t3.micro"
    key_name = "awskangnam"
    vpc_security_group_ids = [aws_security_group.terraform-sg-bastion.id]

    user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
    EOF
    )
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "terraform-prd-asg-v2" {
    name = "terraform-prd-asg-v2"
    launch_template{
        id = aws_launch_template.as_template.id
        version = "$Latest"
    }


    vpc_zone_identifier = [aws_subnet.terraform-pub-subnet-2a.id, aws_subnet.terraform-pub-subnet-2c.id]
    min_size = 1
    max_size = 3
    desired_capacity = 3
    health_check_type = "ELB"
    target_group_arns = [aws_lb_target_group.terraform-prd-tg.arn]

    lifecycle {
        create_before_destroy = true
    }


}   