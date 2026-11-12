# configure AWS provider in offline/mock mode (requires no real cloud credentials)
provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  access_key                  = "mock_key"
  secret_key                  = "mock_secret"
}

# expected critical/high misconfiguration: Security Group open to the internet on SSH (Port 22)
resource "aws_security_group" "insecure_demo_sg" {
  name        = "demo-insecure-sg-${random_pet.name.id}"
  description = "Insecure security group open to the world"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "insecure_demo_bucket" {
  bucket = "demo-insecure-bucket-${random_pet.name.id}"
}

# expected high misconfiguration: S3 Bucket with public ACL enabled
resource "aws_s3_bucket_acl" "insecure_demo_acl" {
  bucket = aws_s3_bucket.insecure_demo_bucket.id
  acl    = "public-read"
}
