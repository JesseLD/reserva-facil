#!/bin/bash

# Solicitar o nome do módulo
echo "Digite o nome do módulo: "
read moduleName

# Verificar se o nome do módulo foi fornecido
if [ -z "$moduleName" ]; then
  echo "Erro: Nome do módulo não fornecido."
  exit 1
fi

# Verificar se o diretório BaseModule existe
if [ ! -d "BaseModule" ]; then
  echo "Erro: Diretório 'BaseModule' não encontrado."
  exit 1
fi

# Copiar a estrutura de BaseModule para o novo módulo
cp -r BaseModule "$moduleName"

# Transformar o nome do módulo para camelCase
lowercase_moduleName=$(echo "$moduleName" | awk '{print tolower(substr($0,1,1)) substr($0,2)}')

# Entrar na pasta do novo módulo
cd "$moduleName" || exit

# Renomear arquivos em todos os subdiretórios
find . -type f -name "*BaseModule*.ts" | while read -r file; do
  new_file=$(echo "$file" | sed "s/BaseModule/$moduleName/")
  mv "$file" "$new_file"
done

# Renomear arquivos em todos os subdiretórios
find . -type f -name "*baseModule*.ts" | while read -r file; do
  new_file=$(echo "$file" | sed "s/baseModule/$lowercase_moduleName/")
  mv "$file" "$new_file"
done

# Substituir o conteúdo dos arquivos em todos os subdiretórios
find . -type f -name "*.ts" | while read -r file; do
  sed -i "s/BaseModule/$moduleName/g" "$file"
  sed -i "s/baseModule/$lowercase_moduleName/g" "$file"
done

# Substituir o conteúdo dos arquivos em todos os subdiretórios
find . -type f -name "*.ts" | while read -r file; do
  sed -i "s/BaseModel/$moduleName/g" "$file"
  sed -i "s/baseModel/$lowercase_moduleName/g" "$file"
done

# Renomear 'Entity.ts' para o nome do módulo (ex: 'MyModule.ts')
find . -type f -name "Entity.ts" | while read -r file; do
  new_file=$(echo "$file" | sed "s/Entity/$moduleName/")
  mv "$file" "$new_file"
done

# Renomear 'BaseModel.ts' para o nome do módulo (ex: 'MyModel.ts')
find . -type f -name "BaseModel.ts" | while read -r file; do
  new_file=$(echo "$file" | sed "s/BaseModel/$moduleName/")
  mv "$file" "$new_file"
done

# # Alterar nomes específicos, como 'user-validate.ts'
# find . -type f -name "user-validate.ts" | while read -r file; do
#   new_file=$(echo "$file" | sed "s/user-validate/$lowercase_moduleName-validate/")
#   mv "$file" "$new_file"
# done

cd ..

echo "Módulo '$moduleName' criado com sucesso!"
