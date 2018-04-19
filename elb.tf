resource "aws_elb" "app_elb" {
  name            = "elb-${var.environment}"
  security_groups = ["sg-055a3818648b73a69"]

  subnets = [
    "subnet-fc7f2fb7"
  ]

  listener {
    instance_port     = "8085"
    instance_protocol = "http"
    lb_port           = "8080"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
    target              = "${var.health_check_target}"
    interval            = "${var.health_check_interval}"
  }

  
 
  tags {
    Name = "elb-${var.environment}"
  }
  instances=["${aws_instance.bilal-demo.*.id}"]
  depends_on = ["aws_instance.bilal-demo"]
}
#resource "aws_elb_attachment" "att1" {
#  elb      = "${aws_elb.app_elb.id}"
#  #instance = "${aws_instance.bilal-demo.id}"
#  
#   instance = "${element(aws_instance.bilal-demo.*.id, 0)}"
#}
#
#resource "aws_elb_attachment" "att2" {
#  elb      = "${aws_elb.app_elb.id}"
#   
#   instance = "${element(aws_instance.bilal-demo.*.id, 1)}"
#}