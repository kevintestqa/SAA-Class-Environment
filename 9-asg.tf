resource "aws_autoscaling_group" "barret-asg" {
    name = "web-server-asg"
    vpc_zone_identifier = [ aws_subnet.private-us-west-1a.id, aws_subnet.private-us-west-1c.id ]
    max_size = 6
    min_size = 3
    desired_capacity = 2
    health_check_type = "ELB"
    target_group_arns = [ aws_lb_target_group.barret-lb-target-group.arn]

    force_delete = true

    launch_template {
      id = aws_launch_template.barret-web-tier-launch-template.id
      version = "$Latest"
    }

    tag {
        key = "Name"
        value = "web-instance"
        propagate_at_launch = true
    }

    lifecycle {
      ignore_changes = [desired_capacity]
    }
}