#### Criação dos usuários

resource "aws_iam_user" "user_app_a" {
  name = var.iam_user_a
  path = "/"

  tags = {
    tag-key = "user-programatico-terrafom"
  }
}

resource "aws_iam_user" "user_app_b" {
  name = var.iam_user_b
  path = "/"

  tags = {
    tag-key = "user-programatico-terrafom"
  }
}

resource "aws_iam_user" "user_app_c" {
  name = var.iam_user_c
  path = "/"

  tags = {
    tag-key = "user-programatico-terrafom"
  }
}
#### Criação dos grupos

resource "aws_iam_group" "group_a" {
  name = var.iam_group_a
}

resource "aws_iam_group" "group_b" {
  name = var.iam_group_b
}

resource "aws_iam_group" "group_c" {
  name = var.iam_group_c
}

resource "aws_iam_group" "group_admin" {
  name = var.iam_group_admin
}


#### Add user membro ao grupo 

resource "aws_iam_group_membership" "groupa" {
  name = "Grupo aplicação A"

  users = [
    aws_iam_user.user_app_a.name,

  ]

  group = aws_iam_group.group_a.name
}

#### Add user membro ao grupo

resource "aws_iam_group_membership" "groupb" {
  name = "Grupo aplicação B"

  users = [
    aws_iam_user.user_app_b.name,

  ]

  group = aws_iam_group.group_b.name
}

#### Add user membro ao grupo

resource "aws_iam_group_membership" "groupc" {
  name = "Grupo aplicação C"

  users = [
    aws_iam_user.user_app_c.name,

  ]

  group = aws_iam_group.group_c.name
}
