***Antes de tudo esse projeto não seria possivel sem os passo do:***

https://www.powerupcloud.com/copying-objects-using-aws-lambda-based-on-s3-events-part-1/

***Quero deixar meu agradecimento pelo contéudo disponível, o que fiz foi automatizar a tarefa usando o terraform***



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

