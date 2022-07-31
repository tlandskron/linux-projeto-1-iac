#!/bin/bash
#by tlandskron@gmail.com
#https://github.com/tlandskron/linux-projeto-1-iac.git
#Linux servidor1 5.15.0-43-generic #46-Ubuntu SMP Tue Jul 12 10:30:17 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux




echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec


echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários do grupo GRP_ADM..."

#Alteração do script original do Professor Denilson Bonatti.
#Pois a opção openssl passwd -crypt não foi aceita nesta versão do ubuntu. 
#Da forma como está estruturado a lina de comando de adição do usuário funcionou, inclusive com a senha estipulada.
useradd carlos -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM

echo "Criando usuários do grupo GRP_VEN..."

useradd debora -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN

echo "Criando usuários do grupo GRP_SEC..."

useradd josefina -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC


echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec


echo "Script IaC Finalizado!!!"
