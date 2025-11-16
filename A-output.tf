output "lb_url" {
  value = "http://${aws_lb.barret-lb.dns_name}"
}