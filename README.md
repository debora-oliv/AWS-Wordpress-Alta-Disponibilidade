![AWS](https://img.shields.io/badge/AWS-%23117AC9.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![YAML](https://img.shields.io/badge/yaml-%23117AC9.svg?style=for-the-badge&logo=yaml&logoColor=white)
![Bash Script](https://img.shields.io/badge/bash_script-%23117AC9.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![WordPress](https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white)

![Infrastructure](Infrastructure/images/infrastructure.PNG)

O objetivo do projeto foi implantar a plataforma Wordpress na nuvem AWS de forma escalável e tolerante a falhas, utilizando os principais serviços gerenciados da AWS para garantir desempenho e disponibilidade. Para isso a aplicação foi distribuída em múltiplas instâncias EC2 por meio de um ASG (Auto Scaling Group), com balanceamento de carga fornecido por um ALB (Application Load Balancer). O armazenamento de arquivos foi centralizado e compartilhado por meio de um EFS (Elastic File System), enquanto os dados da aplicação foram armazenados em um banco relacional altamente disponível com o Amazon RDS.



# Índice
- [Infraestrutura](#infraestrutura)
- [Security Groups](#security-groups)

# Infraestrutura

### Subnets
Ao todo foram criadas 6 subnets: 2 públicas e 4 privadas. As subnets foram configuradas para atender as demandas de disponibiidade, por isso foram distribuidas em duas AZs (Availability Zones) diferentes (az-1 e az-2). Além disso, as subnets criadas se difereciam entre dados (data-az1 e data-az2) e aplicações (app-az1 e app-az2) com o objetivo de isolar o banco de dados das instâncias.

### NAT Gateway
Permite que recursos em sub-redes privadas (App/Data) acessem a internet - para atualizações, downloads e etc - sem exposição direta. Foram configurados dois NAT Gateways, um em cada subnet pública, para que ambas as AZs tivessem conexão controlada à internet.

### RDS (Relational Database Service)
Banco de dados relacional gerenciado pela própria AWS. Foi criado em uma das subnets privadas destinada aos dados e utilizando uma imagem MySQL.

### EFS (Elastic File System)
Proporciona armazenamento compartilhado e escalável para múltiplas instâncias. Foi configurado com dois Mount Targets, cada um em uma az, e com o EFS Infrequent Access para otimizar os custos. A montagem ocorre dentro das instâncias EC2 via NFS.

### ASG (Auto Scaling Group)
Assegura disponibilidade gerenciando o número de instâncias de acordo com a demanda e parâmetros definidos durante sua criação. Foi criado com escalamento baseado em CPU, ou seja, garante que as solicitações dos usuários sejam processadas rapidamente, utilizando a capacidade de cada máquina de forma eficiente. 

### ALB (Application Load Balancer)
Distribui tráfego HTTP para instâncias da aplicação. Foi criado com listener na Portas 80 (HTTP) e com target groups apontando para instâncias EC2, criadas pelo ASG, nas subnets privadas.





