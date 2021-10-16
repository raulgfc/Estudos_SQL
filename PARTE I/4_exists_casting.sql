--1) Selecionando dados com filtros e union 

select  cod_fabr, 
		nome_fabr
		from tb_fabricas
		where qtd_funcs > 100
union

select  cod_filial,
	      nome_filial
	from tb_filiais
	where cidade = "Sampa"

/*

RESULTADO NA TELA

cod_fabr   nome_fabr             
 ---------- --------------------  
 F01        Fabrica 01            
 F02        Fabrica 02            
 F03        Fabrica 03            
 F04        Fabrica 04            
 F05        Fabrica 05            
 F06        Fabrica 06            
 F07        Fabrica 07            
 F08        Fabrica 08            
 F09        Fabrica 09            
 F10        Fabrica 10            
 F11        Fabrica 11            
 A01        Filial 01             
 A06        Filial 06             
 A07        Filial 07             

(14 rows affected) 

*/

--2)

select  cod_fabr
		from tb_fabricas
		where qtd_funcs > 100
union

select  cod_filial,
	      nome_filial
	from tb_filiais
	where cidade = "Sampa"

--3)


select  cod_fabr
		from tb_fabricas
union

select  qtd_funcs
	from tb_filiais
	

--4)
--a)

select *
 	from tb_acidentes
 	where Data_hora  >= '01/01/2005' and Data_hora <= '31/12/2005'
	and Placa = 'AAP9591'

/*
RESULTADO NA TELA


 Placa   Data_hora                       Valor_Danos   cod_pes_motorista  
 ------- ------------------------------- ------------- -----------------  
 AAP9591             Dec 31 2005 12:00AM        100.00 RA00033577         

(1 row affected)

*/

--b)
select *
 	from tb_acidentes
 	where Data_hora  >= '01/01/2005' and Data_hora <= '31/12/2005 23:59'
	and Placa = 'AAP9591'

/*
RESULTADO NA TELA

 Placa   Data_hora                       Valor_Danos   cod_pes_motorista  
 ------- ------------------------------- ------------- -----------------  
 AAP9591             Dec 31 2005 12:00AM        100.00 RA00033577         
 AAP9591             Dec 31 2005 11:00PM       1005.00 RA00034117         
 AAP9591             Dec 31 2005 11:59PM        200.00 RA00034360         

(3 rows affected) 
*/

--c)
select *
 	from tb_acidentes
 	where Data_hora  >= '01/01/2005' and Data_hora <= '31/12/2005 23:59:59'
	and Placa = 'AAP9591'

/*
RESULTADO NA TELA

 Placa   Data_hora                       Valor_Danos   cod_pes_motorista  
 ------- ------------------------------- ------------- -----------------  
 AAP9591             Dec 31 2005 12:00AM        100.00 RA00033577         
 AAP9591             Dec 31 2005 11:00PM       1005.00 RA00034117         
 AAP9591             Dec 31 2005 11:59PM        200.00 RA00034360         
 AAP9591             Dec 31 2005 11:59PM        500.00 RA00036972         

(4 rows affected) 
 
*/
--d)
select *
 	from tb_acidentes
 	where Data_hora  >= '01/01/2005' and Data_hora <= '31/12/2005 23:59:59.100'
	and Placa = 'AAP9591'

/*
RESULTADO NA TELA

Placa   Data_hora                       Valor_Danos   cod_pes_motorista  
 ------- ------------------------------- ------------- -----------------  
 AAP9591             Dec 31 2005 12:00AM        100.00 RA00033577         
 AAP9591             Dec 31 2005 11:00PM       1005.00 RA00034117         
 AAP9591             Dec 31 2005 11:59PM        200.00 RA00034360         
 AAP9591             Dec 31 2005 11:59PM        500.00 RA00036972         
 AAP9591             Dec 31 2005 11:59PM        600.00 RA00037322         

(5 rows affected) 
*/


--e)
select *
 	from tb_acidentes
 	where Data_hora  >= '01/01/2005' and Data_hora <= '01/01/2006'
	and Placa = 'AAP9591'
 
 /*
RESULTADO NA TELA
 Placa   Data_hora                       Valor_Danos   cod_pes_motorista  
 ------- ------------------------------- ------------- -----------------  
 AAP9591             Dec 31 2005 12:00AM        100.00 RA00033577         
 AAP9591             Dec 31 2005 11:00PM       1005.00 RA00034117         
 AAP9591             Dec 31 2005 11:59PM        200.00 RA00034360         
 AAP9591             Dec 31 2005 11:59PM        500.00 RA00036972         
 AAP9591             Dec 31 2005 11:59PM        600.00 RA00037322         
 AAP9591             Dec 31 2005 11:59PM        800.00 RA00047124         
 AAP9591             Dec 31 2005 11:59PM       1000.00 RA00048574         
 AAP9591             Dec 31 2005 11:59PM        700.00 RA00048963         
 AAP9591             Jan  1 2006 12:00AM       2400.00 RA00073043         

(9 rows affected) 

 
*/


--x) SUB SELECT

select *
 from tb_carros
where exists(select * from tb_carros
 	where ano >=2005 and ano<=2008 ) or
exists(select * from tb_acidentes
 	where  Data_hora  >= '01/01/2005' and Data_hora <= '31/12/2005')

--5)

select *
from tb_pessoas
where exists (select 1 from tb_possui, tb_carros
where tb_pessoas.cod_pes =tb_possui.cod_pes
and   tb_possui.placa =tb_carros.placa
and   tb_carros.ano between 2005 and 2007)
or exists (select * from tb_acidentes
where data_hora between "01/01/2005" and "31/12/2007"
and tb_acidentes.cod_pes_motorista = tb_pessoas.cod_pes)


select *
from tb_carros
where   
and exists (select * from


--6)

--a)
select t1.*, 
       t3.nome
	from tb_carros as t1,
             tb_possui as t2,
             tb_pessoas as t3			
	where t2.cod_pes = t3.cod_pes
	and   t2.placa = t1.placa
	and   t1.ano >=2006 
	and   t1.ano <=2008


--b) 
select distinct t1.*, 
       t3.nome
	from tb_carros as t1,
             tb_possui as t2,
             tb_pessoas as t3,
	     tb_acidentes as t4			
	where t2.cod_pes = t3.cod_pes
	and   t2.placa = t1.placa
	and t2.placa = t4.placa
	and   t1.ano >=2006 
	and   t1.ano <=2008
	and exists(select 1 from tb_acidentes as t4
                   where t4.cod_pes_motorista = t3.cod_pes
		   and t4.placa = t1.placa)	
		


--7) 

select est.sigla_estado,
	est.nome_estado
	from tb_estados est
	where exists (select 1 from tb_cidades t1
	t1.habitantes >500000
	and t1.estado =est.sigla_estado) 


