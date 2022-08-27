use TECeats;

DELIMITER $$
create procedure createCliente(
	in nombre_ varchar(32),
    in identificacion_ varchar(32),
    in idTCliente_ int,
    in correo_ varchar(32),
    in telefono_ varchar(16))
begin
	insert into Cliente(nombre, identificacion, idTCliente, correo, telefono) 
    values(nombre_, identificacion_, idTCliente_, correo_, telefono_);
end; $$


DELIMITER $$
create procedure readCliente(in identificacion_ varchar(32))
begin
	select c.id, c.nombre, c.identificacion, c.idTCliente, c.correo, c.telefono 
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
    in activo_ bool)
begin
	update Cliente
    set nombre=nombre_,
		identificacion=identificacion_,
        idTCliente=idTCliente_,
        correo=correo_,
        telefono=telefono_,
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