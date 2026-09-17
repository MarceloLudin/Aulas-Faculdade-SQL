# 📚 Projeto SQL - Banco de Dados de Funcionários

Projeto desenvolvido durante as aulas de **Banco de Dados**, utilizando **PostgreSQL** e **pgAdmin**.

O objetivo do projeto é praticar a criação de tabelas, relacionamentos entre tabelas, inserção de dados e consultas SQL utilizando `JOIN`, `WHERE` e `ORDER BY`.

---

## 🗄️ Tecnologias utilizadas

- PostgreSQL
- pgAdmin
- SQL

---

## 📋 Estrutura do Banco de Dados

O banco de dados possui quatro tabelas principais:

### 👔 Cargo

Armazena os cargos e seus respectivos salários-base.

Exemplos:

- Estagiário
- Gerente
- Supervisor
- Encarregado
- Auxiliar

### 🏙️ Cidade

Armazena as cidades onde os funcionários residem.

Exemplos:

- Mogi das Cruzes
- São Paulo
- Campinas
- São José dos Campos

### 🏢 Departamento

Armazena os departamentos da empresa.

Exemplos:

- Vendas
- Compras
- PCP
- Produção

### 👨‍💼 Funcionário

Armazena os funcionários e suas informações, como:

- Código
- Nome
- Telefone
- Salário
- Cargo
- Cidade
- Departamento
- Gerente

---

## 🔗 Relacionamentos

A tabela `Funcionario` possui relacionamentos com outras tabelas através de chaves estrangeiras.

```text
Cargo
  │
  └──→ Funcionario

Cidade
  │
  └──→ Funcionario

Departamento
  │
  └──→ Funcionario

Funcionario
  │
  └──→ Funcionario
       (Gerente)
