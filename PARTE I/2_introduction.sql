
--- 1) Criando Tabelas e declarando tipos das colunas

create table  tb_filiais (
	cod_filial 	char(10)	not null, 
	nome_filial	varchar(20)	not null,	
	qtd_funcs	int		not null,
	cidade		varchar(20)	not null,	
	constraint ct_cod_filial primary key (cod_filial)
)

-- 2) Segunda tabela: Fabricas

create table tb_fabricas(
	cod_fab 			char(10)	not null,	
	nome_fab 			varchar(20)	not null,
	area_fab 			int		not null,
	qtd_funcs 			int 		not null,
	qtd_terceiros			int		default 0	not null, 	
	cidade 				varchar(20)	not null,
	data_fundacao 			date		not null,
	hora_ini_expediente 		time		default '08:00'	not null,	
	dt_hr_ult_visita_presidente 	datetime	not null,
	cod_filial 			char(10)	not null,
	constraint ct_cod_fabrica primary key (cod_fab)
)

-- 3) Inserindo linhas nas tabelas criadas acima

insert into tb_filiais(cod_filial,nome_filial,qtd_funcs,cidade) values('C0008','AV. Paulista',5000,'SAO PAULO')
insert into tb_filiais(cod_filial,nome_filial,qtd_funcs,cidade) values('C0009','AV. Paulista 2 ',15000,'SAO PAULO')



 	