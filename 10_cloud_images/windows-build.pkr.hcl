build {
  name        = "windows"
  description = <<EOF
This build creates Windows images:
* Windows 2012R2
* Windows 2019
For the following builers :
* amazon-ebs
* azure-arm
EOF
  sources = [
    "source.amazon-ebs.windows_2019",

  ]

  post-processor "manifest" {
  }
}
