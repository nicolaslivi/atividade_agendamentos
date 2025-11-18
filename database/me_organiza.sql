create database if not exists me_organiza;

use me_organiza;

create table if not exists clientes (
	idClientes int primary key not null auto_increment,
    nomeClientes varchar(500) not null,
    emailClientes varchar(255) not null,
    telefoneClientes varchar(14) not null,
    cpfClientes char(11) not null unique
);

insert into clientes (nomeClientes, emailClientes, telefoneClientes, cpfClientes) values
	("Nicolas Rodolfo Liviera", "nicolasrlivi@gmail.com", "47 997028117", "12715117973"),
	("Julia Filipp", "julia@gmail.com", "47 912345678", "12345678900"),
	("José Santos", "santosjose@gmail.com", "47 987654321", "00123456789");
    
create table if not exists profissionais (
	idProfissionais int primary key not null auto_increment,
    nomeProfissionais varchar(500) not null,
    emailProfissionais varchar(255) not null,
    telefoneProfissionais varchar(14) not null,
    cpfProfissionais char(11) not null unique
);

insert into profissionais (nomeProfissionais, emailProfissionais, telefoneProfissionais, cpfProfissionais) values
	("Jose Bezerra", "bjose@gmail.com", "47 945781236", "48642673199"),
	("Flavio Antunes", "flavioantu@gmail.com", "47 914785296", "36914785202"),
	("Maria Santos", "mariasantos@gmail.com", "47 995175346", "10212398756");

create table if not exists servicos (
	idServicos int primary key not null auto_increment,
    nomeServicos varchar(500) not null,
    profissionais_id int not null,
    foreign key (profissionais_id) references profissionais(idProfissionais)
);

insert into servicos (nomeServicos, profissionais_id) values
	("Pintura", 1),
	("Marcenaria", 2),
	("Agenciamento de marketing", 3);

create table if not exists agendamentos (
	idAgendamento int primary key not null auto_increment,
    titulo varchar(255) not null,
    descricao text not null,
    dataAgendamento date not null,
    hora time not null,
    clientes_id int not null,
    foreign key (clientes_id) references clientes(idClientes),
	profissionais_id int not null,
    foreign key (profissionais_id) references profissionais(idProfissionais),
    servicos_id int not null,
    foreign key (servicos_id) references servicos(idServicos)
);

insert into agendamentos (titulo, descricao, dataAgendamento, hora, clientes_id, profissionais_id, servicos_id) values
	("Organizar Instagram do Nicolas", "Revisar todo o feed e destaques", "2025-11-17", "15:30:00", 1, 3, 3),
    ("Móveis da sala do José", "Montar os móveis na cozinha do José", "2025-11-24", "08:00:00", 3, 2, 2),
    ("Pintura na casa da Julia", "Pintar toda a área externa da casa da Julia", "2025-11-18", "07:30:00", 2, 1, 1);
	