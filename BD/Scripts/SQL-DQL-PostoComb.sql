select * from departamento;

select * from gerente;

select * from empregado;

-- ADS 2ª Manha PCRxPD Turma 2 (Terça) --

select cpf, nome, sexo, salario, ctps, email from empregado
	where salario >= 2000;

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf and
			e.salario >= 2000;

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf
			where e.salario >= 2000
				order by e.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by e.nome;
			
select date_format(v.dataVenda, '%h:%m %d/%m/%Y') "Data", p.nome "Produto", p.categoria "Categoria", p.valor "Preco Und",
				iv.qtdProduto "Quantidade", v.valorTotal "Valor Total", e.nome "Empregado",
				d.nome "Departamento", eg.nome "Gerente"
		from itensVenda iv 
			inner join vendas v on v.idvendas = iv.vendas_idvendas
            inner join estoque p on p.idproduto = iv.estoque_idproduto
            inner join empregado e on e.cpf = v.empregado_cpf
            inner join trabalhar t on t.empregado_cpf = e.cpf
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by v.dataVenda;
            
select e.cpf "CPF Empregado", e.nome "Empregado", count(v.empregado_cpf) "Quantidade Venda",
	sum(v.valorTotal) "Total das Vendas"
	from vendas v
		inner join empregado e on e.cpf = v.empregado_cpf
			group by v.empregado_cpf;
 
select substring(v.dataVenda, 1, 10) "Data Venda", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade por Dia",
	sum(v.valorTotal) "Valor do Dia"
		from vendas v
			group by (substring(v.dataVenda, 1, 10));

select substring( date_format(v.dataVenda, '%d-%m-%Y'), 1, 10) "Data Venda", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade por Dia",
	concat('R$ ' , round(sum(v.valorTotal), 2))  "Valor do Dia"
		from vendas v
			group by (substring(v.dataVenda, 1, 10));
    
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.cpf in (select empregado_cpf from dependente)
					order by e.nome;

 select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.cpf in (select empregado_cpf from vendas)
					order by e.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by e.nome;            
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario <= (select avg(salario) from empregado)
					order by e.nome;              
    
select d.nome "Departamento", d.email "Email", d.localDep "Local Departamento", d.horario "Horário", 
	d.descricao "Descrição Departamento", d.gerente_empregado_cpf "CPF Gerente", e.nome "Gerente"
     from departamento d, gerente g, empregado e
		where d.gerente_empregado_cpf = g.empregado_cpf and
				g.empregado_cpf = e.cpf;

select d.nome "Departamento", d.email "Email", d.localDep "Local Departamento", d.horario "Horário", 
	d.descricao "Descrição Departamento", d.gerente_empregado_cpf "CPF Gerente", e.nome "Gerente"
     from departamento d 
		inner join gerente g on d.Gerente_Empregado_CPF = g.empregado_cpf
        inner join empregado e on g.empregado_cpf = e.cpf;

select d.nome, d.cpf, d.dataNasc, d.parentesco, e.nome, e.cpf
	from dependente as d, empregado e
		where d.empregado_cpf = e.cpf;

select d.nome, d.cpf, d.dataNasc, d.parentesco, e.nome, e.cpf
	from dependente as d
		inner join empregado e on d.empregado_cpf = e.cpf;
        
select e.nome "Empregado", e.dataAdm "Data Admissão", d.nome "Departamento", 
	d.localDep "Local Departamento", o.nome "Ocupação", e.salario "Salário"
		from trabalhar t
			inner join empregado e on t.empregado_cpf = e.cpf
			inner join departamento d on t.Departamento_idDepartamento = d.iddepartamento
			inner join ocupacao o on t.ocupacao_cbo = o.cbo;
            
create view empregadoTrab as
	select e.nome "Empregado", e.dataAdm "Data Admissão", d.nome "Departamento", 
	d.localDep "Local Departamento", o.nome "Ocupação", e.salario "Salário"
		from trabalhar t
			inner join empregado e on t.empregado_cpf = e.cpf
			inner join departamento d on t.Departamento_idDepartamento = d.iddepartamento
			inner join ocupacao o on t.ocupacao_cbo = o.cbo;
     
select * from empregadotrab;

desc empregadotrab;
     
select * from empregadotrab
	order by departamento;

select * from empregadotrab
	where `Salário` >= (select avg(salario) from empregado)
		order by departamento;

drop view empregadotrab;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", tel.numero "Telefone"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join telefone tel on tel.empregado_cpf = e.cpf;
            
select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", tel.numero "Telefone"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            left join telefone tel on tel.empregado_cpf = e.cpf
				order by d.nome;       
 
select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", t.numero "Telefone"
	from telefone t
		left join empregado e on e.cpf = t.empregado_cpf
        left join departamento d on d.iddepartamento = t.departamento_iddepartamento
        left join fornecedor f on f.`cnpj/cpf` = t.`fornecedor_cnpj/cpf`; 

select e.nome "Nome", t.numero "Telefone", Empregado
		from telefone t
			inner join empregado e on e.cpf = t.empregado_cpf;

create view telefoneEmp as
	select e.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join empregado e on e.cpf = t.empregado_cpf;

create view telefoneDep as
	select d.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join departamento d on d.iddepartamento = t.departamento_iddepartamento;

create view telefoneForn as
	select f.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join fornecedor f on f.`cnpj/cpf` = t.`fornecedor_cnpj/cpf`;

select * from telefoneemp
	union select * from telefonedep
		union select * from telefoneforn;

drop view filhoidade;

create view filhoIdade as
	select nome, cpf, parentesco, year(now()) - year(dataNasc) "idade", Empregado_CPF
		from dependente
			where parentesco like "%ilh%";
        
create view empregadoAuxCreche as
	select e.nome "Empregado", e.cpf "CPF", e.salario "Salário",
		case when fi.idade >= 3 then 'Sim'
			else 'Não' end "Auxílio Creche"
				from empregado e
					left join filhoidade fi on fi.Empregado_CPF = e.CPF
						order by e.nome;

select empregado, cpf, `salário`, `Auxílio Creche`, 
	case when `Auxílio Creche` like "Sim" then count(`Auxílio Creche`)  
		when `Auxílio Creche` like "Não" then 0 end "Quantidade de Auxílio"
			from empregadoauxcreche
				group by cpf, `Auxílio Creche`;
                

delimiter //
create procedure vendasDatas(in dataIni datetime, in dataFim datetime)
	begin
		select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
			concat('R$ ', round(est.valor, 2)) "Valor do Produto", concat('R$ ', v.valorTotal) "Valor Total", 
			e.nome "Empregado", d.nome "Departamento"
				from vendas v
					inner join empregado e on e.CPF = v.Empregado_CPF
					inner join trabalhar t on t.Empregado_CPF = e.CPF
					inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
					inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
					inner join estoque est on est.idProduto = iv.Estoque_idProduto
						where v.dataVenda >= dataIni and v.dataVenda <= dataFim
							and (d.nome like "Conv%" or d.nome like "Frente%")
								order by v.dataVenda;
    end //
delimiter ;

call vendasDatas('2022-06-01', '2022-06-15');

delimiter //
create procedure produtoCat(in cat varchar(45))
	begin
		select nome "Produto", quantidade "Qtd", concat("R$ ", round(valor, 2)) "Preço", categoria "Categoria",
			codigoBarra "Código de Barra"
			from estoque
				where categoria like cat;
    end //
delimiter ;

call produtoCat("Comb%");

delimiter //
create procedure mediaValorProd(out media decimal(7,2))
	begin
		select avg(valor) into media from estoque;
    end //
delimiter ;

call mediaValorProd(@med);

select @med;

select * from estoque
	where valor >= @med;
    
delimiter //
create procedure salvarProd(in n varchar(45), in c varchar(45), in cb varchar(80), in v decimal(7,2), in qtd decimal(7,2))
	begin
		declare codBarra varchar(80);
        select codigoBarra into codBarra from estoque where codigoBarra = cb;
        if(isnull(codBarra)) then
			insert into estoque (nome, quantidade, valor, codigoBarra, categoria)
				value (n, qtd, v, cb, c);
		else 
			update estoque set quantidade = quantidade + qtd, valor = v
				where codigoBarra = cb;
		end if;                
    end //
delimiter ;

select * from estoque;

call salvarProd("Coxinha Frango", "Alimento", "0010992845", 6.49, 5);

call salvarProd("Coxinha Charque c/ Catupiry", "Alimento", "0010991313", 6.99, 15);

/* Diego Araujo 08/11/22 */

drop trigger tgr_ItensVenda_Delete_Af;

delimiter //
create trigger tgr_ItensVenda_Insert_Af after insert
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);
		select valor into valorProd from estoque
			where idProduto = new.Estoque_idProduto;
		update estoque set quantidade = quantidade - new.qtdProduto
			where idProduto = new.Estoque_idProduto;
		update vendas set valorTotal = valorTotal + (valorProd * new.qtdProduto)
			where idVendas = new.Vendas_idVendas;
	end //
delimiter ;

delimiter //
create trigger tgr_ItensVenda_Delete_Af after delete
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);
        select valor into valorProd from estoque
			where idProduto = old.Estoque_idProduto;
		update estoque set quantidade = quantidade + old.qtdProduto
			where idProduto = old.Estoque_idProduto;
		update vendas set valorTotal = valorTotal - (valorProd * old.qtdProduto)
			where idVendas = old.Vendas_idVendas;
    end //
delimiter ;

-- ADS 2ª Noite PCRxPD Turma 1 (Terça) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e; 	

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf and
				e.nome like "Juliana%"; 

-- inner join (explicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf
			where e.nome like "Juliana%";
            
select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on f.empregado_cpf = e.cpf
			order by f.anoRef desc, f.dataIni;

select e.nome "Empregado", d.cpf 
	from empregado e
		inner join dependente d on d.empregado_cpf = e.cpf
			order by e.nome;

select e.nome "Empregado", d.cpf 
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			order by e.nome;

select e.nome "Empregado", count(e.nome) "Qtd Dependentes"
	from empregado e
		inner join dependente d on d.empregado_cpf = e.cpf
			group by e.nome	
				order by e.nome;

select e.nome "Empregado", count(d.cpf) "Qtd Dependentes"
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			group by e.nome	
				order by e.nome;

select e.nome "Empregado", count(d.cpf) "Qtd Dependentes"
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			group by e.nome
				order by count(d.cpf) desc;
		
select e.nome "Empregado", v.idvendas
	from empregado e
		left join vendas v on v.empregado_cpf = e.cpf;       
        
select e.nome "Empregado", count(v.idvendas) "Qtd Vendas"
	from empregado e
		inner join vendas v on v.empregado_cpf = e.cpf
			group by v.empregado_cpf
				order by count(v.idvendas) desc;

select e.nome "Empregado", count(v.idvendas) "Qtd Vendas"
	from empregado e
		left join vendas v on v.empregado_cpf = e.cpf
			group by e.nome
				order by count(v.idvendas) desc;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by e.nome;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by e.nome;

select round(avg(salario), 2)
	from empregado;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	 initcap(d.nome) "Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by e.nome;
                    
create view empregadoTrab as
	select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf;

select * from empregadotrab
	where salário <= (select avg(salario) from empregado);
    
select * from empregado;
select cpf, nome, year(now()) - substring(dataNasc, 1, 4) "idade", dataNasc, empregado_cpf
		from dependente;

create view depIdade as 
	select cpf, nome, year(now()) - substring(dataNasc, 1, 4) "idade", empregado_cpf
		from dependente;

select distinct e.cpf "CPF", upper(e.nome) "Nome", e.salario "Salário",
	case when e.statusEmp = 1 then 'Ativo'
		when e.statusEmp = 0 then 'Inativo' end "Status",
	case when  di.idade <= 3 then 'Sim'
		else 'Não' end "Auxílio Creche"
        from depIdade di
			inner join empregado e on di.Empregado_CPF = e.cpf
				where di.idade <= 3
					order by e.nome;
	    
select nome, strcmp(nome, 'Luiz André'), salario
	from empregado
		where salario = (select min(salario) from empregado);
    
select nome, replace(statusEmp, 1, 'Ativo'), salario
	from empregado
		where salario = (select max(salario) from empregado);

select e.cpf "CPF", upper(e.nome) "Nome", e.salario "Salário",
	case when e.statusEmp = 1 then 'Ativo'
		else'Inativo' end "Status",
		count(d.cpf) "Quantidade Dependente"
			from empregado e
				left join dependente d on d.empregado_cpf = e.cpf
					group by d.Empregado_CPF
						having count(d.cpf) >= 2
							order by e.nome;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	replace(d.nome, 'TI', 'Informática') "Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by d.nome;

select nome, cast(valor as real) 
	from estoque;

select nome, cast(valor as decimal(7,2)) 
	from estoque;
    
select date_format(dataVenda, '%w %m-%Y' ), valorTotal
	from vendas;

select date_format(dataVenda, '%W %M-%Y' ), valorTotal
	from vendas;

create procedure relVendas()
	select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
		concat('R$ ', round(est.valor, 2)) "Valor do Produto", concat('R$ ', v.valorTotal) "Valor Total", 
		e.nome "Empregado", d.nome "Departamento"
			from vendas v
				inner join empregado e on e.CPF = v.Empregado_CPF
				inner join trabalhar t on t.Empregado_CPF = e.CPF
				inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
				inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
				inner join estoque est on est.idProduto = iv.Estoque_idProduto
					where d.nome like "Conv%" or d.nome like "Frente%" 
						order by v.dataVenda;

call relVendas();

delimiter //
create procedure relVendasEmpregado(in nomeEmp varchar(60))
	begin
		select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
			concat('R$ ', round(est.valor, 2)) "Valor do Produto", concat('R$ ', v.valorTotal) "Valor Total", 
			e.nome "Empregado", d.nome "Departamento"
				from vendas v
					inner join empregado e on e.CPF = v.Empregado_CPF
					inner join trabalhar t on t.Empregado_CPF = e.CPF
					inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
					inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
					inner join estoque est on est.idProduto = iv.Estoque_idProduto
						where e.nome like nomeEmp and
								(d.nome like "Conv%" or 
								d.nome like "Frente%")
							order by v.dataVenda;
	end //
delimiter ;

call relVendasEmpregado("Thiago%");

delimiter //
create procedure reajusteSalarial(in taxa decimal(4,2))
	begin
		update empregado
			set salario = salario * taxa;
    end //
delimiter ;

select * from empregado;

call reajusteSalarial(1.1);

delimiter //
create procedure relVendasData(in dataIni date, in dataFim date)
	begin
		select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
			concat('R$ ', round(est.valor, 2)) "Valor do Produto", concat('R$ ', v.valorTotal) "Valor Total", 
			e.nome "Empregado", d.nome "Departamento"
				from vendas v
					inner join empregado e on e.CPF = v.Empregado_CPF
					inner join trabalhar t on t.Empregado_CPF = e.CPF
					inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
					inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
					inner join estoque est on est.idProduto = iv.Estoque_idProduto
						where v.dataVenda between dataIni and dataFim and
								(d.nome like "Conv%" or 
								d.nome like "Frente%")
							order by v.dataVenda;
    end //
delimiter ;

call relVendasData('2022-06-01', '2022-06-03');

delimiter //
create procedure mediaProduto(out mediaProd decimal(7,2))
	begin
		select avg(valor) into mediaProd from estoque;
    end //
delimiter ;

call mediaProduto(@med);

select * from estoque
	where valor >= @med;

select * from estoque
	where valor <= @med;

select @med;

select 4.8 into @med;

set @valorConstante = 3.0;

select * from estoque
	where valor <= @valorConstante;

select 4.8 into @valorConstante;

delimiter //
create procedure salvarProduto(in n varchar(45), in c varchar(45), in cb varchar(80), in v decimal(7,2), in q decimal(7,2))
	begin
		if exists(select codigoBarra from estoque where codigoBarra like cb) then
			update estoque set quantidade = quantidade + q, valor = v where codigoBarra like cb;
		else
			insert into estoque (nome, quantidade, valor, codigoBarra, categoria) value (n, q, v, cb, c);
		end if;
    end //
delimiter ;

call salvarProduto("Gasolina Aditivada", "Combustível", "0010991376", 4.99, 5000);

delimiter // 
create function idade(dataNasc date) returns int deterministic
	begin
		declare idade int;
        select timestampdiff(year, dataNasc, now()) into idade;
        return idade;
    end //
delimiter ;

select nome, idade(dataNasc), dataNasc from dependente;

select e.cpf "CPF", upper(e.nome) "Nome", e.salario "Salário",
	case when e.statusEmp = 1 then 'Ativo'
		when e.statusEmp = 0 then 'Inativo' end "Status",
	case when  idade(d.dataNasc) <= 3 then 'Sim'
		else 'Não' end "Auxílio Creche"
			from empregado e
				left join dependente d on d.Empregado_CPF = e.cpf
					order by e.nome;

delimiter //
create function calcTempoServ(c varchar(14)) returns int deterministic
	begin
		declare idade int;
        declare statusEmpregado tinyint;
        select statusEmp into statusEmpregado from empregado where cpf like c;
		if statusEmpregado = 0 then
			select timestampdiff(year, dataAdm, dataDem) into idade from empregado where cpf like c;
		else
			select timestampdiff(year, dataAdm, now()) into idade from empregado where cpf like c;
		end if;
        return idade;
    end //
delimiter ;

select nome, dataAdm, calcTempoServ(cpf) from empregado;

drop trigger tgr_ItensVenda_Delete_Af;

drop trigger tgr_ItensVenda_Insert_Af;

delimiter //
create trigger tgr_ItensVenda_Insert_Af after insert
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);
        select valor into valorProd from estoque
			where idProduto = new.Estoque_idProduto;
		update estoque set quantidade = quantidade - new.qtdProduto
			where idProduto = new.Estoque_idProduto;
		update vendas set valorTotal = valorTotal + (valorProd * new.qtdProduto)
			where idVendas = new.vendas_idVendas;
    end //	
delimiter ;

delimiter //
create trigger tgr_ItensVenda_Delete_Af after delete
on itensVenda
for each row
	begin
		declare valorProduto decimal(7,2);
        select valor into valorProduto from estoque
			where idProduto = old.Estoque_idProduto;
		update estoque set quantidade = quantidade + old.qtdProduto
			where idProduto = old.Estoque_idProduto;
		update vendas set valorTotal = valorTotal - (valorProduto * old.qtdProduto)
			where idVendas = old.Vendas_idVendas;
    end //
delimiter ;




-- ADS 2ª Manhã PCRxPD Turma 1 (Quarta) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;
    
-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf;
        
-- inner join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			order by f.anoref;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			order by f.anoref desc;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			where e.nome like "João%"
				order by f.anoref desc;

select f.anoRef "Ano Referência", f.dataIni "Data Início", f.dataFim "Data Fim", 
	f.qtdDias "Quantidade Dias", e.nome "Empregado"
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
        inner join trabalhar t on t.empregado_cpf = e.cpf
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			where d.nome like "Administra%"
				order by f.anoref desc;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by d.nome;
                
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by d.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
						order by d.nome;

create view empregadoTrab as
	select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf
					order by e.nome;


select * from empregadotrab;

select * from empregadotrab
	order by departamento;
    
select avg(salario) from empregado;

select * from empregadotrab
	where `Salário` <= (select avg(salario) from empregado)
		order by `Local Departamento`;

drop view empregadotrab;

select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone",e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            inner join telefone tel on tel.Empregado_CPF = e.CPF
				order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone",e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            left join telefone tel on tel.Empregado_CPF = e.CPF
				order by d.nome;
                
select * from telefone;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Telefone"
	from telefone tel
		inner join empregado e on e.cpf = tel.Empregado_CPF
        inner join departamento d on d.idDepartamento = tel.Departamento_idDepartamento
        inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Telefone"
	from telefone tel
		left join empregado e on e.cpf = tel.Empregado_CPF
        left join departamento d on d.idDepartamento = tel.Departamento_idDepartamento
        left join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`
        order by e.nome desc;

select e.nome "Empregado", tel.numero "Telefone"
	from empregado e
		left join telefone tel on tel.Empregado_CPF = e.CPF;
        
select e.nome "Nome", tel.numero "Telefone"
	from empregado e
		inner join telefone tel on tel.Empregado_CPF = e.CPF
			order by e.nome;

select d.nome "Nome", tel.numero "Telefone"
	from departamento d
		inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
			order by d.nome;
             
select f.nome "Nome", tel.numero "Telefone"
	from fornecedor f
		inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
			order by f.nome;

create view telefoneEmp as 
	select e.nome "Empregado", tel.numero "Telefone"
		from empregado e
			inner join telefone tel on tel.Empregado_CPF = e.CPF
				order by e.nome;
                
create view telefoneDep as
	select d.nome "Departamento", tel.numero "Telefone"
		from departamento d
			inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
				order by d.nome;
                
create view telefoneFor as
	select f.nome "Fornecedor", tel.numero "Telefone"
		from fornecedor f
			inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
				order by f.nome;
                
select * from telefoneemp
	union select * from telefonedep
		union select * from telefonefor;

select e.nome "Nome", tel.numero "Telefone"
	from empregado e
		inner join telefone tel on tel.Empregado_CPF = e.CPF
union
select d.nome "Nome", tel.numero "Telefone"
	from departamento d
		inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
union             
select f.nome "Nome", tel.numero "Telefone"
	from fornecedor f
		inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
			order by "Nome";
            
select v.dataVenda "Data Venda", est.nome "Produto", iv.qtdProduto "Quantidade", est.valor "Valor Produto",
	v.valorTotal "Total Venda", emp.nome "Empregado", d.nome "Departamento"
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
        inner join estoque est on est.idProduto = iv.Estoque_idProduto
        inner join empregado emp on emp.cpf = v.Empregado_CPF
        inner join trabalhar t on t.Empregado_CPF = emp.CPF
        inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento;

-- envolvendo view --
select v.dataVenda "Data Venda", est.nome "Produto", iv.qtdProduto "Quantidade", est.valor "Valor Produto",
	v.valorTotal "Total Venda", empT.`Empregado`, empT.`Departamento`
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
        inner join estoque est on est.idProduto = iv.Estoque_idProduto
        inner join empregadotrab empT on empT.`CPF Empregado` = v.Empregado_CPF;

select emp.cpf "CPF", emp.nome "Empregado", count(v.idVendas) "Qtd Vendas"
	from vendas v 
		inner join empregado emp on emp.cpf = v.Empregado_CPF
			group by v.Empregado_CPF;
            
-- Errado, devido ao relacionamento de empregado com trabalhar --
select empT.`CPF Empregado`, empT.`Empregado`, empT.`Departamento`, count(v.idVendas) "Qtd Vendas"
	from vendas v 
		inner join empregadotrab empT on empT.`CPF Empregado` = v.Empregado_CPF
			group by v.Empregado_CPF;
            
select emp.cpf "CPF", emp.nome "Empregado", count(v.idVendas) "Qtd Vendas", 
	sum(v.valorTotal) "Total Vendido"
		from vendas v 
			inner join empregado emp on emp.cpf = v.Empregado_CPF
				group by v.Empregado_CPF
					order by sum(v.valorTotal) desc;

select substring(v.dataVenda, 1, 10), count(v.idVendas), sum(v.valorTotal)
	from vendas v
		group by substring(v.dataVenda, 1, 10);
        
select nome "Nome", cpf "CPF", salario "Salário", ctps "CTPS", 
	case when statusEmp = 1 then 'Ativo'
		else "Inativo" end "Status"
		from empregado;

select e.nome "Nome", e.cpf "CPF", e.salario "Salário", e.ctps "CTPS", 
	case when count(d.cpf) > 0 then "Sim"
		else "Não" end "Dependente",
	case when e.statusEmp = 1 then "Ativo"
		when e.statusEmp = 2 then "Ferias"
			else "Inativo" end "Status"
		from empregado e
			left join dependente d on d.Empregado_CPF = e.cpf
				group by e.CPF
					order by e.nome;

select cpf, nome, parentesco, timestampdiff(year, dataNasc, now()) "idade", empregado_cpf
	from dependente
		where parentesco like "%ilh%";

select cpf, nome, parentesco, 
	case when timestampdiff(year, dataNasc, now()) > 0 then concat(timestampdiff(year, dataNasc, now()), ' anos')
		else concat(timestampdiff(month, dataNasc, now()), ' meses') end "idade", empregado_cpf
		from dependente;

create view filhoIdadeEmp as
	select cpf, nome, parentesco, timestampdiff(year, dataNasc, now()) "idade", empregado_cpf
		from dependente
			where parentesco like "%ilh%";


select e.nome "Nome", e.cpf "CPF", e.salario "Salário", e.ctps "CTPS", 
	case when e.statusEmp = 1 then "Ativo"
		when e.statusEmp = 2 then "Ferias"
			else "Inativo" end "Status",
	case when fi.idade <= 3 then "Sim"
		else "Não" end "Auxilio Creche"
		from empregado e
			left join filhoidadeemp fi on fi.Empregado_CPF = e.cpf
				group by e.CPF
					order by e.nome;

create procedure filhoIdade()
	select cpf, nome, parentesco, 
		case when timestampdiff(year, dataNasc, now()) > 0 then concat(timestampdiff(year, dataNasc, now()), ' anos')
			else concat(timestampdiff(month, dataNasc, now()), ' meses') end "idade", empregado_cpf
				from dependente;

call filhoIdade();

select cpf, nome, parentesco, 
			case when timestampdiff(year, dataNasc, now()) > 0 then concat(timestampdiff(year, dataNasc, now()), ' anos')
				else concat(timestampdiff(month, dataNasc, now()), ' meses') end "idade", empregado_cpf
					from dependente
						where empregado_cpf = (select cpf from empregado where nome like "Danilo%");

delimiter //
	create procedure filhoIdadeEmp(in empregado varchar(60))
		begin 
			select cpf, nome, parentesco, 
				case when timestampdiff(year, dataNasc, now()) > 0 then concat(timestampdiff(year, dataNasc, now()), ' anos')
					else concat(timestampdiff(month, dataNasc, now()), ' meses') end "idade", empregado_cpf
						from dependente
							where empregado_cpf = (select cpf from empregado where nome like empregado);
		end //
delimiter ;

call filhoIdadeEmp("Thiago%");

delimiter //
	create procedure vendasDep(in nomeDep varchar(45))
		begin 
			select e.nome "Empregado", e.cpf "CPF", 
				count(v.idvendas) "Quantidade Vendas", sum(v.valorTotal) "Total Vendido"
					from vendas v
						inner join empregado e on e.cpf = v.Empregado_CPF
						inner join trabalhar t on t.Empregado_CPF = e.CPF
						inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
							where d.nome like nomeDep
								group by (v.Empregado_CPF)
									order by sum(v.valorTotal) desc;
		end //
delimiter ;

call vendasDep("Fren%");

delimiter //
create procedure medSalario(out media decimal(7,2))
	begin
		select avg(salario) into media from empregado;
    end //
delimiter ;

call medSalario(@med);

select @med;

select * from empregado 
	where salario >= @med;

delimiter //
create procedure reajusteSal(in taxa decimal(4,2))
	begin
		update empregado set salario = salario * taxa;
    end //
delimiter ;

call reajusteSal(1.08);

select * from empregado;

delimiter //
create procedure medProdutoCat(in cat varchar(20), out med decimal(6,2))
	begin
		select avg(valor) into med from estoque
			where categoria like cat;
    end //
delimiter  ;

call medProdutoCat("Alim%", @mediaProd);

select @mediaProd;

delimiter //
create procedure relatorioVendasT(in dataIni date, in  dataFim date)
	begin
		select emp.cpf "CPF", emp.nome "Empregado", count(v.idVendas) "Qtd Vendas", 
			sum(v.valorTotal) "Total Vendido"
			from vendas v 
				inner join empregado emp on emp.cpf = v.Empregado_CPF
					where v.dataVenda >= dataIni and
						v.dataVenda <= dataFim
						group by v.Empregado_CPF
							order by sum(v.valorTotal) desc;
    end //
delimiter ;

call relatorioVendasT('2022-11-01', '2022-11-16');

select * from vendas;

delimiter //
create procedure atualizarEstoque(in n varchar(45), in c varchar(45), in cb varchar(80), in v decimal(7,2), in q decimal(7,2))
	begin
		declare nomeProd varchar(45);
        select nome into nomeProd from estoque
			where codigoBarra like cb;
		if(isnull(nomeProd)) then
			insert into estoque (nome, quantidade, valor, codigoBarra, categoria)
				value (n, q, v, cb, c);
		else 
			update estoque set quantidade = quantidade + q, valor = v
				where codigoBarra like cb;
		end if;
    end //
delimiter ;

select * from estoque;

call atualizarEstoque("Gasolina", "Combustível", "0010992874", 4.99, 1500);

call atualizarEstoque("Cigarro Derby Azul", "Drogas", "0010992345", 7.99, 20);

delimiter //
create function idadePirraia(dn date)
returns int 
DETERMINISTIC
	begin 
		declare idade int;
		select timestampdiff(year, dn, now()) into idade;        
        return(idade);
    end //
delimiter ;

select nome, idadePirraia(dataNasc) "idade" from dependente;

select avg(idadePirraia(dataNasc)) "Meida Idade" from dependente;

delimiter //
create function calcTempoServico(c varchar(14))
returns int
deterministic
	begin
		declare tempoServ int;
		if(select statusEmp from empregado where cpf like c) then
			select timestampdiff(year, dataAdm, now()) into tempoServ from empregado
				where cpf like c;
		else
			select timestampdiff(year, dataAdm, dataDem) into tempoServ from empregado
				where cpf like c;
		end if;
        return(tempoServ);
    end //
delimiter ;

select nome, dataAdm, calcTempoServico(cpf) from empregado;

drop trigger tgr_ItensVenda_Delete_Af;

delimiter //
create trigger tgr_ItensVenda_Insert_Af after insert
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);        
        select valor into valorProd from estoque
			where idProduto = new.Estoque_idProduto;        
		update estoque set quantidade = quantidade - new.qtdProduto
			where idProduto = new.Estoque_idProduto;
		update vendas set valorTotal = valorTotal + new.qtdProduto * valorProd
			where idVendas = new.Vendas_idVendas;
    end //
delimiter ;

delimiter //
create trigger tgr_ItensVenda_Delete_Af after delete
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);        
        select valor into valorProd from estoque
			where idProduto = old.Estoque_idProduto;        
		update estoque set quantidade = quantidade + old.qtdProduto
			where idProduto = old.Estoque_idProduto;
		update vendas set valorTotal = valorTotal - old.qtdProduto * valorProd
			where idVendas = old.Vendas_idVendas;
    end //
delimiter ;






-- ADS 2ª Noite Turma 2 (Quinta s2) --
select * from dependente;
-- cross join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;

-- cross join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		cross join empregado e;

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where e.cpf = d.empregado_cpf
			order by d.nome;

-- inner join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on e.cpf = d.empregado_cpf
			order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by d.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				where e.nome like "João%"
					order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
			inner join endereco ed on ed.empregado_cpf = e.cpf
				where ed.cidade like "%ecife"
					order by d.nome;
		
create view empregadoTrab as
	select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
		d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf
					order by d.nome;

select * from empregadotrab;

select * from empregadotrab 
	where `Salário` >= (select avg(salario) from empregado);

select * 
	from empregadotrab et
		inner join endereco ed on ed.empregado_cpf = et.`CPF Empregado`
			where ed.cidade like "Recife";
    
select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone", 
	e.salario "Salário",  o.nome "Ocupação", d.nome "Departamento", 
    d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            left join telefone tel on tel.empregado_cpf = e.cpf
				order by d.nome; 
                
select * from telefone;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Número"
	from telefone tel
		left join departamento d on d.iddepartamento = tel.departamento_iddepartamento
        left join empregado e on e.CPF = tel.Empregado_CPF
        left join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select e.nome "Empregado", tel.numero "Número"
	from telefone tel
        left join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Empregado", tel.numero "Número"
	from telefone tel
        inner join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Empregado", coalesce(tel.numero, null, 'Sem número') "Número"
	from telefone tel
        right join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Nome",  
	case when tel.Empregado_CPF  is not null then 'Empregado'
		end "Tipo",		   
	tel.numero "Número"
		from telefone tel
			inner join empregado e on e.CPF = tel.Empregado_CPF
union
select d.nome "Nome", 
	case when tel.Departamento_idDepartamento  is not null then 'Departamento'
		end "Tipo",
	tel.numero "Número"
		from telefone tel
			inner join departamento d on d.iddepartamento = tel.departamento_iddepartamento
union
select f.nome "Nome",
	case when tel.`Fornecedor_cnpj/cpf`  is not null then 'Fornecedor'
		end "Tipo",
	tel.numero "Número"
	from telefone tel
        inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

create view agenda as
	select e.nome "Nome",  
		case when tel.Empregado_CPF  is not null then 'Empregado'
			end "Tipo",		   
		tel.numero "Número"
			from telefone tel
				inner join empregado e on e.CPF = tel.Empregado_CPF
	union
	select d.nome "Nome", 
		case when tel.Departamento_idDepartamento  is not null then 'Departamento'
			end "Tipo",
		tel.numero "Número"
			from telefone tel
				inner join departamento d on d.iddepartamento = tel.departamento_iddepartamento
	union
	select f.nome "Nome",
		case when tel.`Fornecedor_cnpj/cpf`  is not null then 'Fornecedor'
			end "Tipo",
		tel.numero "Número"
		from telefone tel
			inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select * from agenda;

select v.dataVenda "Data", est.nome "Produto", iv.qtdproduto "Quantidade", 
	v.valorTotal "Total", emp.nome "Empregado", d.nome "Departamento"
		from vendas v
			inner join empregado emp on emp.cpf = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = emp.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
            inner join estoque est on est.idProduto = iv.Estoque_idProduto;

select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas"
	from vendas v
		inner join empregado e on e.CPF = v.Empregado_CPF
			group by v.empregado_cpf
				order by count(v.empregado_cpf) desc;
            
select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
				group by v.empregado_cpf
					order by sum(v.valorTotal) desc;

select d.nome "Departamento", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.cpf = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = e.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
				group by v.empregado_cpf
					order by sum(v.valorTotal) desc;

select e.cpf
	from trabalhar t
		inner join empregado e on e.CPF = t.Empregado_CPF
        inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
			where d.nome like "Frente%";

select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
				where e.CPF in (select e.cpf from trabalhar t
									inner join empregado e on e.CPF = t.Empregado_CPF
									inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
										where d.nome like "Conv%")
					group by v.empregado_cpf
						order by sum(v.valorTotal) desc;

select substring(v.dataVenda, 1, 10) "Data", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade Vendas", sum(v.valorTotal) "Total"
		from vendas v
			group by substring(v.dataVenda, 1, 10);

select cpf, nome, truncate(salario, 1), 
	case when statusEmp = 1 then 'Ativo'
		when statusEmp = 2 then 'Férias'
        when statusEmp = 3 then 'Licença'
		else 'Inativo' end "status"
		from empregado;

select cpf, nome, year(now()) - substring(dataNasc, 1, 4) "idade", dataNasc, empregado_cpf
		from dependente;

create view depIdade as 
	select cpf, nome, year(now()) - substring(dataNasc, 1, 4) "idade", empregado_cpf
		from dependente;

select distinct e.cpf "CPF", upper(e.nome) "Nome", e.salario "Salário",
	case when e.statusEmp = 1 then 'Ativo'
		when e.statusEmp = 0 then 'Inativo' end "Status",
        case when  di.idade <= 3 then 'Sim'
			else 'Não' end "Auxílio Creche"
        from depIdade di
			inner join empregado e on di.Empregado_CPF = e.cpf
				where di.idade <= 3
					order by e.nome;

create procedure dependentesIdade()
	select cpf, nome, year(now()) - substring(dataNasc, 1, 4) "idade", empregado_cpf
		from dependente;
        
call dependentesIdade();

select * from depidade;

drop procedure empregadoCidade;

delimiter $$
	create procedure empregadoCidade(in cid varchar(45))
		begin
			select e.nome "Empregado", e.CPF "CPF", e.dataAdm "Data Admissão", e.salario "Salário", 
				en.cidade "Cidade", count(d.Empregado_CPF) "Quantidade Dependente"
				from empregado e
					inner join endereco en on en.Empregado_CPF = e.cpf
					left join dependente d on d.Empregado_CPF = e.CPF
						where en.cidade like cid
							group by (e.CPF)
								order by e.nome;
        end $$
delimiter ;

call empregadoCidade('Olinda');

delimiter //
	create procedure reajusteSalarial(in taxa float)
		begin
			update empregado set salario = salario * taxa;
        end //
delimiter ;

select * from empregado;

call reajusteSalarial(0.7);

drop procedure mediaSalarial;

delimiter //
	create procedure mediaSalarial(out media decimal(7,2))
		begin
			select round(avg(salario), 2) into media from empregado;
        end //
delimiter ;

call mediaSalarial(@media);

select @media;

select * from dependenteidade;

delimiter //
delimiter //
create procedure pagaAuxCreche(in empregado varchar(60))
	begin
		select e.cpf "CPF", upper(e.nome) "Nome", e.salario "Salário",
			case when e.statusEmp = 1 then 'Ativo'
				when e.statusEmp = 0 then 'Inativo' end "Status",
			case when  di.idade <= 3 then 'Sim'
				else 'Não' end "Auxílio Creche"
			from empregado e
				left join depIdade di  on di.Empregado_CPF = e.cpf
					where e.nome like empregado
						order by e.nome;
    end //
delimiter ;

call pagaAuxCreche("Danilo Farias%");

drop procedure salvarDep;

delimiter //
create procedure salvarDep(in c varchar(14), in n varchar(45), in dn date, in p varchar(15), in ecpf varchar(14))
	begin
		declare _cpfDep varchar(14);
		select cpf into _cpfDep from dependente where cpf like c;
		if isnull(_cpfDep) then
			insert into dependente value (c, n, dn, p, ecpf);
		else 
			update dependente set nome = n, dataNasc = dn, parentesco = p, empregado_cpf = ecpf
				where cpf = c;
        end if;            
	end //
delimiter ;

call salvarDep("122.789.765-90", "Vinicius Raoni", '2021-11-15', "Filho", "098.765.432-11");

call salvarDep('123.456.789-40', 'Diego Raoni', '2021-10-27', 'Filho', '098.765.432-11');

delimiter //
create function tempoServico(dataIni datetime, cpfEmp varchar(14)) 
	returns int 
		DETERMINISTIC
			begin
				declare _stEmp int;
                declare _dd datetime;
                select statusEmp into _stEmp from empregado where cpf = cpfEmp; 
				if _stEmp = 1 then
					return year(now()) - year(dataIni); 
				else 
					select dataDem into _dd from empregado where cpf = cpfEmp;
                    return year(_dd) - year(dataIni);
				end if;
			end //
delimiter ;

select nome, tempoServico(dataAdm, cpf), dataAdm from empregado;

delimiter //
create trigger tgr_ItensVenda_Insert_Af after insert 
	on itensVenda
		for each row
		begin
			declare valorProd decimal(7,2);
			update estoque set quantidade = round(quantidade - new.qtdProduto, 2)
				where idProduto = new.Estoque_idProduto;
			select valor into valorProd from estoque 
				where idProduto = new.Estoque_idProduto;  
			update vendas set valorTotal = valorTotal + new.qtdProduto * valorProd
				where idVendas = new.Vendas_idVendas;
		end //
delimiter ;

drop trigger tgr_ItensVenda_Insert_Af;

select * from vendas;
select * from estoque;

insert into itensvenda 
	values (5, 15, 3);
    
insert into itensvenda 
	values (2, 1, 15.5);
    
delimiter //
create trigger tgr_ItensVenda_Delete_Af after delete 
	on itensVenda
		for each row
		begin
			declare valorProd decimal(7,2);
			update estoque set quantidade = quantidade + old.qtdProduto
				where idProduto = old.Estoque_idProduto;
			select valor into valorProd from estoque 
				where idProduto = old.Estoque_idProduto;  
			update vendas set valorTotal = valorTotal - old.qtdProduto * valorProd
				where idVendas = old.Vendas_idVendas;
		end //
delimiter ;

drop trigger tgr_ItensVenda_Delete_Af;

delete from itensvenda 
	where Vendas_idVendas = 15 and Estoque_idProduto = 8;

delete from itensvenda;

    
-- ADS 3ª Noite PCRxPD (UNIT) (Sexta) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf;

-- inner join (explicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
        inner join endereco en on en.empregado_cpf = e.cpf
			where en.cidade like "%ecife";

select avg(salario) from empregado;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
			where e.salario <= (select avg(salario) from empregado);
            
create view empregadoTrab as
	select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
			inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
			inner join empregado eg on eg.cpf = g.empregado_cpf;

select * from empregadotrab;

select * from empregadotrab
	where `Salário` >= (select avg(salario) from empregado);

select e.cpf "CPF", e.nome "Empregado", tel.numero "Telefone", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
        left join telefone tel on tel.empregado_cpf = e.cpf;

select cpf, nome, parentesco, year(now()) - year(dataNasc) "idade", empregado_CPF 
	from dependente
		where parentesco like "%ilh%";

create view dependenteIdade as
	select cpf, nome, parentesco, timestampdiff(year, dataNasc, now()) "idade", empregado_CPF 
		from dependente
			where parentesco like "%ilh%";

drop view dependenteidade;

select di.nome, di.idade, e.nome
	from dependenteidade di
		inner join empregado e on e.CPF = di.empregado_cpf;

select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", 
	case when di.idade between 1 and 3 then "Sim"
		else "Não" end "Auxílio Creche"
	from empregado e
		left join dependenteidade di on di.Empregado_CPF = e.CPF
			order by e.nome;

select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", 
	case when di.idade <= 3 then "Sim"
		else "Não" end "Auxílio Creche"
	from empregado e
		left join dependenteidade di on di.Empregado_CPF = e.CPF
			where di.empregado_cpf is null
				order by e.nome;

select cast("86/10/22" as date) ;

create procedure depIdade()
	select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", 
		case when di.idade between 1 and 3 then "Sim"
			else "Não" end "Auxílio Creche"
		from empregado e
			left join dependenteidade di on di.Empregado_CPF = e.CPF
				order by e.nome;

call depIdade();

delimiter //
create procedure empregadoCid(in cidade varchar(45))
	begin
		select e.CPF "CPF", e.nome "Empregado", e.salario "Salário", 
			e.dataAdm "Data Admissão", ed.cidade "Cidade"
			from empregado e
				inner join endereco ed on ed.Empregado_CPF = e.CPF
					where ed.cidade like cidade;
	end //
delimiter ;

drop procedure empregadoCid;

call empregadoCid("Jabo%");

delimiter //
create procedure relatorioVendas(in inicio date, in fim date)
	begin
		select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
			concat('R$ ', round(est.valor, 2)) "Valor do Produto", 
            concat('R$ ', v.valorTotal) "Valor Total", 
			e.nome "Empregado", d.nome "Departamento"
				from vendas v
					inner join empregado e on e.CPF = v.Empregado_CPF
					inner join trabalhar t on t.Empregado_CPF = e.CPF
					inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
					inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
					inner join estoque est on est.idProduto = iv.Estoque_idProduto
						where date_format(v.dataVenda, '%Y-%m-%d') between inicio  and fim
							order by v.dataVenda;
    end //
delimiter ;

call relatorioVendas('2022-06-02', '2022-06-15');

delimiter //
create procedure pgAuxCreche(in nomeEmp varchar(60))
	begin
		select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", 
			case when di.idade between 1 and 3 then "Sim"
				else "Não" end "Auxílio Creche"
			from empregado e
				left join dependenteidade di on di.Empregado_CPF = e.CPF
					where e.nome like nomeEmp
						order by e.nome;
    end //
delimiter ;

call pgAuxCreche("Godo%");

delimiter //
create procedure reajusteSal(in taxa decimal(5,2))
	begin
		update empregado set salario = salario * taxa;
    end //
delimiter ;

select nome, salario from empregado;

call reajusteSal(0.85);

call reajusteSal(1.25);

delimiter //
create procedure mediaProd(out media decimal(5,2))
	begin
		select avg(valor) into media from estoque;
    end //
delimiter ;

call mediaProd(@med);

select @med;

select * from estoque
	where valor >= @med;

delimiter //
create procedure salvarForn(in cnpj varchar(18), in n varchar(45), in e varchar(45), in sf tinyint)
	begin
		declare _cnpjj varchar(18);
        select `cnpj/cpf` into _cnpjj from fornecedor where `cnpj/cpf` like cnpj;
        if (isnull(_cnpjj)) then
			insert into fornecedor value (cnpj, n,  0, e, sf);
		else
			update fornecedor set nome = n , email = e, statusFron = sf where `cnpj/cpf` like cnpj;
		end if;
    end //
delimiter ;

select * from fornecedor;

call salvarForn("77.777.353/0007", "Iury da Coxinha", "comercial@iurycoxinha", 1);

drop function calcIdade; 

delimiter //
create function calcIdade(dn date)
	returns int
    DETERMINISTIC
    begin
		declare idade int;
        select timestampdiff(year, dn, now()) into idade;
        return idade;
    end //
delimiter ;

select nome, cpf, calcIdade(dataNasc) "idade" from dependente;

select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", 
	case when calcIdade(d.dataNasc) between 1 and 3 then "Sim"
		else "Não" end "Auxílio Creche"
			from empregado e
				left join dependente d on d.Empregado_CPF = e.CPF
					order by e.nome;

delimiter //
create function tempoServ(c varchar(14), dataIni datetime)
	returns int
    DETERMINISTIC
    begin
		declare se tinyint;
        declare tempo int;
        select statusEmp into se from empregado where cpf like c;
        if (se = 1) then
			select timestampdiff(year, dataAdm, now()) into tempo from empregado where cpf like c;
			return tempo;
		else 
			select timestampdiff(year, dataAdm, dataDem) into tempo from empregado where cpf like c;
			return tempo;
		end if;
    end //
delimiter ;

select nome, dataAdm, tempoServ(cpf, dataAdm) "tempo", statusEmp from empregado;

drop trigger tgr_ItensVenda_Insert_Af;

delimiter //
create trigger tgr_ItensVenda_Insert_Af after insert
on itensVenda
for each row
	begin 
		declare valorProd decimal(7,2);
		update estoque set quantidade = quantidade - new.qtdProduto
			where idProduto = new.Estoque_idProduto;            
		select valor into valorProd from estoque
			where idProduto = new.Estoque_idProduto;        
		update vendas set valorTotal = valorTotal + (new.qtdProduto * valorProd)
			where idVendas = new.Vendas_idVendas;
    end //
delimiter ;

delimiter //
create trigger tgr_ItensVenda_Delete_Af after delete
on itensVenda
for each row
	begin
		declare valorProd decimal(7,2);
        update estoque set quantidade = quantidade + old.qtdProduto
			where idProduto = old.Estoque_idProduto;
		select valor into valorProd from estoque
			where idProduto = old.Estoque_idProduto;
		update vendas set valorTotal = valorTotal - (old.qtdProduto * valorProd)
			where idVendas = old.Vendas_idVendas;
    end //
delimiter ;

-- BDII - 2ª Exercício de BDII - DQL (Join) --
-- Reletorio 1 --
select e.nome "Empregado", e.CPF "CPF", e.dataAdm "Data Admissão", e.salario "Salário", 
	en.cidade "Cidade", tel.numero "Número de Telefone"
    from empregado e
		inner join endereco en on en.Empregado_CPF = e.cpf
        left join telefone tel on tel.Empregado_CPF = e.cpf
			where e.dataAdm between '2019-01-01' and '2022-04-01'
				order by e.dataAdm desc;
-- Reletorio 2 --
select e.nome "Empregado", e.CPF "CPF", e.dataAdm "Data Admissão", e.salario "Salário", 
	en.cidade "Cidade"
    from empregado e
		inner join endereco en on en.Empregado_CPF = e.cpf
			where e.salario <= (select avg(salario) from empregado)
				order by e.nome;
-- Adeno... --
select e.nome "Empregado", e.CPF "CPF", e.dataAdm "Data Admissão", e.salario "Salário", 
	en.cidade "Cidade"
    from empregado e
		inner join endereco en on en.Empregado_CPF = e.cpf
			where e.CPF in (select Empregado_CPF from dependente)
				order by e.nome;

-- Reletorio 3 --
select e.nome "Empregado", e.CPF "CPF", e.dataAdm "Data Admissão", e.salario "Salário", 
	en.cidade "Cidade", count(d.Empregado_CPF) "Quantidade Dependente"
    from empregado e
		inner join endereco en on en.Empregado_CPF = e.cpf
        left join dependente d on d.Empregado_CPF = e.CPF
			where en.cidade like "Recife"
				group by (e.CPF)
					order by e.nome;

-- Reletorio 4 --
select e.nome "Empregado", e.cpf "CPF", e.sexo "Sexo", e.salario "Salário", 
	count(v.idvendas) "Quantidade Vendas", sum(v.valorTotal) "Total Vendido"
		from vendas v
			inner join empregado e on e.cpf = v.Empregado_CPF
				group by (v.Empregado_CPF)
					order by sum(v.valorTotal) desc;

-- Relatório 5 --
select e.nome "Empregado", e.cpf "CPF", e.salario "Salário", o.nome "Ocupação", 
	telEmp.numero "Telefone do Empregado", d.nome "Departamento", 
    d.localDep"Local do Departamento", telDep.numero "Telefone do Departamento", 
    eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.CPF = t.Empregado_CPF
            inner join ocupacao o on o.cbo = t.Ocupacao_cbo
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join gerente g on g.Empregado_CPF = d.Gerente_Empregado_CPF
            inner join empregado eg on eg.CPF = g.Empregado_CPF
            left join telefone telEmp on telEmp.Empregado_CPF = e.CPF
            left join telefone telDep on telDep.Departamento_idDepartamento = d.idDepartamento
				order by d.nome, e.nome;

-- Relatório 6 --
select d.nome "Departamento", d.localDep "Local Departamento", count(e.cpf) "Total de Empregados",
	eg.nome "Nome do Gerente", telDep.numero "Número do Telefone"
		from trabalhar t 
			inner join empregado e on e.CPF = t.Empregado_CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join gerente g on g.Empregado_CPF = d.Gerente_Empregado_CPF
            inner join empregado eg on eg.CPF = g.Empregado_CPF
            left join telefone telDep on telDep.Departamento_idDepartamento = d.idDepartamento
				group by d.idDepartamento
					order by d.nome;
-- Relatório 7 --
select fp.tipoPag "Tipo Forma Pagamento", count(v.idVendas) "Quantidade Vendas", 
	concat('R$ ', sum(v.valorTotal)) "Total Vendido"
		from vendas v
			inner join formapag fp on fp.Vendas_idVendas = v.idVendas
				group by fp.tipoPag
					order by count(v.idVendas) desc;

-- Relatório 8 --
select v.dataVenda "Data", est.nome "Produto", iv.qtdProduto "Quantidade", 
	concat('R$ ', round(est.valor, 2)) "Valor do Produto", concat('R$ ', v.valorTotal) "Valor Total", 
    e.nome "Empregado", d.nome "Departamento"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = e.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
            inner join estoque est on est.idProduto = iv.Estoque_idProduto
				where d.nome like "Conv%" or d.nome like "Frente%" 
					order by v.dataVenda;
-- Relatório 9 --
/*create view totalVendasData as select count(v.idVendas) "total" from vendas v group by substring(v.dataVenda, 1, 10);
drop view totalVendasData;
select max(total) from totalVendasData;*/

select substring(v.dataVenda, 1, 10) "Data", count(v.idVendas) "Quantidade Vendas", 
	concat('R$ ', sum(v.valorTotal)) "Total Vendido"
	from vendas v
		group by substring(v.dataVenda, 1, 10);
			-- having count(v.idVendas) = (select max(total) from totalVendasData) --;

-- Relatório 10 --
select est.nome "Produto", concat('R$ ', round(est.valor, 2)) "Valor Produto", 
	est.categoria "Categoria do Produto", f.nome "Nome Fornecedor", f.email "Email Fornecedor",
    tel.numero "Telefone Fornecedor"
    from compras c
		inner join estoque est on est.idProduto = c.Estoque_idProduto
        inner join fornecedor f on f.`cnpj/cpf` = c.`Fornecedor_cnpj/cpf`
        left join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
			order by est.nome;

-- Relatório 11 --
select est.nome "Nome Produto", count(iv.Estoque_idProduto) "Quantidade (Total) Vendas"
	from itensvenda iv
		inner join estoque est on iv.Estoque_idProduto = est.idProduto
			group by est.idProduto
				order by count(iv.Estoque_idProduto) desc;

-- Relatório 12 --
select d.nome "Departamento", 
	d.localDep "Local Departamento", 
	eg.nome "Gerente",  
	count(v.idVendas) "Total de Vendas", 
    sum(v.valorTotal) "Valor Total"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = e.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join gerente g on g.Empregado_CPF = d.Gerente_Empregado_CPF
            inner join empregado eg on eg.CPF = g.Empregado_CPF
				where d.nome like "Frente%" or d.nome like "Conv%"
					group by d.nome
						order by d.nome;

