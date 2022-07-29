terraform {
  backend "s3" {
    bucket         = "amol1-bucket"
    key            = "amol/demo"
    region         = "us-east-1"
    dynamodb_table = "dyno"

  }
}
