insert into empregado (cpf, nome, salario, sexo, statusEmp, email, ctps, dataNasc, dataAdm)
	value ("025.111.258-97", "Danilo Farias", 1852.56, 'M', 1, "dansoaresfarias@gmail.com", "986532741", '1986-09-07', '2018-05-03 13:30:00');

insert into empregado (cpf, nome, salario, sexo, statusEmp, email, ctps, dataNasc, dataAdm)
	values ("070.154.874-57", "Hugo Diniz", 1800.00, 'M', 1, "hugo@senac.com.br", "0987654321", '1993-01-08', '2019-06-04 13:30:00'),
		("112.345.678-90", "Juliana Ramalho", 2654.84, 'F', 1, "juramalho@gmail.com", "895623", '1993-12-20', '2015-05-18 08:15:00'),
		("777.888.999-34", "Diego Coutinho", 2345.67, 'M', 1, "diegocoutinho@fac.pe.senac.br", "93763828377", '1985-11-22', '2019-07-14 12:41:21'),
		("014.128.358-00", "Ben Hur Queiroz", 1311.56, 'M', 1, "benhur@gmail.com", "111533341", '1976-01-07', '2012-03-03 15:30:00'),
        ("055.432.798-57", "Fellipe Diniz", 1489.56, 'M', 1, "fellipediniz@gmail.com", "326498741", '1989-06-08', '2020-02-09 13:30:00'),
        ("077.188.387-02", "Godofredo Souza", 1701.56, 'M', 1, "godo@gmail.com", "188775341", '1980-08-01', '2019-11-03 09:30:00'),
        ("098.765.432-11", "César Pinho", 2450.00, 'M', 1, "pinhocesar@senac.com.br", "2233456789", '1992-06-18', '2022-07-05 15:00:00'),
		("102.406.954-01", "Mácio Júnior", 1800.00, 'M', 1, "macio@senac.com.br", "1020304050", '1993-11-11', '2020-07-10 12:00:02'),
        ("120.380.134-18", "Joao Victor", 3500.00, 'M', 1, "joaobarreto@email.com", "123456789", '1999-02-15', '2022-06-03 12:20:00'),
        ("120.749.910-88", "Luiz Andre", 1222.00, 'M',   1, "luizalcorreia@fac.pe.senac.br", "828929818",'2002-06-28','2021-07-11 12:08:00'),
		("100.300.650-76", "Thiago Rodrigues", 1680.00, 'M', 1, "thiago@gmail.com", "147859670", '1996-03-04', '2022-06-01 08:15:00'),
		("112.088.387-02", "Godolores Castro", 2052.56, 'F', 1, "godolores@gmail.com", "499725381", '1979-03-18', '2011-06-03 10:05:00');

insert into endereco (uf, cidade, bairro, rua, numero, comp, cep, Empregado_CPF)
	value ("PE", "Recife", "Boa Vista", "Rua Dom Bosco", 1542, "Ap 1502", "50050-070", "025.111.258-97");
    
insert into endereco (uf, cidade, bairro, rua, numero, comp, cep, Empregado_CPF)
	values ("PE", "Recife", "Boa Viagem", "Rua Segredo", 51, "Ap 1803", "51020-170", "070.154.874-57"),
		("PE", "Recife", "Boa Viagem", "Rua Passarinho", 1345, "Ap 357", "51111-000", "112.345.678-90"),
		("PE", "Recife", "Prado", "Rua Capitão Zuera", 453, "Ap 56", "38888-058", "777.888.999-34"),
		("PE", "Recife", "Madalena", "Rua Ricardo Salazar", 45, "Ap 501-A", "50720-123", "014.128.358-00"),
        ("PE", "Recife", "Campo Grande", "Rua Faz Chover", 1000, "Casa 02", "50887-170", "055.432.798-57"),
		("PE", "Jaboatao", "Cha Grande", "Rua Desce e Sobe", 1, "Primeiro Andar", "51227-170", "077.188.387-02"),
		("PE", "Olinda", "Bairro Novo", "Rua Faz Chover", 40, "Apto 15", "50087-170", "098.765.432-11"),
		("PE", "Recife", "Hipódromo", 'Rua Fulano de Tal', 100, "casa", "51041-500", "102.406.954-01"),
		("PE", "São Lourenço da mata", "Centro", "Rua Holanda", 08, "Quadra E", "54735-110", "120.380.134-18"),
        ("PE", "Olinda", "Jardim Atlantico", "Rua Rutilo", 8, " ", "53060-360", "120.749.910-88"),
        ("PE", "Recife", "Campo Grande", "Rua N S da Glória", 164, "casa", "52031-050", "100.300.650-76"),
        ("PE", "Recife", "iputinga", "Rua João do caminhão", 102, "Ap 200", "55309-083", "112.088.387-02");

insert into gerente (empregado_cpf, funcaoGrat)
	values ("070.154.874-57", 1500),
		("098.765.432-11", 1500),
        ("112.345.678-90", 1500),
        ("120.749.910-88", 1500),
        ("100.300.650-76", 1500),
        ("014.128.358-00", 1500);

insert into departamento (nome, email, descricao, localDep, horario) 
	values ("Administrativo", "adm@postoInflamavel.com", "Departamento Administrativo", "Sala - 1", "08h às 17h"),
		("Financeiro", "financeiro@postoInflamavel.com", "Departamento Financeiro", "Sala - 2", "08h às 17h"),
        ("RH", "rh@postoInflamavel.com", "Departamento Recursos Humano", "Sala - 3", "08h às 17h"),
        ("Conviniência", "loja@postoInflamavel.com", "Loja de Conviniência", "Loja", "07h às 23h"),
        ("Frente Loja", "frentistas@postoInflamavel.com", "Departamento Frente Loja", "Pátio", "07h às 23h"),
        ("TI", "ti@postoInflamavel.com", "Departamento de Tecnologia da Informação", "Sala - 4", "08h às 17h");
        
update departamento set gerente_empregado_cpf = "070.154.874-57"
	where iddepartamento = 1;
    
update departamento set gerente_empregado_cpf = "098.765.432-11"
	where iddepartamento = 2;
    
update departamento set gerente_empregado_cpf = "112.345.678-90"
	where iddepartamento = 3;
    
update departamento set gerente_empregado_cpf = "120.749.910-88"
	where iddepartamento = 4;
    
update departamento set gerente_empregado_cpf = "100.300.650-76"
	where iddepartamento = 5;

update departamento set gerente_empregado_cpf = "014.128.358-00"
	where iddepartamento = 6;
     
insert into dependente 
	values ("123.456.789-98", "Daniel Farias", '2021-10-25', "Filho","025.111.258-97"),
		("123.456.789-34", "Maria José", '2015-02-25', "Filha","112.345.678-90"),
        ("123.456.789-45", "Igor José", '2000-11-24', "Filho","112.345.678-90"),
        ("123.456.789-56", "Aline Lima", '2001-02-25', "Filha","112.088.387-02"),
        ("123.456.789-67", "Pedro Costa", '2020-03-02', "Filho","112.088.387-02"),
        ("123.456.789-78", "José Farias", '2020-11-12', "Filho","102.406.954-01"),
        ("123.456.789-89", "Bento Soares", '2022-05-15', "Filho","077.188.387-02"),
        ("123.456.789-10", "Elisa Farias", '2020-12-25', "Filha","100.300.650-76"),
        ("123.456.789-20", "Diogo Silva", '2010-11-28', "Filho","120.749.910-88"),
        ("123.456.789-30", "Dayane Silva", '2020-02-02', "Filha","014.128.358-00"),
        ("123.456.789-40", "Diego Costa", '2021-06-03', "Filho","098.765.432-11");
        
insert into ocupacao (cbo, nome)
	values ("212405" , "Analista de desenvolvimento de sistemas"),
    ("317110" , "Desenvolvedor de sistemas"),
    ("521140" , "Atendente balconista"),
    ("521135" , "Frentista"),
    ("252105" , "Administrador"),
    ("411010" , "Assistente administrativo"),
    ("252210" , "Assistente de contadoria fiscal"),
    ("252405" , "Analista de recursos humanos");

insert into trabalhar 
	values ("070.154.874-57", 1, "252105"),
		("112.345.678-90", 3, "252405"),
		("777.888.999-34", 6, "317110"),
		("014.128.358-00", 6, "212405"),
		("055.432.798-57", 2, "252210"),
		("077.188.387-02", 5, "521135"),
		("098.765.432-11", 2, "252210"),
		("102.406.954-01", 1, "411010"),
		("120.380.134-18", 1, "411010"),
		("120.749.910-88", 5, "521135"),
		("100.300.650-76", 4, "521140"),
		("112.088.387-02", 4, "521140"),
		("025.111.258-97", 5, "521135"),
		("120.380.134-18", 5, "411010"),
		("102.406.954-01", 4, "411010");

insert into ferias (Empregado_CPF, anoRef, dataIni, dataFim, qtdDias)
	values ("070.154.874-57", 2021, '2022-01-10', '2022-01-19', 20),
		("112.345.678-90", 2020, '2021-02-10', '2021-03-09', 30),
		("777.888.999-34", 2021, '2022-06-01', '2022-06-14', 15),
		("014.128.358-00", 2020, '2021-07-02', '2021-07-16', 15),
		("055.432.798-57", 2020, '2021-01-10', '2021-01-19', 20),
		("014.128.358-00", 2021, '2022-02-10', '2022-02-19', 20),
		("098.765.432-11", 2021, '2022-03-10', '2022-03-19', 20),
		("098.765.432-11", 2020, '2021-05-10', '2021-05-09', 30),
		("120.380.134-18", 2020, '2021-10-05', '2021-11-04', 30),
		("120.749.910-88", 2020, '2021-02-18', '2021-03-19', 30),
		("100.300.650-76", 2021, '2022-08-10', '2022-09-09', 30),
		("112.088.387-02", 2020, '2021-01-02', '2021-02-01', 30),
		("112.088.387-02", 2021, '2022-06-15', '2022-06-30', 15),
		("120.380.134-18", 2021, '2022-07-10', '2022-07-19', 20),
		("102.406.954-01", 2020, '2021-09-08', '2021-10-07', 30),
		("102.406.954-01", 2021, '2022-09-08', '2022-10-07', 30);

insert into estoque (nome, quantidade, valor, codigoBarra, categoria)
	values ("Gasolina", 6579.8, 6.99, "0010992874", "Combustível"),
			("Álcool", 4579.8, 5.99, "0010992875", "Combustível"),
            ("Diesel", 7679.8, 6.49, "0010992876", "Combustível"),
            ("Água Minalba 500ml", 53, 2, "0010992877", "Bebida"),
            ("Água Minalba 1500ml", 28, 5, "0010992864", "Bebida"),
            ("Coca Cola Lata 350ml", 55, 3.5, "0010992844", "Bebida"),
            ("Fanta Lata 350ml", 15, 3.49, "0010992873", "Bebida"),
            ("Sprite Lata 350ml", 20, 3.5, "0010992872", "Bebida"),
            ("Pipoca Gravatá Salgada", 59, 2, "0010992871", "Alimento"),
            ("Pipoca Gravatá Doce", 34, 2, "0010992869", "Alimento"),
            ("Coxinha Frango", 25, 6.99, "0010992845", "Alimento"),
            ("Enroladinho", 3, 6.99, "0010992846", "Alimento"),
            ("Coxinha Fango c/Catupiry", 24, 6.99, "0010992847", "Alimento"),
            ("Risole", 30, 6.99, "0010992848", "Alimento");
            
insert into fornecedor 
	values ("97.776.353/0001", "Ipiranga Distribuidora",  0, "ipidisp@ipiranga.br", 1),
			("97.776.354/0001", "CocaCola Distribuidora", 0, "disp@coca.br", 1),
            ("97.776.355/0001", "Pipocas Gravatá Distribuidora", 200.0, "disp@pipocasgta.br", 1),
            ("97.776.356/0001", "Minalba Distribuidora", 200.0, "disp@minalba.br", 1),
            ("97.776.357/0001", "Maria do Salgado", 30.0, "mariasal@gmail.com", 1),
            ("97.776.358/0001", "Dona Glória do Salgado", 25.0, "glorinha@gmail.com", 1),
            ("97.776.359/0001", "Iaia Águas Dist", 0, "iaiadisp@iaia.br", 0);
            
insert into compras (`Fornecedor_CNPJ/CPF`, Estoque_idProduto, dataComp, qtdComp, valorComp)
		values ("97.776.353/0001", 1, '2016-04-12 11:25:00', 5000, 4),
				("97.776.353/0001", 2, '2022-04-12 11:25:00', 3000, 3),
                ("97.776.353/0001", 3, '2022-05-12 11:25:00', 4000, 5),
                ("97.776.356/0001", 4, '2022-05-12 11:25:00', 30, 1),
                ("97.776.356/0001", 5, '2022-06-12 11:25:00', 50, 2),    
                ("97.776.354/0001", 6, '2022-05-12 11:25:00', 20, 3),
                ("97.776.354/0001", 7, '2022-04-12 11:25:00', 45, 3),
                ("97.776.354/0001", 8, '2022-04-12 11:25:00', 40, 3),
                ("97.776.354/0001", 9, '2022-06-12 11:25:00', 10, 1),
                ("97.776.354/0001", 10, '2022-06-12 11:25:00', 60, 1),
                ("97.776.358/0001", 11, '2022-06-08 11:25:00', 20, 4),
                ("97.776.358/0001", 12, '2022-06-08 11:25:00', 20, 4),
                ("97.776.358/0001", 13, '2022-06-08 11:25:00', 30, 4),
                ("97.776.358/0001", 14, '2022-06-08 11:25:00', 30, 4);
    
insert into vendas (dataVenda, desconto, valorTotal, Empregado_CPF) 
	values ('2022-06-01 10:30:00', 0.0, 70.0, "077.188.387-02"),
			('2022-06-01 11:30:00', 0.0, 150.0, "100.300.650-76"),
            ('2022-06-01 11:35:00', 0.0, 100.0, "100.300.650-76"),
            ('2022-06-01 12:05:00', 0.0, 180.0, "100.300.650-76"),
            ('2022-06-01 12:15:00', 0.0, 100.0, "077.188.387-02"),
            ('2022-06-01 13:35:00', 0.0, 200.0, "100.300.650-76"),            
            ('2022-06-02 13:35:00', 0.0, 230.0, "077.188.387-02"),
            ('2022-06-01 10:35:00', 0.0, 10.0, "025.111.258-97"),
            ('2022-06-01 11:30:00', 0.0, 12.0, "025.111.258-97"),
            ('2022-06-01 12:08:00', 0.0, 23.0, "025.111.258-97"),
            ('2022-06-01 12:36:00', 0.0, 44.0, "120.380.134-18"),
			('2022-06-02 10:35:00', 0.0, 15.0, "120.380.134-18"),
            ('2022-06-02 11:30:00', 0.0, 18.0, "120.380.134-18"),
            ('2022-06-02 12:08:00', 0.0, 29.0, "120.380.134-18"),
            ('2022-06-02 12:36:00', 0.0, 13.0, "120.380.134-18");
       
insert into itensvenda (Vendas_idVendas, Estoque_idProduto, qtdProduto)
	values (1, 1, 30.0),
			(2, 1, 12.0),
            (3, 2, 18.7),
            (4, 3, 14.6),
            (5, 3, 3.0),
            (6, 2, 10.8),
            (6, 1, 3.0),
            (7, 1, 10.0),
            (8, 4, 5.0),
            (9, 5, 2.0),
            (10, 6, 3.0),
            (11, 7, 2.0),
            (11, 13, 2.0),
            (12, 14, 3.0),
            (13, 8, 1.0),
            (13, 12, 2.0),
            (14, 9, 6.0),
            (15, 9, 6.0);

insert into formapag (tipoPag, qtdParcelas, valorPag, Vendas_idVendas)
	values ("Débito", 0, 70.0 ,1),
			("Débito", 0, 150.0 ,2),
            ("Crédito", 0, 100.0 ,3),
            ("Débito", 0, 180.0 ,4),
            ("Pix", 0, 100.0 ,5),
            ("Débito", 0, 200.0 ,6),
            ("Crédito", 0, 230.0 ,7),
            ("Dinheiro", 0, 10.0 ,8),
            ("Pix", 0, 12.0 ,9),
            ("Dinheiro", 0, 23.0 ,10),
            ("Débito", 0, 44.0 ,11),
            ("Dinheiro", 0, 15.0 ,12),
            ("Crédito", 0, 18.0 ,13),
            ("Dinheiro", 0, 29.0 ,14),
            ("Pix", 0, 13.0 ,15);

 insert into telefone (numero, empregado_cpf, departamento_iddepartamento, `fornecedor_cnpj/cpf`)
	values ("81981905671", "070.154.874-57", null, null),
		("8121263306", null, 1, null),
        ("81212633602", null, 2, null),
        ("81212633562", null, 3, null),
        ("81212633432", null, 4, null),
        ("8132445678", null, null, "97.776.353/0001"),
        ("8135331817", null, null, "97.776.355/0001"),
        ("8135331237", null, null, "97.776.354/0001"),
        ("81999334455", "098.765.432-11", null, null),
        ("81999887766", "098.765.432-11", null, null),
        ("81999889900", "070.154.874-57", null, null),
        ("81999889911", "112.345.678-90", null, null),
        ("81999889922", "120.380.134-18", null, null),
        ("81999889933", "025.111.258-97", null, null),
        ("81999889944", "100.300.650-76", null, null);
        
/* Diego Araujo 08/11/22 */

insert into vendas (dataVenda, desconto, valorTotal, Empregado_CPF) 
	value ('2022-11-08 10:42:00', 0.0, 0.0, "077.188.387-02");
    
insert into vendas (dataVenda, desconto, valorTotal, Empregado_CPF) 
	value ('2022-11-08 10:48:00', 0.0, 0.0, "077.188.387-02");
    
insert into itensvenda (Vendas_idVendas, Estoque_idProduto, qtdProduto)
	value (16, 16, 50.0);

insert into itensvenda (Vendas_idVendas, Estoque_idProduto, qtdProduto)
	value (16, 4, 2.0);
    
insert into itensvenda (Vendas_idVendas, Estoque_idProduto, qtdProduto)
	values (17, 16, 30.0),
			(17, 4, 2.0),
			(17, 11, 2.0),
			(17, 8, 1.0);

delete from itensvenda
	where Vendas_idVendas = 17 and Estoque_idProduto = 8;