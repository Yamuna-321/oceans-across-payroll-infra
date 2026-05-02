resource "aws_sns_topic" "critical_alerts" {
  name = "critical-infra-alerts"
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {
  alarm_name          = "HighEC2CPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU exceeds 80%"
  alarm_actions       = [aws_sns_topic.critical_alerts.arn]

  dimensions = {
    InstanceId = aws_instance.companies.id
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connections_high" {
  alarm_name          = "HighRDSConnections"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 100
  alarm_description   = "Alarm when RDS connections exceed threshold"
  alarm_actions       = [aws_sns_topic.critical_alerts.arn]

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.postgres.id
  }
}

resource "aws_cloudwatch_log_group" "application_logs" {
  name              = "/oceans-across/application"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "infrastructure_logs" {
  name              = "/oceans-across/infrastructure"
  retention_in_days = 90
}
