#!/bin/sh

name_user="test"
name_organizacion="prueba"
name_project="prueba"
name_repository="prueba"
name_branch_new="prueba"
name_branch_target="prueba"
token="tokenizado"

# GITHUB
curl -X POST -H "Authorization: token ${token}" \
  -d '{"title": "Título del pull request", "head": ${name_branch_new}, "base": ${name_branch_target}, "body": "Descripción del PR"}' \
  https://api.github.com/repos/${name_user}/${name_project}/pulls

# AZURE
curl -X POST -H "Authorization: Basic $(echo -n :${token} | base64)" \
  -H "Content-Type: application/json" \
  -d '{"sourceRefName": "refs/heads/${name_branch_new}", "targetRefName": "refs/heads/${name_branch_target}", "title": "Titulo del pull request", "description": "Descripcion del pr"}' \
  https://dev.azure.com/${name_organizacion}/${name_project}/_apis/git/repositories/${name_repository}/pullRequests?api-version=6.0
