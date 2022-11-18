# Projeto Cluster Swarm Local com o Vagrant

Projeto para criar um cluster em ambiente virtualizado utilizando VirtualBox

Necessário realizar a instalação do Vagrant - https://www.vagrantup.com/

Rodar o comando abaixo para iniciar o processo.
```
$ vagrant up
```

**Obs** antes de executar o comando, verificar as configurações da máquina local, pois serão consumidos espaço em disco, CPU e memória para casa servidor criado conforme detalhado no arquivo **Vagrantfile**.

Após criação do cluster é possível criar um serviço executando o comando abaixo no servidor master, os arquivos da aplicação já foram carregados junto com a configuração do Master realizado pelo arquivo **master.sh**

- Comando para acessar o servidor master
```
$ vagrant ssh master
```

- Comando para criar o serviço
```
$ docker service create --name web-site --replicas 15 -dt -p 80:80 --mount type=volume,src=web,dst=/usr/local/apache2/htdocs httpd
```

**Atenção**
Para este projeto, utilizei na máquina local o sistema operacional Ubuntu, e para conseguir trabalhar com uma faixa de IP fixa foi necessário criar um arquivo de nome **networks.conf** no caminho **/etc/vbox/** com o seguinte conteúdo.
```
$ * 10.10.10.0/8
```

## Estrutura de arquivos e scripts

- **docker.sh** => Instala a ferramenta docker em todos os servidores
- **master.sh** => Executa o docker swarm para criação dos cluster, baixa os arquivos da aplicação web e instala pacotes no servidor master, permitindo inclusive a replicação dos arquivos para os demais nós.
- **worker.sh** => Instala ferramentas, mounta um ponto de compartilhamento de arquivos com o nó master e executar o docker swarm join para vinculação do servidor ao cluster.
- **Vagrantfile** => Arquivo de configuração da ferramenta Vagrant que permite automatizar todo o processo, é onde será detalhada as configurações e nome de cada servidor que será criado, configuração de rede, plano de execução dos scripts entre outros.
