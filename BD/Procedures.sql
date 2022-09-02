use TECeats;


-- PRODUCTO EN MENU

DELIMITER $$
create procedure insertarProductoEnMenu(in idMenu_ int, in idProdcto_ int)
begin
	insert into MenuXProducto (idMenu, idProducto) values(idMenu_, idProducto_);
end; $$


DELIMITER $$
create procedure eliminarProductoEnMenu(in idMenu_ int, in idProdcto_ int)
begin
	update MenuXProducto
    set activo=false
    where idMenu=idMenu_
    and idProducto=idProducto_;
end; $$



-- PRODUCTO EN PEDIDO

DELIMITER $$
create procedure insertarProductoEnPedido(
	in idPedido_ int, 
	in idProdcto_ int, 
    in cantidad_ int)
begin
	insert into PedidoXProducto (idMenu, idProducto, cantidad) 
    values(idMenu_, idProducto_, cantidad_);
end; $$


DELIMITER $$
create procedure actualizarProductoEnPedido(
	in idPedido_ int, 
    in idProdcto_ int, 
    in cantidad_ int)
begin
	update PedidoXProducto
    set cantidad=cantidad_
    where idMenu=idMenu_
    and idProducto=idProducto_;
end; $$


DELIMITER $$
create procedure eliminarProductoEnPedido(in idPedido_ int, in idProdcto_ int)
begin
	update PedidoXProducto
    set activo=false
    where idMenu=idMenu_
    and idProducto=idProducto_;
end; $$





DELIMITER $$
create procedure consultarCarrito(in idPedido_ int)
begin
	select 
		x.id, p.id, p.fecha, p.x.cantidad 
    from PedidoXProucto x
    inner join Pedido p on p.id=x.idPedido
    inner join Producto r on r.id=x.idProducto
    where x.activo=true
    and x.idPedido=idPedido_;
end; $$