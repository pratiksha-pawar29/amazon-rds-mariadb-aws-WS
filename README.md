# amazon-rds-mariadb-aws-WS
Deployed a MariaDB relational database using Amazon RDS, configured secure connectivity from Amazon EC2, and performed SQL CRUD operations within an AWS VPC.

Amazon RDS on AWS – MariaDB Database Deployment

"AWS" (https://img.shields.io/badge/AWS-Cloud%20Computing-orange?logo=amazonaws&logoColor=white)
"Amazon RDS" (https://img.shields.io/badge/Amazon-RDS-blue)
"MariaDB" (https://img.shields.io/badge/Database-MariaDB-003545?logo=mariadb&logoColor=white)
"SQL" (https://img.shields.io/badge/Language-SQL-lightgrey)
"Status" (https://img.shields.io/badge/Project-Learning%20Project-success)

Project Overview

This project demonstrates how to deploy and connect to a managed relational database using Amazon Relational Database Service (Amazon RDS) with MariaDB as the database engine.

The project covers database instance creation, AWS networking and security group configuration, connectivity from an Amazon EC2 Linux instance, and SQL operations for managing employee records.

The goal is to understand how cloud-based relational databases are provisioned, secured, accessed, and managed using AWS services.

Project Infographic

"Amazon RDS on AWS – MariaDB Deployment Project" (images/rds-mariadb-aws-project.png)

The infographic summarizes the project workflow, database configuration, connectivity, SQL operations, and architecture.

Objectives

- Understand Amazon RDS and managed relational databases.
- Create a MariaDB database instance on AWS.
- Configure VPC networking and security groups.
- Connect to the RDS endpoint from an EC2 Linux instance.
- Create databases and tables using SQL.
- Perform CRUD operations on employee records.
- Understand database connectivity and access control.
- Learn basic cloud database administration.

AWS Services and Technologies

Service / Technology| Purpose
Amazon RDS| Managed relational database service
MariaDB| Relational database engine
Amazon EC2| Linux client used to connect to the database
Amazon VPC| Network environment for AWS resources
Security Groups| Control network access to the database
MySQL-compatible CLI| Connect to MariaDB and execute SQL
MySQL Workbench| Optional graphical database client

Architecture

The project follows this connectivity model:

EC2 Linux Client → Security Group Rules → Amazon RDS (MariaDB)

The EC2 instance connects to the database using its RDS endpoint and the MariaDB default port, "3306".

The RDS database should be configured with appropriate VPC and subnet settings. For a safer architecture, keep the database private and allow inbound database traffic only from the EC2 instance's security group.

Architecture Components

1. Amazon EC2: Provides a Linux environment for database administration.
2. Amazon RDS: Hosts the managed MariaDB database.
3. Amazon VPC: Provides network isolation and connectivity.
4. Security Groups: Restrict access to authorized sources.
5. MariaDB: Stores and manages relational employee data.

Prerequisites

Before starting, you need:

- An AWS account with appropriate permissions.
- An Amazon EC2 Linux instance.
- An Amazon RDS for MariaDB instance.
- EC2 and RDS network connectivity through a VPC.
- A security group allowing TCP port "3306" from the EC2 instance's security group.
- The MariaDB/MySQL command-line client installed on EC2.
- The RDS endpoint, database username, and password.

Security note: Do not commit AWS credentials, database passwords, private keys, or other secrets to GitHub.

Implementation Steps

Step 1: Create an Amazon RDS Instance

1. Open the AWS Management Console.
2. Navigate to Amazon RDS.
3. Select the option to create a database.
4. Choose MariaDB as the database engine.
5. Select an engine version supported by AWS in your Region.
6. Configure the DB instance identifier, username, password, and instance class.
7. Configure the VPC, subnet group, and security groups.
8. Review the configuration and create the database.
9. Wait until the instance status becomes Available.
10. Copy the database endpoint from the RDS connectivity settings.

For a learning project, review the available Free Tier or other eligible options, estimated costs, and backup settings before creating resources.

Step 2: Configure Security Groups

Configure the RDS security group to allow inbound database connections:

- Type: MySQL/Aurora or custom TCP
- Protocol: TCP
- Port: 3306
- Source: The EC2 instance's security group

Make sure the EC2 instance can reach the RDS instance through the configured VPC networking.

Avoid exposing the database to the entire internet with a source of "0.0.0.0/0".

Step 3: Connect from EC2

Connect to your EC2 instance using your configured SSH method.

Install the appropriate MariaDB-compatible client if it is not already available. For example, on a supported Ubuntu system:

sudo apt update
sudo apt install mariadb-client -y

Connect to the RDS endpoint:

mariadb -h YOUR_RDS_ENDPOINT \
  -P 3306 \
  -u YOUR_DB_USERNAME \
  -p

Replace "YOUR_RDS_ENDPOINT" and "YOUR_DB_USERNAME" with your actual configuration. Enter the password when prompted.

If your system uses the "mysql" client command instead, you can use the same connection parameters with "mysql".

Step 4: Create the Database and Table

After connecting to MariaDB, run:

CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

Step 5: Insert Sample Records

INSERT INTO employees (name, department, salary)
VALUES
    ('Rahul', 'IT', 75000.00),
    ('Priya', 'HR', 65000.00),
    ('Amit', 'Finance', 70000.00);

Step 6: Perform CRUD Operations

Create — Insert a record

INSERT INTO employees (name, department, salary)
VALUES ('Neha', 'Operations', 60000.00);

Read — Retrieve records

SELECT * FROM employees;

SELECT name, department, salary
FROM employees
WHERE department = 'IT';

Update — Modify a record

UPDATE employees
SET salary = 80000.00
WHERE name = 'Rahul';

Delete — Remove a record

DELETE FROM employees
WHERE name = 'Neha';

Verify the changes:

SELECT * FROM employees;

These commands demonstrate the four fundamental database operations: Create, Read, Update, and Delete.

Step 7: Optional MySQL Workbench Connection

You can use MySQL Workbench as a graphical client if it is compatible with your MariaDB setup.

Configure the connection with:

- Connection name: RDS-MariaDB
- Hostname: Your RDS endpoint
- Port: 3306
- Username: Your database username
- Password: Enter securely using the client’s supported credential storage

Ensure the client machine has authorized network access to the database. Test the connection before executing SQL queries.

Expected Results

After completing the workflow, you should be able to:

- Create and access an RDS MariaDB instance.
- Connect from an authorized EC2 Linux instance.
- Create a database and an employee table.
- Insert sample employee records.
- Retrieve, update, and delete records.
- Verify that security group rules control database connectivity.

Record your own successful test results and screenshots in this repository.

Key Learnings

- Amazon RDS fundamentals and managed database concepts.
- MariaDB database and table administration.
- SQL queries and CRUD operations.
- EC2-to-RDS network connectivity.
- VPC and security group configuration.
- Database endpoint usage.
- Basic database access control and cloud security.
- Awareness of cloud resource costs and cleanup.

Troubleshooting

Issue| What to check
Connection timeout| VPC routing, security group rules, subnet configuration, and network reachability
Access denied| Database username, password, and database privileges
Unknown database| Confirm the database was created and the correct name is used
Client command not found| Install a compatible MariaDB/MySQL client
Connection refused| Verify the endpoint, port, DB status, and network configuration

Cost Management and Cleanup

Amazon RDS and EC2 resources may incur charges depending on their configuration and usage.

After testing:

1. Back up any data you need to keep.
2. Delete the RDS instance if it is no longer required, after reviewing backup and retention settings.
3. Terminate the EC2 instance if it is no longer required.
4. Remove unused resources such as custom security groups and subnet-related resources when safe to do so.
5. Check the AWS Billing and Cost Management console for remaining charges.

Repository Structure

amazon-rds-mariadb-aws/
├── README.md
├── images/
│   └── rds-mariadb-aws-project.png
├── sql/
│   └── employee_db.sql
├── docs/
│   └── architecture.md
└── .gitignore

Future Improvements

- Automate infrastructure provisioning with Terraform or AWS CloudFormation.
- Use AWS Secrets Manager for database credentials.
- Configure monitoring and alarms with Amazon CloudWatch.
- Explore automated backups and point-in-time recovery.
- Connect a sample application to the RDS database.
- Document recovery, availability, and scaling options.

References

- "Amazon RDS Documentation" (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)
- "Connecting Amazon EC2 and Amazon RDS" (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/ec2-rds-connect.html)
- "MariaDB Documentation" (https://mariadb.com/docs/)
- "GitHub Markdown Documentation" (https://docs.github.com/en/get-started/writing-on-github)

Author

Pratiksha Pawar 

Cloud Computing | AWS | SQL | DevOps Learning

This repository documents a hands-on learning project focused on AWS managed databases, connectivity, and SQL fundamentals.
