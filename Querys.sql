/* Query para criar a tabela produtos */
CREATE TABLE produtos
(
	Pid serial not null,
    nome varchar(255) not null,
    categoria varchar(255) not null,
    Qt int not null,
    valorUnit int not null,
    primary key (Pid)
)


/* Query para criar a tabela vendas */
CREATE TABLE vendas
(
	Vid serial not null,
    	nome varchar(255) not null,
    	Qt int not null,
   	valorTotal int not null,
	primary key (Vid),  
	PId integer REFERENCES produtos(Pid) 
)

/*Insrir registos*/
INSERT INTO produtos (nome, categoria, qt, valorunit) VALUES 
('milho', 'enlatados', 30, 1.00),
('ervilha', 'enlatados', 20, 1.50),
('cogumelo', 'enlatados', 10, 2.03),
('lombo de porco', 'talho', 50, 7.00),
('Peito de frango', 'talho', 100, 5.00),
('dourada', 'peixaria', 20, 10.00),
('queijo', 'charcutaria', 15, 8.00),
('fiambre', 'charcutaria', 10, 5.00),
('choriço', 'charcutaria', 5, 4.00);

/* Registo de venda e Atualização de stock*/
INSERT INTO vendas (nome, qt, valortotal, pid) 
VALUES ('milho', 5, 5.00, 2);

UPDATE produtos 
SET qt = qt - (SELECT qt FROM vendas 
			   WHERE Vid = LASTVAL());
