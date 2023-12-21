# aws-ubuntu.pkr.hcl
source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ubuntu-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]


  post-processor "manifest" {}

  # Install Ansible
  provisioner "shell" {
    script = "../scripts/ansible.sh"
  }

  provisioner "ansible-local" {
    playbook_file = "../ansible/playbook.yml"
  }

  provisioner "shell" {
    script = "../scripts/cleanup.sh"
  }


}



