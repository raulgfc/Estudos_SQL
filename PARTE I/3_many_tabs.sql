--/1) CRIACAO DE TABELAS

create table tb_regioes(

	sigla_regiao char(2)	not null,
	nome_regiao varchar(20) not null,
	constraint ct_sigla primary key (sigla_regiao)

)




--2) INSERCAO NA TABELA CRIADA 

insert into tb_regioes(sigla_regiao, nome_regiao)
	select sigla_regiao,
	nome_regiao
	from tb_regioes_prof as t2
	where sigla_regiao = t2.sigla_regiao

--3) CRIACAO DE TABELAS

create table tb_estados(
	sigla_estado char(2) NOT NULL,
	nome_estado varchar(20) NOT NULL,
	sigla_regiao char(2) NOT NULL,
	constraint ct_sigla_estado primary key(sigla_estado),
	foreign key(sigla_regiao) references tb_regioes(sigla_regiao)
)


--4) INSERCAO NA TABELA CRIADA 

insert into tb_estados(sigla_estado, nome_estado, sigla_regiao)
	select sigla_estado, nome_estado, 
	sigla_regiao
	from tb_estados_prof as t2
	where sigla_regiao = t2.sigla_regiao


--5) CRIACAO DE TABELAS 

create table tb_cidades(
	codigo     char(15)  	NOT NULL,
	nome       varchar(50)  NOT NULL,
	habitantes int 	 	NOT NULL,
	qtd_ruas   int 	 	NOT NULL,
	estado 	   char(2)	NOT NULL,


  	foreign key(estado) references tb_estados(sigla_estado)
)

 --6) INSERCAO NA TABELA CRIADA 
insert into tb_cidades(estado) values('BA')

--7)

insert into tb_cidades(codigo,nome,habitantes,qtd_ruas,estado)
	select codigo, nome, habitantes,qtd_ruas,estado
	from tb_cidades_prof as t2
	where codigo = t2.codigo

--8)
--a)

select *
from tb_estados,
tb_regioes

--b)
select *
from tb_estados,
tb_regioes
where tb_estados.sigla_regiao = tb_regioes.sigla_regiao

--C)
select t1.codigo,t1.nome, t1.habitantes,t1.qtd_ruas,t2.nome_estado,t3.nome_regiao
from tb_cidades as t1, tb_estados as t2, tb_regioes as t3 
where t1.estado = t2.sigla_estado and t2.sigla_regiao= t3.sigla_regiao 

--9)
select t1.codigo,t1.nome, t1.habitantes,t1.qtd_ruas,t2.nome_estado,t3.nome_regiao
from tb_cidades as t1, tb_estados as t2, tb_regioes as t3 
where t1.estado = t2.sigla_estado and t2.sigla_regiao= t3.sigla_regiao and t1.habitantes > 1000

--10)
select t1.nome_estado, t2.nome_regiao 
from tb_estados as t1, tb_regioes as t2
where t1.sigla_regiao= t2.sigla_regiao 

--11)
select distinct t3.nome_regiao
from tb_cidades as t1, tb_estados as t2,tb_regioes as t3 
where t1.estado = t2.sigla_estado and t2.sigla_regiao=t3.sigla_regiao

--12)
select i.codigo, i.nome, i.habitantes,jk.codigo, jk.nome, jk.habitantes
from tb_cidades as i, tb_cidades as jk
where i.habitantes > jk.habitantes and jk.nome = "JK"




