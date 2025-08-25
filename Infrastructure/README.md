# Serviços Criados e Configurados

- [Security Groups](security-groups)
  - [Aplication Load Balancer (ALB)](#alb-security-group)
  - [Relational Database Service (RDS)](#rds-security-group)
  - [Elastic File System (EFS)](#efs-security-group)
  - [Elastic Compute Cloud (EC2)](#ec2-security-group)
  - [Bastion Host](#bastion-security-group)
- [Virtual Private Cloud (VPC)](#virtual-private-cloud-vpc)
  - [Subnets](#subnets)
  - [Internet Gateway](#internet-gateway)
  - [NAT Gateway](#nat-gateway)
  - [Route Tables](#route-tables)
- [Elastic File System (EFS)](#elastic-file-system-efs)
- [Relational Database Service (RDS)](#relational-database-service-rds)
- [Target Groups](#target-groups)
- [Launch Template](#launch-template)
- [Aplication Load Balancer (ALB)](#aplication-load-balancer-alb)
- [Auto Scalling Group (ASG)](#auto-scalling-group-asg)

# Security Groups

> Esta feature pode ser acessada tanto pelo dashboard da VPC quanto pelo dashboard da EC2

### ALB Security Group

![basic-datails](Images/SecurityGroups/ALB/basic-datails.PNG)
![basic-datails](Images/SecurityGroups/ALB/inbound.PNG)
![basic-datails](Images/SecurityGroups/ALB/outbound.PNG)

### RDS Security Group

![basic-datails](Images/SecurityGroups/RDS/basic-datails.PNG)
![basic-datails](Images/SecurityGroups/RDS/inbound.PNG)
![basic-datails](Images/SecurityGroups/RDS/outbound.PNG)

### EFS Security Group

![basic-datails](Images/SecurityGroups/EFS/basic-datails.PNG)
![basic-datails](Images/SecurityGroups/EFS/inbound.PNG)
![basic-datails](Images/SecurityGroups/EFS/outbound.PNG)

### EC2 Security Group

![basic-datails](Images/SecurityGroups/EC2/basic-datails.PNG)
![basic-datails](Images/SecurityGroups/EC2/inbound.PNG)
![basic-datails](Images/SecurityGroups/EC2/outbound.PNG)

### Bastion Security Group

![basic-datails](Images/SecurityGroups/Bastion/basic-datails.PNG)
![basic-datails](Images/SecurityGroups/Bastion/inbound.PNG)
![basic-datails](Images/SecurityGroups/Bastion/outbound.PNG)

# Virtual Private Cloud (VPC)

![VPC settings](Images/VirtualPrivateCloud/vpc-settings.PNG)

### Subnets

![Subnet public-az1](Images/Subnets/public-az1.PNG)

![Subnet public-az2](Images/Subnets/public-az2.PNG)

![Subnet data-az1](Images/Subnets/data-az1.PNG)

![Subnet data-az2](Images/Subnets/data-az2.PNG)

![Subnet app-az1](Images/Subnets/app-az1.PNG)

![Subnet app-az2](Images/Subnets/app-az2.PNG)

### Internet Gateway

1. #### Criar Internet Gateway
![Criar Internet Gateway](Images/InternetGateway/ig-settings.PNG)

2. #### Anexar Internet Gateway
Selecione o internet gateway, clique em Actions > Attach to VPC e selecione a VPC

![Anexar Internet Gateway](Images/InternetGateway/attach-to-vpc.PNG)

### NAT Gateway

![NAT Gateway](Images/NATGateway/settings_nat_az1.PNG)

![NAT Gateway](Images/NATGateway/settings_nat_az2.PNG)

### Route Tables

1. #### Criar Route tables
![Private route table settings](Images/RouteTables/private-rt-settings.PNG)

![Public route table settings](Images/RouteTables/public-rt-settings.PNG)

2. #### Associar Route tables
Selecione a route table privada, clique em Actions > Edit subnet associations e selecione todas as subnets privadas

![Private route table associations](Images/RouteTables/private-rt-associations.PNG)

Selecione a route table pública, clique em Actions > Edit subnet associations e selecione todas as subnets públicas

![Private route table associations](Images/RouteTables/public-rt-associations.PNG)


# Elastic File System (EFS)

![EFS general](Images/ElasticFileSystem/general.PNG)

![EFS performance](Images/ElasticFileSystem/performance.PNG)

![EFS general](Images/ElasticFileSystem/network.PNG)

![Sucess](Images/ElasticFileSystem/sucess.PNG)

> Vá em View file system > procure por DNS Name > clique para copiar e guarde o conteúdo em um local seguro, ele será importante para montar o EFS dentro das intâncias EC2 via userdata

# Relational Database Service (RDS)

![RDS create_method](Images/RelationalDatabaseService/create_method.PNG)

![RDS engine_type](Images/RelationalDatabaseService/engine_type.PNG)

![RDS templates](Images/RelationalDatabaseService/templates.PNG)

![RDS settings](Images/RelationalDatabaseService/settings.PNG)

> Guarde as informações de **DB cluster identifier**, **Master username** e **Master password** em um local seguro, elas serão importantes para conectar o RDS com as intâncias EC2 via userdata

![RDS instance_configuration](Images/RelationalDatabaseService/instance_configuration.PNG)

![RDS connectivity1](Images/RelationalDatabaseService/connectivity1.PNG)
![RDS connectivity2](Images/RelationalDatabaseService/connectivity2.PNG)

![RDS addtional_configuration](Images/RelationalDatabaseService/addtional_configuration.PNG)

![RDS sucess](Images/RelationalDatabaseService/sucess.PNG)

> Vá em View connection details > procure por Endpoint > clique para copiar e guarde o conteúdo em um local seguro, ele será importante para conectar o RDS com as intâncias EC2 via userdata

# Target Groups

![Target Group basic_configuration1](Images/TargetGroup/basic_configuration1.PNG)
![Target Group basic_configuration2](Images/TargetGroup/basic_configuration2.PNG)

![Target Group health_check](Images/TargetGroup/health_check.PNG)

# Launch Template

> Antes de prosseguir, faça download do script [userdata](Scripts/userdata.sh)

![Launch Template name_and_description](Images/LaunchTemplate/name_and_description.PNG)

![Launch Template ami](Images/LaunchTemplate/ami.PNG)

![Launch Template instance_type](Images/LaunchTemplate/instance_type.PNG)

![Launch Template key_pair](Images/LaunchTemplate/key_pair.PNG)

![Launch Template network_settings](Images/LaunchTemplate/network_settings.PNG)

![Launch Template network_settings](Images/LaunchTemplate/advanced_network_settings.PNG)

![Launch Template network_settings](Images/LaunchTemplate/user_data.PNG)

> O campo User data está localizado em Advanced details, encontre e selecione o arquivo que você fez o download anteriormente

# Aplication Load Balancer (ALB)

![Aplication Load Balancer basic_configuration](Images/AplicationLoadBalancer/basic_configuration.PNG)

![Aplication Load Balancer network_mapping](Images/AplicationLoadBalancer/network_mapping.PNG)

![Aplication Load Balancer sg](Images/AplicationLoadBalancer/sg.PNG)

![Aplication Load Balancer listeners](Images/AplicationLoadBalancer/listeners.PNG)

# Auto Scalling Group (ASG)

![Auto Scalling Group ](Images/AutoScalingGroup/name.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/launch-template.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/network.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/load-balancing.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/vpc-lattice-integration-options.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/health-check.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/scaling.PNG)

![Auto Scalling Group ](Images/AutoScalingGroup/scaling-policies.PNG)
