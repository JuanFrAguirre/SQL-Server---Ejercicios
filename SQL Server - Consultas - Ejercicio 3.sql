-----------------------------------------------
--------------------------------ejercicio 1.1
-----------------------------1.1.1

use LIBRERIA_prueba

insert into articulos (
descripcion, pre_unitario
)
values
(
'Lapices Color largos * 12 u. Bic',
101.5
)

insert into articulos
(
descripcion, pre_unitario, observaciones
)
values
(
'Conjunto Geometrico Maped',
20.5,
'Regla, escuadra y transportador'
)

insert into articulos
(
descripcion,stock_minimo,pre_unitario,observaciones
)
values
(
'Repuesto Gloria Rayado',
120,
326.3,
'200 hojas'
)

insert into articulos
(
descripcion, pre_unitario, observaciones
)
values
(
'Repuesto Rivadavia',
465.9,
'260 hojas, margen reforzado'
)

-----------------------------------------------
-------------------------1.1.2
insert into vendedores
values
(
'Juan',
'Monti',
'Altoaguirre',
1245,
5,
4522122,
null,
null
)

insert into vendedores
values
(
'Rosa',
'Sena',
'Av. Velez Sarsfield',
25,
1,
null,
'rsena@hotmail.com',
'5/15/1968'
)

-----------------------------------------------
-----------------------1.1.3

insert into clientes
values
(
'Juan',
'Aguirre',
'9 de julio',
832,
1,
351351351,
'juan@aguirre.com'
)

insert into clientes
values
(
'Leon',
'Boller',
'25 de mayo',
238,
2,
351231231,
'leon@boller.com'
)

insert into clientes
values
(
'Keiri',
'Uiliams',
'24 de septiembre',
382,
5,
351321321,
'keiri@uiliams.com'
)

-----------------------------------------------
-----------------------------------------------
----------------------------------1.2

----------------------1.2.1
update 
articulos
set 
stock_minimo = 100
where 
cod_articulo = 28

----------------------1.2.2
update 
articulos
set 
descripcion = 'Repuesto Rivadavia cuadriculado',
observaciones = '48 hojas'
where cod_articulo= 31

----------------------1.2.3
update 
vendedores
set 
fec_nac = '10/10/1970',
[e-mail] = 'juan@monti.com'
where
cod_vendedor = 12

----------------------1.2.4
update
vendedores
set
nro_tel = 4522221,
calle = 'Av. Velez Sarsfield',
altura = 125,
cod_barrio = 1
where
cod_vendedor= 13

----------------------1.2.5
update
articulos
set 
pre_unitario = pre_unitario * 1.15
where 
pre_unitario < 20

----------------------1.2.6
update
articulos 
set 
pre_unitario = pre_unitario * 1.1
where
pre_unitario between 20 and 30

-----------------------------------------------
-----------------------------------------------
----------------------------------1.3

----------------------1.3.1
delete
vendedores
where 
ape_vendedor = 'Sena' and
nom_vendedor = 'Rosa'

----------------------1.3.2
delete
articulos
where 
descripcion = 'Repuesto Gloria Rayado'

----------------------1.3.3
delete
clientes
where
[e-mail] = 'leon@boller.com' or
[e-mail] = 'keiri@uiliams.com'

----------------------2.1
select
nom_cliente + ' ' + ape_cliente 'Nombre Completo',
calle,
altura,
cod_barrio,
nro_tel,
[e-mail]
from
clientes
where
nro_tel is not null
order by [Nombre Completo]

----------------------2.2
select
distinct
cod_articulo,
cantidad * pre_unitario 'Subtotal'
from
detalle_facturas
order by cod_articulo asc, Subtotal desc

select
*
from
detalle_facturas

----------------------2.3
select
cod_cliente 'CODIGO DE CLIENTE',
nom_cliente + ' ' + upper(ape_cliente) 'NOMBRE',
calle + ' ' + cast(altura as varchar) 'DIRECCION'
from
clientes
where
nom_cliente like 'c%'
and
ape_cliente like '%z'

----------------------2.4
select
cod_cliente 'CODIGO DE CLIENTE',
nom_cliente + ' ' + upper(ape_cliente) 'NOMBRE',
calle + ' ' + cast(altura as varchar) 'DIRECCION'
from
clientes
where
nom_cliente not like '[a-g]%'
and
ape_cliente like '[d-l]%'

----------------------2.5
select
*
from
articulos
where
pre_unitario < 40
and
observaciones is null
order by
descripcion desc,
pre_unitario desc

----------------------2.6
select
*
from
vendedores
where
nom_vendedor not like '%z%'
and
fec_nac > '1-1-1970'

----------------------2.7
select
*
from
facturas
where
fecha between '1-1-2007' and '1-5-2009'
and
cod_vendedor in (1,3,4)
or
fecha between '1-1-2010' and '1-5-2011'
and
cod_vendedor in (2,4)


----------------------2.8
select
*
from
detalle_facturas
where
(
pre_unitario >= 10
or
cod_articulo not in (2,5,6,8,10)
)
and
nro_factura between 50 and 100


----------------------2.9
select
*
from
articulos
where
(
stock_minimo > 10
or
pre_unitario < 20
)
and
descripcion not like '[p,r]%'

----------------------2.10
select cod_vendedor, nom_vendedor, ape_vendedor, calle, altura, cod_barrio, nro_tel, [e-mail], fec_nac
from
vendedores
where
month(fec_nac) in (2,4,5,9)

--------------------------
--EJERCICIO 3
--------------------------

--3.1
--Listado de vendedores y el barrio en el que viven
select
v.cod_vendedor 'Codigo de Vendedor',
v.nom_vendedor + ' ' + v.ape_vendedor 'Nombre Vendedor',
b.barrio 'Barrio'
from
vendedores v, 
barrios b
where
v.cod_barrio = b.cod_barrio

--3.2
--Liste número de factura, fecha de venta y vendedor (apellido y nombre), para los casos en que el código del cliente van del 2 al 6. Ordene por vendedor y fecha, ambas en forma descendente
select
f.nro_factura 'Nro de factura', 
f.fecha 'Fecha Venta', 
v.ape_vendedor + ' ' + v.nom_vendedor 'Nombre Completo'
from
vendedores v, 
facturas f
where
v.cod_vendedor = f.cod_vendedor 
and
f.cod_cliente in (2,3,4,5,6)
--f.cod_cliente between 2 and 6
order by
[Nombre Completo] desc,
[Fecha Venta] desc

--3.3
--Emitir un reporte con los datos de la factura del cliente y del vendedor de aquellas facturas confeccionadas entre el primero de febrero del 2008 y el primero de marzo del 2010 y que el apellido del cliente no contenga “C”
SELECT
facturas.nro_factura, 
facturas.fecha, 
facturas.cod_cliente, 
facturas.cod_vendedor, 
vendedores.nom_vendedor + ' ' + vendedores.ape_vendedor 'Nombre Vendedor'
FROM  
facturas,
vendedores,
clientes
where
facturas.cod_vendedor = vendedores.cod_vendedor
and
facturas.cod_cliente = clientes.cod_cliente
and
facturas.fecha between '2008/02/01' and '2010/03/01'
and
clientes.ape_cliente not like '%c%'


--3.4
--Listar los datos de la factura, los del artículo y el importe (precio por cantidad); para las facturas emitidas en el 2009, 2010 y 2012 y la descripción no comience con “R”. Ordene por número de factura e importe, este en forma descendente. Rotule
select
f.nro_factura 'Nro de Factura',
f.fecha 'Fecha',
f.cod_vendedor 'Cod Vendedor',
f.cod_cliente 'Cod Cliente',
a.descripcion 'Descripcion',
a.observaciones 'Observaciones',
d.pre_unitario * d.cantidad 'Importe'
from
facturas f,
articulos a,
detalle_facturas d
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) in (2009,2010,2012)
and
a.descripcion not like 'r%'
order by
[Nro de Factura],
[Importe] desc

--3.5
--Se quiere saber qué artículos se vendieron, siempre que el precio al que fue vendido no esté entre $10 y $50. Rotule como: Código de Artículo, Descripción, Cantidad e Importe (El importe es el precio por la cantidad)
select
a.cod_articulo 'Codigo de Articulo',
a.descripcion 'Descripcion',
d.cantidad 'Cantidad',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
detalle_facturas d
where 
d.cod_articulo = a.cod_articulo
and
(d.cantidad * d.pre_unitario) not between 10 and 50

--3.6
--Liste todos los datos de la factura (vendedor, cliente, artículo, incluidos los datos de la venta); emitidas a clientes con teléfonos o direcciones de e-mail conocidas de aquellas facturas cuyo importe haya sido superior a $250. Agregue rótulos presentación y ordene el listado para darle mejor presentación
select
f.nro_factura 'Nro Factura',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo',
f.fecha 'Fecha Venta',
d.cantidad * d.pre_unitario 'Importe'
from
facturas f,
clientes c,
detalle_facturas d,
articulos a,
vendedores v
where
f.cod_cliente = c.cod_cliente
and
f.nro_factura = d.nro_factura
and
d.cod_articulo = a.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
(
c.nro_tel is not null 
or
c.[e-mail] is not null
)
and
(d.cantidad * d.pre_unitario) > 250
order by
[Nro Factura],
[Articulo]

--3.7
--Se quiere saber a qué cliente, de qué barrio, vendedor y en qué fecha se les vendió con los siguientes nros. de factura: 12, 18, 1, 3, 35, 26 y 29
select
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
b.barrio 'Barrio',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha Venta'
from
clientes c,
barrios b,
vendedores v,
facturas f
where
f.cod_cliente = c.cod_cliente
and
c.cod_barrio = b.cod_barrio
and
f.cod_vendedor = v.cod_vendedor
and
f.nro_factura in (12,18,1,3,25,26,29)

--3.8
--Emitir un reporte para informar qué artículos se vendieron, en las facturas cuyos números no esté entre 17 y 136. Liste la descripción, cantidad e importe. Ordene por descripción y cantidad. No muestre las filas con valores duplicados
select
distinct
a.descripcion 'Articulo',
d.cantidad 'Cantidad',
d.pre_unitario * d.cantidad 'Importe'
from
articulos a,
facturas f,
detalle_facturas d
where
a.cod_articulo = d.cod_articulo
and
f.nro_factura = d.nro_factura
and
f.nro_factura not between 17 and 136
order by
Articulo,
Cantidad

--3.9
--Listar los datos de las facturas (cliente, artículo, incluidos los datos de la venta incluido el importe) emitidas a los clientes cuyos apellidos comiencen con letras que van de la “l” a “s” o los artículos vendidos que tengan descripciones que comiencen con las mismas letras. Ordenar el listado
select
f.nro_factura 'Nro Factura',
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
d.pre_unitario * d.cantidad 'Importe',
f.fecha 'Fecha Venta'
from
facturas f,
clientes c,
articulos a,
detalle_facturas d,
vendedores v
where
c.cod_cliente = f.cod_cliente
and
v.cod_vendedor = f.cod_vendedor
and
a.cod_articulo = d.cod_articulo
and
d.nro_factura = f.nro_factura
and
(
c.ape_cliente like '[l-s]%'
or
a.descripcion like '[l-s]%'
)
order by
[Nro Factura]

--3.10
--Realizar un reporte de los artículos que se vendieron en lo que va del año. (Muestre los datos que sean significativos para el usuario del sistema usando rótulos para que sea más legible y que los artículos no se muestren repetidos)
select
distinct
a.descripcion 'Articulo',
f.fecha 'Fecha',
d.cantidad 'Cantidad',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
detalle_facturas d,
facturas f
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) = year(getdate())

--3.11
--Se quiere saber a qué clientes se les vendió el año pasado, qué vendedor le realizó la venta, y qué artículos compró, siempre que el vendedor que les vendió sea menor de 35 años
select
distinct
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
a.descripcion 'Articulo',
f.fecha 'Fecha'
from
clientes c,
facturas f,
detalle_facturas d,
articulos a,
vendedores v
where
c.cod_cliente = f.cod_cliente
and
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
year(f.fecha) = year(getdate()) - 1
and
year(v.fec_nac) < year(f.fecha) -35

--3.12
--El usuario de este sistema necesita ver el listado de facturas, de aquellos artículos cuyos precios unitarios a los que fueron vendidos estén entre 50 y 100 y de aquellos vendedores cuyo apellido no comience con letras que van de la “l” a la “m”. Ordenado por vendedor, fecha e importe
select
a.descripcion 'Articulo',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha',
d.pre_unitario * d.cantidad 'Importe'
from
facturas f,
articulos a,
detalle_facturas d,
vendedores v
where
a.cod_articulo = d.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
f.nro_factura = d.nro_factura
and
d.pre_unitario between 50 and 100
and
v.ape_vendedor not like '[l-m]%'
order by
Vendedor,
Fecha,
Importe

--3.13
--Se desea emitir un listado de clientes que compraron en enero, además saber qué compraron cuánto gastaron (mostrar los datos en forma conveniente)
select
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo Comprado',
d.pre_unitario * d.cantidad 'Importe',
f.fecha 'Fecha'
from
clientes c,
facturas f,
detalle_facturas d,
articulos a
where
c.cod_cliente = f.cod_cliente
and
d.nro_factura = f.nro_factura
and
a.cod_articulo = d.cod_articulo
and
month(f.fecha) = 1
order by
Fecha


--3.14
--Emitir un reporte de artículos vendidos en el 2010 a qué precios se vendieron y qué precio tienen hoy
select
a.descripcion 'Articulo',
f.fecha 'Fecha de Venta',
d.pre_unitario 'Precio al momento de la venta',
a.pre_unitario 'Precio actual',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
facturas f,
detalle_facturas d
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) = 2010

--3.15
--Listar los vendedores que hace 10 años les vendieron a clientes cuyos nombres o apellidos comienzan con "C"
select
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha Venta'
from
vendedores v,
facturas f,
clientes c
where
v.cod_vendedor = f.cod_vendedor
and
c.cod_cliente = f.cod_cliente
and
year(f.fecha) = year(getdate()) - 10
and
(
c.nom_cliente like 'c%'
or
c.ape_cliente like 'c%'
)

--3.16
--El encargado de la librería necesita tener información sobre los artículos que se vendían a menos de $ 10 antes del 2015. Mostrar los datos que se consideren relevantes para el encargado, rotular y ordenar
select
f.nro_factura 'Nro Factura',
a.descripcion 'Articulo',
d.pre_unitario 'Precio Unitario al momento de la Venta',
f.fecha 'Fecha de Venta'
from
articulos a,
detalle_facturas d,
facturas f
where
a.cod_articulo = d.cod_articulo
and
d.nro_factura = f.nro_factura
and
d.pre_unitario < 10
and
year(f.fecha) < 2015
order by
[Nro Factura]





