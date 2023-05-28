module "dev" {
  source = "../../"

  nome_repositorio = "prod"
  cargoIAM         = "prod"
  ambiante         = "produção"
}

output "IP_alb" {
  value = module.dev.IP
}