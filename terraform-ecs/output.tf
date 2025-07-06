output "alb_dns_name" {
  value = aws_lb.abbas_alb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.abbas_cluster.name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.abbas_bucket.bucket
}

output "vpc_id" {
  value = aws_vpc.abbas_vpc.id
}

output "public_subnet_id" {
  value = [
    aws_subnet.abbas_public_1.id,
    aws_subnet.abbas_public_2.id
  ]
}

output "website_url" {
  value = "https://tmapp.abbashussein.com"
}
