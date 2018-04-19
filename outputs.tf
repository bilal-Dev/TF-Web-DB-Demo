output "Id" {
    value       = ["${aws_instance.bilal-demo.*.id}"]
}

output "ELB Address" {
  value = "http://${aws_elb.app_elb.dns_name}:8080"
}
