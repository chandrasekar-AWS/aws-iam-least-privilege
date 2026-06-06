#!/bin/bash
# ============================================================
# IAM Least Privilege Setup — AWS CLI Script
# Creates users, groups, roles, and attaches policies
# ============================================================

echo "=== Creating IAM User: dev-user ==="
aws iam create-user --user-name dev-user
echo "[✓] User created: dev-user"

echo ""
echo "=== Creating IAM Group: developers ==="
aws iam create-group --group-name developers
echo "[✓] Group created: developers"

echo ""
echo "=== Adding User to Group ==="
aws iam add-user-to-group \
    --user-name dev-user \
    --group-name developers
echo "[✓] dev-user added to developers group"

echo ""
echo "=== Creating S3 Read-Only Policy ==="
aws iam create-policy \
    --policy-name S3ReadOnlyPolicy \
    --policy-document file://s3-readonly-policy.json
echo "[✓] S3ReadOnlyPolicy created"

echo ""
echo "=== Attaching Policy to Group ==="
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws iam attach-group-policy \
    --group-name developers \
    --policy-arn "arn:aws:iam::$ACCOUNT_ID:policy/S3ReadOnlyPolicy"
echo "[✓] Policy attached to developers group"

echo ""
echo "=== Creating Lambda Execution Role ==="
TRUST_POLICY=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "lambda.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
)

aws iam create-role \
    --role-name LambdaExecutionRole \
    --assume-role-policy-document "$TRUST_POLICY"
echo "[✓] LambdaExecutionRole created"

aws iam put-role-policy \
    --role-name LambdaExecutionRole \
    --policy-name LambdaDynamoDBPolicy \
    --policy-document file://lambda-execution-policy.json
echo "[✓] Lambda DynamoDB policy attached"

echo ""
echo "=== IAM Setup Complete! ==="
echo "User       : dev-user"
echo "Group      : developers"
echo "Role       : LambdaExecutionRole"
echo "Policies   : S3ReadOnlyPolicy, LambdaDynamoDBPolicy"
