# Projeto de Banco de Dados - Oficina Mecânica

## Visão Geral

Este repositório contém o esquema lógico e o script SQL de criação de um banco de dados para uma oficina mecânica. O projeto foi criado para gerenciar clientes, veículos, ordens de serviço, funcionários, produtos (serviços e peças), fornecedores, estoque e pagamentos.

O objetivo é fornecer um modelo de banco de dados que facilite a gestão das operações diárias de uma oficina, incluindo o registro de serviços prestados, controle de estoque de peças, e rastreamento de pagamentos.

## Entidades e Relacionamentos

O banco de dados foi modelado com as seguintes entidades principais:

- **Cliente**: Armazena informações dos clientes da oficina.
- **Veículo**: Relaciona os veículos dos clientes.
- **Produto**: Inclui tanto serviços oferecidos pela oficina quanto as peças utilizadas.
- **Pedido**: Representa as ordens de serviço que um cliente solicita.
- **Funcionário**: Representa os funcionários da oficina que realizam os serviços.
- **Fornecedor**: Representa os fornecedores de peças.
- **Estoque**: Relaciona produtos com os fornecedores e gerencia a quantidade disponível.
- **Pagamento**: Registra o pagamento de uma ordem de serviço.
- **Ordem de Serviço (OS)**: Documento que armazena os serviços realizados e as peças utilizadas para cada veículo.

## Diagrama de Entidades (ERD)

Adicione aqui um link para o **diagrama ERD** ou inclua uma imagem, se houver.

## Estrutura do Banco de Dados

As tabelas do banco de dados foram definidas conforme o seguinte esquema:

### Tabelas Principais:

- **Cliente**: Guarda as informações dos clientes, como nome, endereço e telefone.
- **Veiculo**: Relaciona veículos aos clientes, armazenando dados como placa, modelo e ano.
- **Produto**: Contém os serviços e peças disponíveis, com seu preço.
- **Ordem de Serviço (OS)**: Registra cada serviço realizado para um veículo, associando o cliente, funcionário e os serviços executados.
- **ItensOS**: Relaciona os serviços e peças associados a uma ordem de serviço.
- **Pagamento**: Armazena as informações de pagamento de cada OS.
- **Fornecedor**: Contém os fornecedores das peças.
- **Estoque**: Gerencia o estoque das peças fornecidas.

## Instalação e Uso

### Requisitos:

- **MySQL** ou outro SGBD compatível.
- Um cliente SQL, como **MySQL Workbench**, **DBeaver** ou **phpMyAdmin**.

### Passos para Executar:

1. Clone este repositório:
   ```bash
   git clone https://github.com/AllanCardosoDev/banco_dados_zero
   cd oficina-db-challenge
   ```
