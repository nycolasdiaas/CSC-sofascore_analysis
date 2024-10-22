#!/bin/bash

if [ -z "$VIRTUAL_ENV" ]; then
    echo "O ambiente virtual não está ativo."

    if [ ! -d "../.venv" ]; 
    then
        echo "O ambiente virtual não existe. Será criado nesse momento! ..."
        python3 -m venv ../.venv
    else 
        echo "O ambiente virtual existe."
    fi

    echo "Ativando o ambiente virtual..."
    source ../.venv/bin/activate
else
    echo "O ambiente virtual já está ativo."
fi

echo "Instalando dependências..."
pip install -r requirements.txt


echo "Baixando o dataset..."
kaggle datasets download felipesembay/sofascore-and-transfermarkt-football-data

if [ ! -d "./data" ];
then 
    echo "Criando a pasta data/"
    mkdir data
fi

echo "Descompactando o dataset .zip ..."
unzip -o sofascore-and-transfermarkt-football-data.zip -d ./data/

echo "Apagando .zip ..."
rm sofascore-and-transfermarkt-football-data.zip

echo "Processo concluído!"