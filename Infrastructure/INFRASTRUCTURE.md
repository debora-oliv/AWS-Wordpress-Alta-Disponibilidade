> Alguns serviços utilizados dependem da criação prévia de security groups com regras de entra e saída corretamente estipuladas. Para acessar o passo da criação desses recursos clique aqui.

- [Criação da Virtual Private Cloud](#criação-da-virtual-private-cloud)
- [Criação das Subnets](#criação-das-subnets)
- [Criação das Route Tables](#criação-das-route-tables)
- [Criação do Internet Gateway](#criação-do-internet-gateway)

# Criação da Virtual Private Cloud
No console da AWS vá em VPC > Your VPCs > Create VPC

![VPC SETTINGS](Images/VPC/vpc-settings.PNG)

# Criação das Subnets
No console da AWS vá em VPC > Subnets > Create subnet

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

# Criação das Route Tables
No console da AWS vá em VPC > Route tables > Create route table

1. #### Route table privada
![Private route table settings](Images/RouteTables/private-rt-settings.PNG)

>Logo após finalizar a criação da tabela, clique em Actions > Edit subnet associations e selecione todas as subnets públicas
>
>![Private route table associations](Images/RouteTables/private-rt-associations.PNG)

2. #### Route table pública
![Public route table settings](Images/RouteTables/public-rt-settings.PNG)

>Logo após finalizar a criação da tabela, clique em Actions > Edit subnet associations e selecione todas as subnets privadas
>
>![Private route table associations](Images/RouteTables/public-rt-associations.PNG)

# Criação do Internet Gateway
No console da AWS vá em VPC > Internet gateways > Create internet gateway

![Subnet app-az2](Images/InternetGateway/ig-settings.PNG)

>Logo após finalizar a criação, clique em Actions > Attach to VPC e selecione a VPC
>
>![Private route table associations](Images/InternetGateway/attach-to-vpc.PNG)
