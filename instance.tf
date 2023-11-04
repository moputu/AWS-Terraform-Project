# Create an IAM instance profile
resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "s3-access" 
  role = aws_iam_role.my_role.name
}

# Launch an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0db21996a46a72de9"         # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  key_name      = "mykeypair1"  # Replace with your actual key pair name
  iam_instance_profile = aws_iam_instance_profile.example_instance_profile.name

  tags = {
    Name = "MyDataProcessingInstance" #Replace with your instance name 
  }
}
