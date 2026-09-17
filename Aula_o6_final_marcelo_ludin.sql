create table Cargo(
    codigo          numeric(5),
    nome            varchar(100) not null,
    salario_base    numeric(10,2) not null,
    Constraint pk_cargo_cod Primary Key (codigo)
);

create table Cidade(
    codigo          numeric(5),
    nome            varchar(100) not null,
    Constraint pk_cidade_cod Primary Key (codigo)
);

create table Departamento(
    codigo          numeric(5),
    nome            varchar(100) not null,
    Constraint pk_depto_cod Primary Key (codigo)
);

create table Funcionario(
    codigo          numeric(5),
    nome            varchar(100) not null,
    telefone        varchar(50) null,
    salario         numeric(10,2) not null,
    cod_cargo       numeric(5) not null,
    cod_cidade      numeric(5) not null,
    cod_depto       numeric(5) not null,
    gerente         numeric(5),
    Constraint pk_func_cod Primary Key (codigo),
    Constraint fk_func_cargo
        Foreign Key(cod_cargo) References Cargo(codigo),
    Constraint fk_func_cidade
        Foreign Key (cod_cidade) References Cidade(codigo),
    Constraint fk_func_depto
        Foreign Key (cod_depto) References Departamento(codigo),
    Constraint fk_func_gerente
        Foreign Key (gerente) References Funcionario(codigo)
);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (1,'estagiario',800.00);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (2,'gerente',2000.00);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (3,'supervisor',1800.00);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (4,'encarregado',1500.00);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (5,'auxiliar',1000.00);

INSERT INTO cidade (codigo,nome) VALUES (1,'Mogi das Cruzes');
INSERT INTO cidade (codigo,nome) VALUES (2,'São Paulo');
INSERT INTO cidade (codigo,nome) VALUES (3,'Campinas');
INSERT INTO cidade (codigo,nome) VALUES (4,'São Jose dos Campos');

INSERT INTO departamento VALUES (1,'vendas');
INSERT INTO departamento VALUES (2,'compras');
INSERT INTO departamento VALUES (3,'PCP');
INSERT INTO departamento VALUES (4,'produção');

insert into funcionario values
(1, 'Antonio Leite', '99989 0999', 10000.00, 2, 3, 2, null),
(2, 'Lucas Silva', '98778 7878', 7000.00, 2, 1, 1, 1),
(3, 'Bruna Santos', '99999 9987', 2000.80, 3, 3, 4, 2),
(4, 'Camila Rocha', '98471 5454', 4000.00, 4, 2, 1, 1),
(5, 'Dayna Santos', '99165 2211', 600.00, 1, 4, 3, 1),
(6, 'Emerson Santos', '99995 4433', 6000.00, 2, 3, 4, 2);

SELECT nome, salario FROM funcionario WHERE  salario between 6000 AND  8000
ORDER BY salario;

SELECT funcionario.nome, cargo.nome
FROM funcionario
INNER JOIN cargo
ON funcionario.cod_cargo = cargo.codigo
ORDER BY funcionario.nome;

SELECT departamento.nome, funcionario.nome
FROM departamento
INNER JOIN funcionario
ON departamento.codigo = funcionario.cod_depto
ORDER BY departamento.nome, funcionario.nome;

SELECT funcionario.nome, funcionario.salario
FROM funcionario
INNER JOIN departamento
ON funcionario.cod_depto = departamento.codigo
WHERE departamento.nome = 'compras';

SELECT funcionario.nome, cidade.nome
FROM funcionario
INNER JOIN cidade
ON funcionario.cod_cidade = cidade.codigo
WHERE cidade.nome LIKE '%São%';

SELECT funcionario.nome, funcionario.salario, cargo.nome
FROM funcionario
INNER JOIN cidade
ON funcionario.cod_cidade = cidade.codigo
INNER JOIN cargo
ON funcionario.cod_cargo = cargo.codigo
WHERE cidade.nome = 'Campinas'
ORDER BY funcionario.salario DESC;

SELECT funcionario.nome, cidade.nome, departamento.nome
FROM funcionario
INNER JOIN cidade
ON funcionario.cod_cidade = cidade.codigo
INNER JOIN departamento
ON funcionario.cod_depto = departamento.codigo
INNER JOIN cargo
ON funcionario.cod_cargo = cargo.codigo
WHERE cargo.nome = 'estagiario';

SELECT funcionario.nome
FROM funcionario
INNER JOIN funcionario AS gerente
ON funcionario.gerente = gerente.codigo
WHERE gerente.nome = 'Antonio Leite'
ORDER BY funcionario.nome;
