resource "aws_secretsmanager_secret" "socialarc_password" {
  name = "socialarc_password"
  description = "Secret para armazenar a senha do Azure Registry Container - SB"

  recovery_window_in_days = 0
}

resource "kubernetes_secret_v1" "socialarc" {
  metadata {
    name      = "socialacr"
    namespace = "dev"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "socialbank.azurecr.io" = {
          "username" = "socialbank"
          "password" = data.aws_secretsmanager_secret_version.socialarc_password.secret_string
          "auth"     = base64encode("socialbank:${data.aws_secretsmanager_secret_version.socialarc_password.secret_string}")
        }
      }
    })
  }
}