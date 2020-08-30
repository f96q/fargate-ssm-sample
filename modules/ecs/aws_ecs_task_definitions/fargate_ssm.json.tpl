[
  {
    "image": "${image}",
    "name": "fargate-ssm",
    "essential": true,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${aws_region}",
        "awslogs-group": "${awslogs_group}",
        "awslogs-stream-prefix": "fargate-ssm"
      }
    },
    "environment": [
      {
        "name": "AWS_REGION",
        "value": "${aws_region}"
      }
    ]
  }
]
