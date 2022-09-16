#!/usr/bin/bash
# Campos: Nome/Sobrenome|Telefone|Endereco

#Existe entrada?

[[ -z "$1" ]] && { echo "Heyyyy. Voce precisa passar um arquivo 'csv'"; exit 1 ;}

OLDIFS="$IFS"

#Declarando novo campo delimitador

IFS='|'
while read nome telefone endereco outros; do
	[[ "$nome" =~ ^# ]] && continue
	echo -e "\e[31;1m============= ${nome} =============\e[m
	Telefone:\t${telefone}
	Endereco:\t${endereco}
	Outros	:\t${outros}
	"
done < "$1"

#Pegando IFS PADRAO
IFS="$OLDIFS"
