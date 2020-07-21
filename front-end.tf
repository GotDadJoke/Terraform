resource "aws_s3_bucket" "front-end-gotdadjoke" {
  bucket = "front-end-gotdadjoke"
  acl    = "private"

  tags = {
    Name        = "bucket-fe"
    Environment = "dev"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "front-end-gotdadjoke-policy" {
  bucket = aws_s3_bucket.front-end-gotdadjoke.id


  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "FE",
  "Statement": [
    {
      "Sid": "CFAllow",
      "Effect": "Allow",
      "Action": ["s3:ListBucket","s3:GetObject"],
      "Resource": ["${aws_s3_bucket.front-end-gotdadjoke.arn}","${aws_s3_bucket.front-end-gotdadjoke.arn}/*" ],
      "Principal": {
        "AWS": [
          "${var.ACCOUNT_ID}"
        ]
      }
    }
  ]
}
POLICY
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.front-end-gotdadjoke.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.front-end-gotdadjoke.id

//    s3_origin_config {
//      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
//    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Front End"
  default_root_object = "index.html"

//  logging_config {
//    include_cookies = false
//    bucket          = "mylogs.s3.amazonaws.com"
//    prefix          = "myprefix"
//  }

  aliases = ["dev.gotdadjoke.com"]

  default_cache_behavior {
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.front-end-gotdadjoke.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }

  tags = {
    Environment = "development",
    project = "GotDadJokes"
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:894771629905:certificate/8ba408c3-5df0-45c6-9a4e-82e4f819a095"
    cloudfront_default_certificate = false
    ssl_support_method = "sni-only"
  }
}