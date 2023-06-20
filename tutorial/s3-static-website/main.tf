provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_s3_bucket" "tungbq_s3_website" {
  bucket = "tungbq-s3-website"

  tags = {
    Name        = "S3 bucket to store website"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.tungbq_s3_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}