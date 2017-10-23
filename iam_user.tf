resource "aws_iam_user" "itachi001" {
  name = "${var.name["iam_user_itachi001"]}"
}

resource "aws_iam_policy" "policy_itachi001" {
  name        = "policy_itachi001"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "test-attach" {
    user       = "${aws_iam_user.itachi001.name}"
    policy_arn = "${aws_iam_policy.policy_itachi001.arn}"
}

