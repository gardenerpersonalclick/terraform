provider "google" {
  project = "dummy-project"
  region  = "us-central1"
}

resource "google_service_account" "dummy" {
  account_id   = "dummy-service-account"
  display_name = "Dummy Service Account"
}

resource "local_file" "service_account_key" {
  content  = <<EOT
  {
  "type": "service_account",
  "project_id": "kubernetes-the-hard-way-266704",
  "private_key_id": "00503ecfc0d783c285218a923b639cb9d46ed7f0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDLK4Yp5ncHTIn2\nhxQ0M65Zz4JMqEpMkC5jtJYbVKRfAhhb31CrKa7r/uy2sKvA5BQ+4Z6TvtsMDzKN\nDy8wpGiMTshnYEYGJrylVyv93bC3d6c46cwqgvc7+vAE4zUUwYXukJ7bdizWolun\nKe7li14x8rkMIwkbDMcoomk5C9ZvP2VJpZ/RxIds8Ruw+nSzmcAhO0L9Z89b/2Ec\nzBBbpsyA3U6o809AO4rHqEUrNs2FF3JRlKaDNOT1+z3281ZF2xc4IFwNcby6VfiS\n1uhvjHV5f1LHuJlmZi/I1B/Td+MrpORyQL+7vgHtDujIE1NKp7BaGlC3qIBPex2B\nRUzPIzd/AgMBAAECggEADZQdmnMnFT26hw5nYhBYLmFyYiVXPeQDkkPs3KKc6yYR\nMtj9o7iciXSOJWPnh+GNVI7VSLlOG4Pd79RA5e/adltMKWZIBYUVHLnOijuE4h0J\nnJQVVKCZb+wpLOlOPfb03Tb4enNvILxVAtGaknpss7ibijQwYq1bl5uTwps1t56S\nYCMPryH0IEV5WvX25D5UmzuAMn/UraBA7dygMBubf78aXcll9O99A97FKg/LSU4U\nobe6oRJc97gqmyMgyGmZtbNt2bSuK+tVJCVeT2jjmumVoUCNuEL1nnKus+fmb9A6\nKQbV9p2paKJ6h5gr1QgTE1mlW1KMUubUl9+uHQmOuQKBgQD50phYwm5OXGB5yK+G\n/GZE5lxiUndmjlsnhGb/tDnTie18QFVrMaFS/W3Ydim/2l63EgM/3qeIfoSItuie\n20w8L6F/ODSif7T8g0uh9Ynm30ShbDTMiAkojScBBzM6H7AJFqeX68g0QZDcFWi9\ndJPQR3wg62O2LBYtLq18F5lRWQKBgQDQMZzblyeCTlIGTj8bH/H3p6AAaIrNXxXk\nVO11rG0szXzybmiLTZxpnZRK4oZbA9w/8BsDkAAV1EXsd/QCr0Xenk6JcEZQoOoK\nDCH5UbucRQlaZPfhgtNdSu4MvbrZMsa5JLV3EILgDPq8VXYr4KUs6ulTB893YYKA\nH2C9EPKclwKBgQD5T9Sfx7GDXCcfgkrBgIOjQO1zZe8oluqbPkP37WlEFcK+HAni\nxw3DH40O16WEhC2/ryc1B0PUMMadFUSCvEGRUsttha7peF8rHPBOuhacI7Z/DdiH\nQT86i9sf6IqT9+mauFQahcAvfjtNl8QGRh/5XE2hIKhKtiaPgqS5UWe9SQKBgBIx\nc7Kgx9wUOgjBB7S4Gu34YPwIJrEBsSkN3t5cngG/Rz7sNQiPVK7KDW5p0zHa6YFQ\n2xt5lvhRX3blmJYveNyWWuiZvhtHpIwSOVnPMaTbR5D1p8+2HgBWDu1gGxbl4AXH\n1m+8KqOnnrWchkIZVHXTZWZTFWcqRzwpAcwj0f+rAoGBAO3l/UuwlE+ILfBRq397\nFX8P9GSuHUM0dM7qY9CxiJ0I1v9JIciCOo/imJbfgS4fCAqbT5Tk5GFl6KbFf8MC\ni0IQVO+ix0y1yDyoov/HB9nMnw+E+NJe4xhKj1ey1GpIAZPK3B37tCSNJNDV45YA\nEfpLtZVWkF+mZKOi9RNDQbPG\n-----END PRIVATE KEY-----\n",
  "client_email": "tfserviceaccount@kubernetes-the-hard-way-266704.iam.gserviceaccount.com",
  "client_id": "114408394977455543807",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/tfserviceaccount%40kubernetes-the-hard-way-266704.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
  }
  EOT

  filename = "${path.module}/service-account-key.json"
}

output "service_account_key" {
  value = "${local_file.service_account_key.content}"
}
