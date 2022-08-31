create database TECeats;

use TECeats;

create table TProducto(
	id int primary key auto_increment not null,
    nombre varchar(32) not null
);

create table Producto(
	id int primary key auto_increment not null,
    nombre varchar(32) not null,
    idTProducto int not null,
    precio int not null,
    descripcion varchar(128) not null,
    activo bool default(true) not null
);
  
create table TCliente(
	id int primary key auto_increment not null,
    nombre varchar(32) not null,
    descuento bool not null
);

create table Cliente(
	id int primary key auto_increment not null,
    nombre varchar(32) not null,
    identificacion varchar(16) not null,
    idTCliente int not null,
    correo varchar(32) not null,
    telefono varchar(16) not null,
    carne varchar(32) not null,
    edad int not null,
    fechaNacimiento date not null,
    activo bool default(true) not null
);

create table Usuario(
	id int primary key auto_increment not null,
    username varchar(32) not null,
    passw varchar(32) not null,
    idCliente int not null,
    administrador bool not null,
    activo bool default(true) not null
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
    idTPago int not null,
    activo bool default(true) not null
);

create table PedidoXProducto(
	id int primary key auto_increment not null,
    idPedido int not null,
    idProducto int not null,
    cantidad int not null,
    activo bool default(true) not null
);

create table TMenu(
	id int primary key auto_increment not null,
    nombre varchar(16) not null,
    horaInicio time not null,
    horaFin time not null
);

create table Menu(
	id int primary key auto_increment not null,
    fecha date not null,
    idTMenu int not null,
    activo bool default(true) not null
);

create table MenuXProducto(
	id int primary key auto_increment not null,
    idMenu int not null,
    idProducto int not null
);



alter table Producto
add constraint fkProducto_TProducto
foreign key (idTProducto)
references TProducto(id);

alter table Cliente
add constraint fkCliente_TCliente
foreign key (idTCliente)
references TCliente(id);

alter table Usuario
add constraint fkUsuario_Cliente
foreign key (idCliente)
references Cliente(id);

alter table Pedido
add constraint fkPedido_Cliente
foreign key (idCliente)
references Cliente(id);

alter table Pedido
add constraint fkPedido_EstadoPedido
foreign key (idEstadoPedido)
references EstadoPedido(id);

alter table Pedido
add constraint fkPedido_TPago
foreign key (idTPago)
references TPago(id);

alter table PedidoXProducto
add constraint fkPedidoXProducto_Pedido
foreign key (idPedido)
references Pedido(id);

alter table PedidoXProducto
add constraint fkPedidoXProducto_Producto
foreign key (idProducto)
references Producto(id);

alter table Menu
add constraint fkMenu_TMenu
foreign key (idTMenu)
references TMenu(id);

alter table MenuXProducto
add constraint fkMenuXProducto_Menu
foreign key (idMenu)
references Menu(id);

alter table MenuXProducto
add constraint fkMenuXProducto_Producto
foreign key (idProducto)
references Producto(id);