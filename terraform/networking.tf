resource "aws_security_group" "my_ip_ssh"{
name = "security-group-my-ip-ssh"
description = "Allow SSH from my IP"
vpc_id = data.aws_vpc.default.id 

tags = {
    Name = "sg-my-ip-ssh"
}
}




resource "aws_security_group" "minikube"{
name = "security-group-minikube"
description = "kubernetes Server Access"
vpc_id = data.aws_vpc.default.id

tags = {
    Name = "sg-minikube"
}


}

resource "aws_vpc_security_group_ingress_rule" "minikube_nodeport" {  
  security_group_id = aws_security_group.minikube.id
  from_port         = 0
  to_port           = 30080
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0" 
}


resource "aws_vpc_security_group_ingress_rule" "http" {  
  security_group_id = aws_security_group.my_ip_ssh.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0" 
}

resource "aws_vpc_security_group_ingress_rule" "jenkins_ui" {
  security_group_id = aws_security_group.my_ip_ssh.id
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"  
}


resource "aws_vpc_security_group_ingress_rule" "my_ip_ssh_ingress"{
security_group_id = aws_security_group.my_ip_ssh.id
description = "SSH from my IP"
from_port = 22
to_port = 22
ip_protocol = "tcp"
cidr_ipv4   = "0.0.0.0/0"  
}


resource "aws_vpc_security_group_egress_rule" "my_ip_ssh_egress"{
security_group_id = aws_security_group.my_ip_ssh.id
description = "Allow All outbound"
from_port = 0
to_port = 0
ip_protocol = "-1"
cidr_ipv4 = "0.0.0.0/0"
}