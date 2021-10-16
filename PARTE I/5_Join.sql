--1)
--A) SELECIONANDO DA TABELA OS CASOS ONDE A AREA DA FABRICA É IGUAL A NULA
select *  
	from tb_fabricas_prof
	where area_fabr = NULL

--B) SELECIONANDO DA TABELA OS CASOS ONDE A AREA DA FABRICA É DIFERENTE DE NULO
select *  
from tb_fabricas_prof
where area_fabr != NULL

--C) SELECIONANDO DA TABELA OS CASOS ONDE A AREA DA FABRICA É NULO COM O COMANDO IS, NOTE A DIFERENÇA AO RODAR.
select *  
from tb_fabricas_prof
where area_fabr is NULL

--D) SELECIONANDO DA TABELA OS CASOS ONDE A AREA DA FABRICA NAO É NULO COM O COMANDO IS NOT, NOTE A DIFERENÇA AO RODAR.
select *  
from tb_fabricas_prof
where area_fabr is not NULL



--2)

insert into tb_filiais *
	select *
	from tb_filiais_prof as t2

create table tb_fabricas(
	cod_fabr 			char(10)	not null,	
	nome_fabr 			varchar(20)	not null,
	area_fabr 			int		null,
	qtd_funcs 			int 		not null,
	qtd_terceiros			int		default 0	not null, 	
	cidade 				varchar(20)	not null,
	data_fundacao 			date		not null,
	hora_ini_expediente 		time		default '08:00'	not null,	
	dt_hr_ult_visita_presidente 	datetime        null,
	cod_filial 			char(10)	not null,
	
	constraint ct_cod_fabrica primary key (cod_fabr),	

	foreign key(cod_filial) references tb_filiais (cod_filial)
)



insert into tb_fabricas (cod_fabr,nome_fabr,area_fabr,qtd_funcs,qtd_terceiros,cidade,data_fundacao,hora_ini_expediente,dt_hr_ult_visita_presidente,cod_filial)  
select cod_fabr,nome_fabr,area_fabr,qtd_funcs,qtd_terceiros,cidade,data_fundacao,hora_ini_expediente,dt_hr_ult_visita_presidente,cod_filial
from tb_fabricas_prof 

/*
COMANDOS E RESULTADOS DA TELA:

a)

 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial  
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ----------  
 F01        Fabrica 01                   110         210             0 Cidade 01                 Jan 31 2010              8:00AM             Feb 28 2014  4:15PM A01         
 F02        Fabrica 02                  NULL         220            15 Cidade 02                 Mar 18 1950             10:00AM             Jul 20 2013 11:23AM A02         
 F03        Fabrica 03                   130         230            20 Cidade 03                 Mar 18 1974              9:22AM             Sep 18 2013  2:14PM A03         
 F04        Fabrica 04                  NULL         240             0 Cidade 04                 Dec 21 1999             10:15AM             Dec  4 2011 11:11AM A04         
 F05        Fabrica 05                   150         250            19 Cidade 05                 Jun 28 2011              9:00AM             Jun 21 2014  4:16PM A05         
 F06        Fabrica 06                  NULL         260           100 Sampa                     Apr 14 2012              8:30AM             Apr 13 2013 12:13PM A06         
 F07        Fabrica 07                  NULL         270            55 Rio                       May 12 2013              9:00AM             Jun 11 2014  2:14PM A01         
 F08        Fabrica 08                  NULL         280           110 Sampa                     Jan 30 2000              8:00AM             Jan 21 2011 11:11AM A01         
 F09        Fabrica 09                  NULL         300            90 Ribeira                   Jul 16 2014              8:30AM             Sep 18 2015  6:10PM A03         
 F10        Fabrica 10                   300         350           240 Cidade 5                  Oct 30 2003              9:00AM             May 16 2007  2:00PM A06         
 F11        Fabrica 11                  NULL         330             0 Cidade 6                  Jul 16 2004              8:00AM                            NULL A05         

(11 rows affected) 


b) 
 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial  
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ----------  
 F05        Fabrica 05                   150         250            19 Cidade 05                 Jun 28 2011              9:00AM             Jun 21 2014  4:16PM A05         
 F10        Fabrica 10                   300         350           240 Cidade 5                  Oct 30 2003              9:00AM             May 16 2007  2:00PM A06         

(2 rows affected) 


c)
Execution finished at 19/09/2017 08:46:46.

 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial  
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ----------  
 F01        Fabrica 01                   110         210             0 Cidade 01                 Jan 31 2010              8:00AM             Feb 28 2014  4:15PM A01         
 F03        Fabrica 03                   130         230            20 Cidade 03                 Mar 18 1974              9:22AM             Sep 18 2013  2:14PM A03         

(2 rows affected) 


Execution finished at 19/09/2017 08:47:10.


Rº Alguns valores referente ao tamanho da area ficaram fora da busca, por este motivo é inconsistente a busca.

2.2)

 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial  
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ----------  
 F01        Fabrica 01                   210         210             0 Cidade 01                 Jan 31 2010              8:00AM             Feb 28 2014  4:15PM A01         
 F02        Fabrica 02                  NULL         220            15 Cidade 02                 Mar 18 1950             10:00AM             Jul 20 2013 11:23AM A02         
 F03        Fabrica 03                   230         230            20 Cidade 03                 Mar 18 1974              9:22AM             Sep 18 2013  2:14PM A03         
 F04        Fabrica 04                  NULL         240             0 Cidade 04                 Dec 21 1999             10:15AM             Dec  4 2011 11:11AM A04         
 F05        Fabrica 05                   250         250            19 Cidade 05                 Jun 28 2011              9:00AM             Jun 21 2014  4:16PM A05         
 F06        Fabrica 06                  NULL         260           100 Sampa                     Apr 14 2012              8:30AM             Apr 13 2013 12:13PM A06         
 F07        Fabrica 07                  NULL         270            55 Rio                       May 12 2013              9:00AM             Jun 11 2014  2:14PM A01         
 F08        Fabrica 08                  NULL         280           110 Sampa                     Jan 30 2000              8:00AM             Jan 21 2011 11:11AM A01         
 F09        Fabrica 09                  NULL         300            90 Ribeira                   Jul 16 2014              8:30AM             Sep 18 2015  6:10PM A03         
 F10        Fabrica 10                   400         350           240 Cidade 5                  Oct 30 2003              9:00AM             May 16 2007  2:00PM A06         
 F11        Fabrica 11                  NULL         330             0 Cidade 6                  Jul 16 2004              8:00AM                            NULL A05         

(11 rows affected) 



Rº o Valor nulo não foi afetado.


2.3)


 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial  
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ----------  
 F01        Fabrica 01                   210         210             0 Cidade 01                 Jan 31 2010              8:00AM             Feb 28 2014  4:15PM A01         
 F02        Fabrica 02                   100         220            15 Cidade 02                 Mar 18 1950             10:00AM             Jul 20 2013 11:23AM A02         
 F03        Fabrica 03                   230         230            20 Cidade 03                 Mar 18 1974              9:22AM             Sep 18 2013  2:14PM A03         
 F04        Fabrica 04                   100         240             0 Cidade 04                 Dec 21 1999             10:15AM             Dec  4 2011 11:11AM A04         
 F05        Fabrica 05                   250         250            19 Cidade 05                 Jun 28 2011              9:00AM             Jun 21 2014  4:16PM A05         
 F06        Fabrica 06                   100         260           100 Sampa                     Apr 14 2012              8:30AM             Apr 13 2013 12:13PM A06         
 F07        Fabrica 07                   100         270            55 Rio                       May 12 2013              9:00AM             Jun 11 2014  2:14PM A01         
 F08        Fabrica 08                   100         280           110 Sampa                     Jan 30 2000              8:00AM             Jan 21 2011 11:11AM A01         
 F09        Fabrica 09                   100         300            90 Ribeira                   Jul 16 2014              8:30AM             Sep 18 2015  6:10PM A03         
 F10        Fabrica 10                   400         350           240 Cidade 5                  Oct 30 2003              9:00AM             May 16 2007  2:00PM A06         
 F11        Fabrica 11                   100         330             0 Cidade 6                  Jul 16 2004              8:00AM                            NULL A05         

(11 rows affected) 

Rº Neste momento foram somados a todas as linhas o valor 100, em caso de NULL o campo recebe 100. 


2.4)


select *
 from tb_fabricas as t1
 inner join
 tb_filiais as t2
 on t1. cod_filial = t2. cod_filial


 cod_fabr   nome_fabr            area_fabr   qtd_funcs   qtd_terceiros cidade               data_fundacao    hora_ini_expediente dt_hr_ult_visita_presidente     cod_filial cod_filial nome_filial          qtd_funcs   cidade                
 ---------- -------------------- ----------- ----------- ------------- -------------------- ---------------- ------------------- ------------------------------- ---------- ---------- -------------------- ----------- --------------------  
 F01        Fabrica 01                   210         210             0 Cidade 01                 Jan 31 2010              8:00AM             Feb 28 2014  4:15PM A01        A01        Filial 01                    310 Sampa                 
 F02        Fabrica 02                   100         220            15 Cidade 02                 Mar 18 1950             10:00AM             Jul 20 2013 11:23AM A02        A02        Filial 02                    320 Rio                   
 F03        Fabrica 03                   230         230            20 Cidade 03                 Mar 18 1974              9:22AM             Sep 18 2013  2:14PM A03        A03        Filial 03                    330 Guaru                 
 F04        Fabrica 04                   100         240             0 Cidade 04                 Dec 21 1999             10:15AM             Dec  4 2011 11:11AM A04        A04        Filial 04                    340 Sidney                
 F05        Fabrica 05                   250         250            19 Cidade 05                 Jun 28 2011              9:00AM             Jun 21 2014  4:16PM A05        A05        Filial 05                    350 Tokyo                 
 F06        Fabrica 06                   100         260           100 Sampa                     Apr 14 2012              8:30AM             Apr 13 2013 12:13PM A06        A06        Filial 06                    360 Sampa                 
 F07        Fabrica 07                   100         270            55 Rio                       May 12 2013              9:00AM             Jun 11 2014  2:14PM A01        A01        Filial 01                    310 Sampa                 
 F08        Fabrica 08                   100         280           110 Sampa                     Jan 30 2000              8:00AM             Jan 21 2011 11:11AM A01        A01        Filial 01                    310 Sampa                 
 F09        Fabrica 09                   100         300            90 Ribeira                   Jul 16 2014              8:30AM             Sep 18 2015  6:10PM A03        A03        Filial 03                    330 Guaru                 
 F10        Fabrica 10                   400         350           240 Cidade 5                  Oct 30 2003              9:00AM             May 16 2007  2:00PM A06        A06        Filial 06                    360 Sampa                 
 F11        Fabrica 11                   100         330             0 Cidade 6                  Jul 16 2004              8:00AM                            NULL A05        A05        Filial 05                    350 Tokyo                 

(11 rows affected) 

*/




