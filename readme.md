
# Modulo - Route Tables
[![Avanade](https://img.shields.io/badge/create%20by-Avanade-orange)](https://www.avanade.com/pt-br/about-avanade) [![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Modulo desenvolvido para facilitar a criação de Route Tables

## Compatibilidade de Versão

| Versão do Modulo | Versão Terraform | Versão AzureRM |
|----------------|-------------------| --------------- |
| >= 1.x.x       | 0.14.x            | >= 2.46         |

## Especificando versão

Para evitar que seu código receba atualizações automáticas do modulo, é preciso informar na chave `source` do bloco do module a versão desejada, utilizando o parametro `?ref=***` no final da url. conforme pode ser visto no exemplo abaixo.

## Exemplo de uso


```hcl
module "route_table" {
  source    = "git::https://github.com/mgsj2006/azurerm-module-route-table.git?ref=v0.1.0"
  ip_groups = {
    "route_0" = {
      "address_prefix"         = "172.0.0.0/8"
      "next_hop_in_ip_address" = "192.168.0.1"
      "next_hop_type"          = "VirtualAppliance"
    },
    "route_1" = {
      "address_prefix"         = "10.0.0.0/8"
      "next_hop_in_ip_address" = null
      "next_hop_type"          = "VirtualAppliance"
    }
  }
  location  = "brazilsouth"
  rg_name   = "resource_group_name"
  tags      = {
    area      = "infraestrutura"
  }
}
output "routes_ids" {
  value = module.route_table.routes
}
```

## Entrada de Valores

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name  |  nome dado a tabela de roteamento a ser criada | `string` | n/a | yes |
| routes | tabela informando os nomes e as propriedades de cada rota | `map(map(string))` | n/a | yes |
| rg_name | nome do resource group onde os recursos serão alocados | `string` | n/a | yes |
| tags | Tags adicionais | `map(string)` | `{}` | No |
| location | Região do Azure | `string` | n/a | yes |


## Saída de Valores

| Name | Description |
|------|-------------|
| routes | IDs geradas após provisionamento da tabela, para cada umad as rotas informadas em `routes` |
| udr_id | ID gerada após o provisionameto da tabela |

## Documentação de Referência

Terraform Route Tables: [https://www.terraform.io/providers/azurerm/latest/docs/resources/route_table](https://www.terraform.io/providers/azurerm/latest/docs/resources/route_table)
<br>
Terraform Routes: [https://www.terraform.io/providers/azurerm/latest/docs/resources/route](https://www.terraform.io/providers/azurerm/latest/docs/resources/route)
