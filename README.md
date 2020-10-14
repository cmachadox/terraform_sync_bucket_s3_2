***Antes de tudo esse projeto não seria possivel sem os passo do:***

https://www.powerupcloud.com/copying-objects-using-aws-lambda-based-on-s3-events-part-1/

***Quero deixar meu agradecimento pelo contéudo disponível.***

***O que fiz foi automatizar a tarefa usando o terraform***



# Terraform_sync_bucket_s3

***VAMOS PROVISIONAR TUDO USANDO O:***

![](https://github.com/cmachadox/terraform_sync_bucket_s3/blob/master/logo-terraform.png)

### Copiando conteúdos usando AWS Lambda com base em eventos S3

## Introdução

Nesta era da nuvem, onde os dados estão sempre em movimento. É imperativo para qualquer pessoa que lida com movimentação de dados ouvir sobre o Simple Storage Service da Amazon ou popularmente conhecido como S3. Como o nome sugere, é um serviço simples de armazenamento de arquivos, onde podemos carregar ou remover arquivos - mais conhecidos como objetos. É um armazenamento muito flexível e cuidará da escalabilidade, segurança, desempenho e disponibilidade. Isso é muito útil para muitos aplicativos e casos de uso.

A próxima melhor coisa que usamos aqui - AWS Lambda! O novo mundo da computação sem servidor. Você poderá executar suas cargas de trabalho facilmente usando Lambda sem se preocupar em provisionar nenhum recurso. Lambda cuida de tudo.

## Vantagens

S3 como já sabemos é o armazenamento baseado em objeto, altamente escalável e eficiente. Podemos usá-lo como fonte de dados ou mesmo como destino para vários aplicativos. O AWS Lambda, sem servidor, nos permite executar qualquer coisa sem pensar em nenhuma infraestrutura subjacente. Portanto, você pode usar o Lambda para muitos de seus trabalhos de processamento ou até mesmo para se comunicar com qualquer um de seus recursos da AWS.

## Caso de uso
Copiar novos arquivos para um local diferente (intervalo / caminho) enquanto preserva a hierarquia. Usaremos o terraform


## Como funciona:

**Buckets:** criado e configurado no arquivo ***s3.tf***

**O bucket:** ***bucket-destino***

Nesse bucket serão armazenados os arquivos criados/updado para dentro do **bucket-recebimento**. 

**O bucket:** ***bucket-recebimento***

Esse bucket recebe a copia te tudo que for criado em **bucket-destino**

**Função Lambada:** - criado e configurado no arquivo ***lambda.tf***

**Função:** _s3_sync_lambda_ 

Nessa função contem um script python qual tem como objetivo copiar tudo o que for feito uploud e tudo o que for criado dentro do bucket **bucket-recebimento** e copiar para o bucket qual mensionamos no script lá na váriavel **destination_bucket_name =**

**O script_python: s3_sync_py**

Esse script só deve ser alterado caso haja alteração no nome do bucket de destino, após alterar deve ser zipado ```# zip s3_sync.zip s3_sync.py```

```
import json
import boto3

# boto3 S3 initialization
s3_client = boto3.client("s3")


def lambda_handler(event, context):
   destination_bucket_name = 'bucket-destino'

   # event contains all information about uploaded object
   print("Event :", event)

   # Bucket Name where file was uploaded
   source_bucket_name = event['Records'][0]['s3']['bucket']['name']

   # Filename of object (with path)
   file_key_name = event['Records'][0]['s3']['object']['key']

   # Copy Source Object
   copy_source_object = {'Bucket': source_bucket_name, 'Key': file_key_name }

   # Caso queira usar sem diretorio descomemtemte a linha abaixo;
   #s3_client.copy_object(CopySource=copy_source_object, Bucket=destination_bucket_name, Key=file_key_name)
   
   # Caso queria usar com diretorio descomente a linha abaixo 
   s3_client.copy_object(CopySource=copy_source_object, Bucket=destination_bucket_name, Key='Arquivos/' + file_key_name)

   return {
       'statusCode': 200,
       'body': json.dumps('Hello from S3 events Lambda!')
   }

```

**Gatilho:** _S3_

Esse gatilho criado na função lambda é o grande responsável por acionar o script python sempre que algo é upado/criado no bucket-recebimento


![](https://gitlab.com/mandic-labs/teams/team-42/anbima/terraform/project_s3/-/raw/master/terraform.png)

## Por dentro de cada arquivo .tf do projeto

```
A ideia não é explicar cada recursos contido nos arquivos, mais sim mostrar o que cada um é responsável em provissionar
```

**main.tf**

Esse cara é o reponsável por conter as informações do provider, profile e região qual irá ser provisionada a função lambda

**variables.tf**

Esse é reponsável por conter as variaveis de quase tudo o projeto, por tanto é sempre bom não alterar nada sem antes consultar esse arquivo.

**s3.tf**

È reponsável por provissionar os buckets

**iam_s3_policy.tf**

È responsável por criar um role e uma policy, qual permite que a função lambda tenha permições de realizar a copia de um bucket para o outro.

**lambda.tf**

È responsável pelo provissionamento da função lambda, integrando o script em python e criando o gatilho resonsável pela execução do mesmo.

**iam_user_group.tf**

È responsável por provissionar 3 usuários e 3 grupos

**usuários**

* app.a
* app.a
* app.c

**grupos**

* group.a
* group.a
* group.c


**iam_group_policy.tf**

È responsável por provissionar 3 polices uma para cada grupo dando permissões diferentes a cada um conforme a sia necessidade.
E feito tambem um attachment dos usuários cada um ao seu grupo de acordo com o bucket, ou conforme a sua necessidade

* **group_a**  - grupo para realizar tarefas no bucket ***bucket-recebimento***

- [x] Leitura/Listagem
- [x] Gravação
- [ ] Download

* **group_b** - grupo para realizar tarefas no bucket ***bucket-destino***

- [x] Leitura/Listagem
- [x] Gravação 
- [ ] Download

* **group_c** - grupo para realizar tarefas no bucket ***bucket-destino***

- [x] Leitura/Listagem
- [ ] Gravação
- [x] Download

* **group_admin** - grupo para realizar tarefas full nos 2 bucket, podem add usuário ao grupo direto via painel do IAM




