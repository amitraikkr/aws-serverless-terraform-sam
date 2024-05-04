
resource "aws_s3_bucket" "src_bucket1" {
  bucket = "src-bucket-some-random-amit"
}

resource "aws_s3_bucket_ownership_controls" "src_bucket_ownership_controls1" {
  bucket = aws_s3_bucket.src_bucket1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "src_bucket_acl1" {
  depends_on = [aws_s3_bucket_ownership_controls.src_bucket_ownership_controls1]
  bucket     = aws_s3_bucket.src_bucket1.id
  acl        = "private"
}


resource "aws_s3_bucket" "dst_bucket1" {
  bucket = "dst-bucket-some-random-amit"
}

resource "aws_s3_bucket_ownership_controls" "dst_bucket_ownership_controls1" {
  bucket = aws_s3_bucket.dst_bucket1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "dst_bucket_acl1" {
  depends_on = [aws_s3_bucket_ownership_controls.dst_bucket_ownership_controls1]
  bucket     = aws_s3_bucket.dst_bucket1.id
  acl        = "private"
}





