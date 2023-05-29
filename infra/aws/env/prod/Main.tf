module "prod" {
  source = "../../"

  nome_repositorio = "prod"
  cargoIAM         = "prod"
  ambiante         = "produção"
}

output "IP_alb" {
  value = module.prod.IP
}