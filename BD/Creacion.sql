create database TECeats;

create table TProducto(
	id int primary key not null,
    nombre varchar(32) not null
);

create table Producto(
	id int primary key auto_increment not null,
    nombre varchar(32) not null,
    idTProducto int not null,
    precio int not null,
    descripcion varchar(128) not null,
    activo bool default(1) not null
);

create table TCliente(
	id int primary key not null,
    nombre varchar(32) not null,
    descuento bool not null
);

create table Cliente(
	id int primary key auto_increment not null,
    nombre varchar(32) not null,
    idTCliente int not null,
    correo varchar(32) not null,
    telefono varchar(16) not null,
    activo bool default(1) not null
);

create table Usuario(
	id int primary key auto_increment not null,
    username varchar(32) not null,
    passw varchar(32) not null,
    idCliente int not null,
    administrador bool not null
);

create table EstadoPedido(
	id int primary key auto_increment not null,
    nombre varchar(16) not null
);

create table TPago(
	id int primary key auto_increment not null,
    nombre varchar(16) not null
);

create table Pedido(
	id int primary key auto_increment not null,
    idCliente int not null,
    ubicacion varchar(128) not null,
    fecha date not null,
    idEstadoPedido int not null,
    idTPago int not null
);

create table PedidoXProducto(
	id int primary key auto_increment not null,
    idPedido int not null,
    idProducto int not null
);

