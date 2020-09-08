variable "aws_region" {
  description = "Região qual sera implementanda"
  default = "us-east-1"
  type        = string
}

variable "aws_profile" {
  description = "Profil da conta"
  default = "team-42"
  type        = string
}

variable "bucket_a" {
  description = "Nome do bucket A"
  default = "bucket-destino"
  type        = string
}

variable "bucket_b" {
  description = "Nome do bucket B"
  default = "bucket-rebimento"
  type        = string
}

variable "s3_sync_role" {
  description = "Nome da Role"
  default = "sync_role"
  type        = string
}

variable "s3_sync_policy" {
  description = "Nome da Policy"
  default = "sync_policy"
  type        = string
}

variable "s3_sync_lambda" {
  description = "Nome da função lambda"
  default = "sync_lambda"
  type        = string
}


variable "handler_name" {
  description = "Valor do campo handler"
  default = "s3_sync"
  type        = string
}

variable "runtime" {
  description = "Vai rodar sobre um script python"
  default = "python3.8"
  type        = string
}

variable "timeout" {
  description = "Valor do campo runtime"
  default = "300"
  type        = string
}

variable "iam_user_a" {
  description = "Usuário programático do app A "
  default = "app.a"
  type        = string
}

variable "iam_user_b" {
  description = "Usuário progrmático do app B"
  default = "app.b"
  type        = string
}

variable "iam_user_c" {
  description = "Usuário progrmático do app C"
  default = "app.c"
  type        = string
}

variable "iam_group_a" {
  description = "Grupo A"
  default = "group_a"
  type        = string
}

variable "iam_group_b" {
  description = "Grupo B"
  default = "group_b"
  type        = string
}

variable "iam_group_c" {
  description = "Grupo C"
  default = "group_c"
  type        = string
}

variable "iam_group_admin" {
  description = "Grupo Full access "
  default = "group_admin"
  type        = string
}
