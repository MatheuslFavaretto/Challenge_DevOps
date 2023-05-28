module "dev" {
  source = "../../"

  nome_repositorio = "dev"
  cargoIAM         = "dev"
  ambiante         = "desenvolvimento"
}

output "IP_alb" {
  value = module.dev.IP
}