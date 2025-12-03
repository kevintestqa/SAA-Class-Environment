resource "aws_sns_topic" "barret_scaling_events_topic" {
  name = "scaling-events"
}

resource "aws_sns_topic_subscription" "asg_actions" {
  topic_arn = aws_sns_topic.barret_scaling_events_topic.arn
  protocol  = "email"
  endpoint  = "kevinwillocks@gmail.com"
}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [
    aws_autoscaling_group.barret-asg.name
  ]

//https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_NotificationConfiguration.html for more info on types of EC2 notifications
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.barret_scaling_events_topic.arn
}