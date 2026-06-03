# IAM User Setup with Least-Privilege Policy on AWS

## Overview
Configured AWS IAM following the least-privilege security 
principle — a core AWS Well-Architected Framework requirement.

## Architecture
IAM User → IAM Group → S3ReadOnly Policy
                     → EC2 Access DENIED

## What I Built
- Created IAM user group with AmazonS3ReadOnlyAccess policy
- Created IAM user and assigned to the group
- Explicitly denied EC2 access to reduce attack surface
- Verified S3 read access is permitted
- Verified EC2 access is denied
- Documented IAM governance checklist

## Services Used
- AWS IAM
- User Groups
- IAM Policies
- AWS Management Console

## Key Learnings
- Least-privilege access control
- IAM policy enforcement and testing
- AWS Security best practices
- Well-Architected Security Pillar

## Screenshots
<img width="1919" height="970" alt="Screenshot 2026-05-23 074243" src="https://github.com/user-attachments/assets/999fb8bd-ef10-467f-8559-3cbd68613ade" />
<img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/7ad4b80a-8551-43cb-a087-10b0c0361621" />
<img width="1919" height="908" alt="image" src="https://github.com/user-attachments/assets/e731478c-df8e-41b7-bb16-42ec05c7de73" />
<img width="1919" height="1029" alt="Screenshot 2026-05-23 070529" src="https://github.com/user-attachments/assets/da568aaa-e308-482f-8fbc-9a8d7d095159" />
<img width="1905" height="1079" alt="Screenshot 2026-05-23 070817" src="https://github.com/user-attachments/assets/fba70e98-94dd-4f2b-addf-ede07d97e198" />
