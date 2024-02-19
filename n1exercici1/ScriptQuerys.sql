Use optica;
#Llista el total de factures d'un client/a en un període determinat.

#PRIMERA MANERA DE HACERLO
/*select idCliente, nombre, count(*) from cliente
inner join venta on cliente.idCliente = venta.fk1_idCliente
where fecha between "2024/01/1" and "2024/01/31"
group by cliente.idCliente, cliente.nombre;*/
/*
Busca idCliente y nombre de la tabla cliente
y relacionala con loa tabla venta mediante cliente.idCliente que está vinculada a venta.fk1_idCliente
para ver en la tabla venta cuantas ha hecho cada cliente. Aparecerán una fila por venta e indicará qué cliente la ha hecho.
Luego cuenta las ventas que se han hecho entre tal y tal fecha y agrúpalas por idCliente.
El count se ejecuta antes que el group by. El count cuenta las ventas que tiene cada cliente y el group by las agrupa según
el idCliente y convierte una fila por usuario. (Si antes Juana tenía dos filas, ahora tiene 1).
*/

#SEGUNDA MANERA DE HACERLO
select fk1_idCliente, cliente.nombre, count(*) from venta
inner join cliente on venta.fk1_idCliente = cliente.idCliente
where fecha between "2024/01/01" and "2024/01/31"
group by venta.fk1_idCliente, cliente.nombre;

#Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
Select venta.Empleado, gafas.marca from venta
inner join gafas on venta.idGafas = gafas.idGafas
where venta.Fecha between "2023/02/01" and "2024/02/01"
group by venta.empleado, gafas.marca;

#Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
Select proveedor.NOMBRE from proveedor
inner join gafas on proveedor.idProveedor = gafas.idPROVEEDOR
inner join venta on gafas.idGafas = venta.idGafas
group by proveedor.NOMBRE;

