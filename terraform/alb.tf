#--------------------------------------------------------------
# ALB
#--------------------------------------------------------------

resource "aws_lb" "alb" {
  name               = "vp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = module.vpc.public_subnets
  ip_address_type    = "ipv4"

  depends_on = [aws_security_group.alb]

}
resource "aws_lb_target_group" "alb-target-group" {
  name        = "vp-alb-target-grp"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id

  health_check {
    path = "/login"
    port = 8080
  }

}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}


resource "aws_lb_target_group_attachment" "this" {

  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.tomcat.id
  port             = 8080
}