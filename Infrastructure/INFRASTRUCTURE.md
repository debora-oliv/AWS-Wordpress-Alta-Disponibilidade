# Serviços Criados e Configurados

- [Security Groups](security-groups)
  - [Aplication Load Balancer (ALB)](#alb-security-group)
  - [Relational Database Service (RDS)](#rds-security-group)
  - [Elastic File System (EFS)](#efs-security-group)
  - [Elastic Compute Cloud (EC2)](#ec2-security-group)
  - [Bastion Host](#bastion-security-group)
- [Virtual Private Cloud (VPC)](#virtual-private-cloud-vpc)
  - [Subnets](#subnets)
  - [Route Tables](#route-tables)
  - [Internet Gateway](#internet-gateway)
- [Elastic File System (EFS)](#efs)
- [Relational Database Service (RDS)](#rds)
- [Elastic Compute Cloud (EC2)](#ec2)
- [Aplication Load Balancer (ALB)](#alb)
- [Auto Scalling Group (ASG)](#asg)

# Security Groups

> Esta feature pode ser acessada tanto pelo dashboard da VPC quanto pelo dashboard da EC2

### ALB Security Group

### RDS Security Group

### EFS Security Group

### EC2 Security Group

### Bastion Security Group

# Virtual Private Cloud (VPC)

![VPC SETTINGS](Images/VPC/vpc-settings.PNG)

### Subnets
1. #### Subnet public-az1
![Subnet public-az1](Images/Subnets/public-az1.PNG)

2. #### Subnet public-az2
![Subnet public-az2](Images/Subnets/public-az2.PNG)

3. #### Subnet data-az1
![Subnet data-az1](Images/Subnets/data-az1.PNG)

4. #### Subnet data-az2
![Subnet data-az2](Images/Subnets/data-az2.PNG)

5. #### Subnet app-az1
![Subnet app-az1](Images/Subnets/app-az1.PNG)

6. #### Subnet app-az2
![Subnet app-az2](Images/Subnets/app-az2.PNG)

### Route Tables

1. #### Route table privada
![Private route table settings](Images/RouteTables/private-rt-settings.PNG)

>Logo após finalizar a criação da tabela, clique em Actions > Edit subnet associations e selecione todas as subnets privadas
>
>![Private route table associations](Images/RouteTables/private-rt-associations.PNG)

2. #### Route table pública
![Public route table settings](Images/RouteTables/public-rt-settings.PNG)

>Logo após finalizar a criação da tabela, clique em Actions > Edit subnet associations e selecione todas as subnets privadas
>
>![Private route table associations](Images/RouteTables/public-rt-associations.PNG)

### Internet Gateway

![Subnet app-az2](Images/InternetGateway/ig-settings.PNG)

>Logo após finalizar a criação, clique em Actions > Attach to VPC e selecione a VPC
>
>![Private route table associations](Images/InternetGateway/attach-to-vpc.PNG)
