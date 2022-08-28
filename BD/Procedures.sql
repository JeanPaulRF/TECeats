use TECeats;

-- CRUD PRODUCTO
DELIMITER $$
create procedure createProducto(
	in nombre_ varchar(32),
    in idTProducto_ int,
    in precio_ int,
    in descripcion_ varchar(128))
begin
	insert into Producto(nombnre, idTProducto, precio, descripcion)
    values (nombnre_, idTProducto_, precio_, descripcion_);
end; $$


DELIMITER $$
create procedure readProducto(in nombre_ varchar(32))
begin
	select p.nombre, p.idTProducto, p.precio, p.descripcion
    from Producto p
    where p.nombre = nombre_;
end; $$


DELIMITER $$
create procedure updateProducto(
	in nombreOld varchar(32),
	in nombre_ varchar(32),
    in idTProducto_ int,
    in precio_ int,
    in descripcion_ varchar(128))
begin
	update Producto
    set nombre=nombre_,
		idTProducto=idTProducto_,
        precio=precio_,
        descripcion=descripcion_;
end; $$


DELIMITER $$
create procedure deleteProducto(in nombre_ varchar(32))
begin
	update Producto
    set activo=false
    where nombre=nombre;
end; $$



-- CRUD CLIENTE

DELIMITER $$
create procedure createCliente(
	in nombre_ varchar(32),
    in identificacion_ varchar(32),
    in idTCliente_ int,
    in correo_ varchar(32),
    in telefono_ varchar(16),
    in carne_ varchar(32),
    in edad_ int,
    in fechaNacimiento_ date)
begin
	insert into Cliente(nombre, identificacion, idTCliente, correo, telefono, carne, edad, fechaNacimiento) 
    values(nombre_, identificacion_, idTCliente_, correo_, telefono_, carne_, edad_, fechaNaciemiento_);
end; $$


DELIMITER $$
create procedure readCliente(in identificacion_ varchar(32))
begin
	select c.id, c.nombre, c.identificacion, c.idTCliente, c.correo, c.telefono, c.carne, c.edad, c.fechaNacimiento
    from Cliente c
    inner join TCliente t on c.idTCliente = t.id
    where c.identificacion = identificacion_
    AND c.activo = true;
end; $$


DELIMITER $$
create procedure updateCliente(
	in identificacionOld varchar(32),
	in nombre_ varchar(32),
    in identificacion_ varchar(32),
    in idTCliente_ int,
    in correo_ varchar(32),
    in telefono_ varchar(16),
    in carne_ varchar(32),
    in edad_ int,
    in fechaNacimiento_ date,
    in activo_ bool)
begin
	update Cliente
    set nombre=nombre_,
		identificacion=identificacion_,
        idTCliente=idTCliente_,
        correo=correo_,
        telefono=telefono_,
        carne=carne_,
        edad=edad_,
        fechaNacimiento=fechaNacimiento_,
        activo=activo_
	where identificacion=identificacionOld;
end; $$


DELIMITER $$
create procedure deleteCliente(in identificacion_ varchar(32))
begin
	update Cliente
    set activo=false
	where identificacion=identificacion_;
end; $$



-- CRUD USUARIO

DELIMITER $$
create procedure createUsuario(
	in username_ varchar(32),
    in passw_ varchar(32),
    in identificacion_ int,
    in administrador_ boolean)
begin
	insert into Usuario(username, passw, idCliente, administrador)
    select username_, passw_, identificacion_, administrador_
    from Cliente c
    where c.identificacion=identificacion_;
end; $$


DELIMITER $$
create procedure readUsuario(in username_ varchar(32))
begin
	select u.id, u.username, u.passw, c.id, u.administrador
    from Usuario u, Cliente c
    where u.identificacion=c.identificacion
    and u.activo = true;
end; $$


DELIMITER $$
create procedure updateUsuario(
	in usernameOld varchar(32),
	in username_ varchar(32),
    in identificacion_ varchar(32),
    in administrador_ bool,
    in activo_ bool)
begin
	update Usuario
    set username = username_,
		idCliente = (select id from Cliente where identificacion=identificacion_),
		administrador = administrador_,
		activo = activo_
	where username=usernameOld;
end; $$


DELIMITER $$
create procedure deleteUsuario(in username_ varchar(32))
begin
	update Usuario
    set activo=false
    where username=username_;
end; $$



-- CRUD PEDIDO

DELIMITER $$
create procedure createPedido(
	in idCliente_ int,
    in ubicacion_ varchar(128),
    in fecha_ date,
    in idEstadoPedido_ int,
    in idTPago_ int)
begin
	insert into Pedido (idCliente, ubicacion, fecha, idEstadoPedido, idTPago)
    values (idCliente_, ubicacion_, fecha_, idEstadoPedido_, idTPago_);
end; $$


DELIMITER $$
create procedure readPedido(in id_ int)
begin
	select id, idCliente, ubicacion, fecha, idEstadoPedido, idTPago
    from Pedido
    where id=id_
    and activo=true;
end; $$


DELIMITER $$
create procedure updatePedido(
	in id_ int,
    in idCliente_ int,
    in ubicacion_ varchar(128),
    in fecha_ date,
    in idEstadoPedido_ int,
    in idTPago_ int)
begin
	update Pedido
    set idCliente = idCliente_, 
		ubicacion = ubicacion_, 
        fecha = fecha_, 
        idEstadoPedido = idEstadoPedido_, 
        idTPago = idTPago_
	where id = id_;
end; $$


DELIMITER $$
create procedure deletePedido(in id_ int)
begin
	update Pedido
    set activo=false
    where id=id_;
end; $$



-- CRUD MENU

DELIMITER $$
create procedure createMenu(in fecha_ date, in idTMenu_ int)
begin
	insert into Menu(fecha, idTMenu) values (fecha_, idTMenu_);
end; $$


DELIMITER $$
create procedure readMenu(in id_ int)
begin
	select m.id, m.fecha, m.idTMenu, p.nombre, p.idTProducto, p.precio, p.descripcion
    from Menu m 
    inner join MenuXProducto x on m.id=x.idMenu
    inner join Producto p on p.id=x.idProducto
    where m.id=id_
    and m.activo=true;
end; $$


DELIMITER $$
create procedure updateMenu(
	in id_ int,
    in fecha_ date, 
    in idTMenu_ int)
begin
	update Menu
    set fecha=fecha_,
		idTMenu=idTMenu_
	where id=id_;
end; $$