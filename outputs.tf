output "dn" {
  value       = aci_rest.fabricSpPortP.id
  description = "Distinguished name of `fabricSpPortP` object."
}

output "name" {
  value       = aci_rest.fabricSpPortP.content.name
  description = "Spine interface profile name."
}
