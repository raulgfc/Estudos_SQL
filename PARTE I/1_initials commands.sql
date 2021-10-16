
--MODELO   INSERCAO

insert into tb_fabricas(cod_fab, nome_fab, area_fab, qtd_funcs, qtd_terceiros, cidade, data_fundacao, hora_ini_expediente, dt_hr_ult_visita_presidente, cod_filial)
values('DX1','Nike',1,2,3,'SAO PAULO','2017/08/15')



--DELETANDO   UMA   LINHA 

delete from tb_fabricas where cod_fab='DX1'


--ALTERANDO   VALORES

alter table tb_pessoas modify nome varchar(32)


--ISERINDO    COLUNA   COMPUTADA 

alter table tb_computed_column
add column3 compute column1 + column2 not materialized

