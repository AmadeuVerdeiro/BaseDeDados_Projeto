SELECT BaseDeDados_Projeto CREATE TABLE produtos;
(
	Pid int not null auto_increment,
    nome varchar(255) not null,
    categioria varchar(255) not null,
    Qt int not null,
    valorUnit int not null,
    primary key (Pid),
);
