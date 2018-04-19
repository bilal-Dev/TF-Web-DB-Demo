provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "bilal-demo" {
 count="${var.instance_count}"
  ami           = "ami-43a15f3e"
  instance_type = "t2.micro"
  key_name="DockerTraining"
  "subnet_id" = "subnet-fc7f2fb7"
  security_groups=["sg-055a3818648b73a69"]
  
  provisioner "remote-exec" { 
	
	script="template_files/install.tpl"
	
	connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("DockerTraining.pem")}"
  }
  }  
}


