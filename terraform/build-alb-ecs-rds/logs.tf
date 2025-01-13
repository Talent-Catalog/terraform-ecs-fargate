# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "tc-me-test_log_group" {
  name              = "/ecs/tc-me-test"
  retention_in_days = 30

  tags = {
    Name = "tc-me-test-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "tc-me-test_log_stream" {
  name           = "tc-me-test-log-stream"
  log_group_name = aws_cloudwatch_log_group.tc-me-test_log_group.name
}

