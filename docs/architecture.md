AWS RDS MariaDB Project — Architecture Documentation

1. Overview

This document describes the logical architecture of a relational database deployment using Amazon RDS for MariaDB and an Amazon EC2 Linux client.

The objective is to provide database connectivity while restricting access through AWS network security controls.

2. Architecture Flow

+-----------------------+
| Developer / Admin     |
+-----------+-----------+
            |
            | Secure administration
            v
+-----------------------+
| Amazon EC2            |
| Linux Client          |
+-----------+-----------+
            |
            | MariaDB TCP Port 3306
            v
+-----------------------+
| RDS Security Group    |
| Authorized Sources    |
+-----------+-----------+
            |
            v
+-----------------------+
| Amazon RDS             |
| MariaDB Database       |
+-----------------------+

This is a logical illustration. Update the diagram if your actual deployment uses a different network arrangement.

3. AWS Components

Amazon EC2

Provides a Linux environment from which an authorized user can connect to the RDS database.

Amazon RDS

Hosts the managed MariaDB relational database and provides database administration features supported by AWS.

Amazon VPC

Provides the network environment used to connect AWS resources.

Security Groups

Control network access to the database. The RDS security group should allow inbound TCP port 3306 from the intended EC2 security group.

MariaDB

Stores structured employee information and supports SQL queries.

4. Network Configuration

Example database connectivity settings:

- Database engine: MariaDB
- Database port: TCP 3306
- Database endpoint: RDS-provided endpoint
- Client: Authorized EC2 Linux instance
- Database access: Restricted through security group rules

The actual connection also depends on VPC routing, subnet configuration, network ACLs, DNS resolution, and database status.

5. Security Recommendations

1. Prefer private database access.
2. Do not allow inbound database connections from all internet addresses.
3. Restrict database access to authorized sources.
4. Protect database credentials.
5. Never commit private keys or AWS access keys to GitHub.
6. Review encryption, backups, and monitoring requirements.
7. Use appropriate IAM permissions.
8. Remove unused resources when the project is complete.

6. Troubleshooting Checklist

If the connection fails:

- Confirm that the RDS instance is Available.
- Verify the database endpoint and port.
- Confirm the EC2 and RDS network configurations.
- Review the RDS security group's inbound rules.
- Check subnet routes and network ACLs.
- Verify the database username, password, and privileges.
- Confirm that the database client is installed.

7. Cost Management

AWS resource costs depend on the Region, instance configuration, storage, backups, and usage.

Before deployment, review current pricing. After testing, remove unused resources and check the AWS Billing and Cost Management console.

8. Conclusion

This architecture illustrates how an EC2 Linux client can connect to a managed MariaDB database on Amazon RDS using controlled network access.

It provides a foundation for learning AWS database administration, cloud networking, and SQL operations.