{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ssm:CreateActivation",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "iam:PassRole",
      "Resource": "arn:aws:iam::${aws_account_id}:role/service-role/AmazonEC2RunCommandRoleForManagedInstances"
    }
  ]
}
