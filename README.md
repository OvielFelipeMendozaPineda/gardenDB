## Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   SELECT o.id as 'codigo oficina', c.nombre_ciudad as ciudad
   FROM oficina as o
   inner join ciudad as c ON c.id = o.id
   +----------------+------------+
   | codigo oficina | ciudad     |
   +----------------+------------+
   |              1 | Sevilla    |
   |              2 | Málaga     |
   |              3 | Barcelona  |
   |              4 | Madrid     |
   |              5 | Valencia   |
   |              6 | Vigo       |
   |              7 | Bilbao     |
   |              8 | Valladolid |
   |              9 | Toledo     |
   |             10 | Zaragoza   |
   +----------------+------------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT c.nombre_ciudad as ciudad, t_f.numero as numero
   FROM direccion_oficina as d_f
   INNER JOIN ciudad as c ON d_f.ciudad_id = c.id
   INNER JOIN region as r ON c.region_id = r.id
   INNER JOIN pais as p ON r.pais_id = p.id
   INNER JOIN telefono_oficina as t_f ON d_f.oficina_id = t_f.oficina_id 
   WHERE nombre_pais = 'España'
   +------------+------------+
   | ciudad     | numero     |
   +------------+------------+
   | Sevilla    | 1234567890 |
   | Málaga     | 9876543210 |
   | Barcelona  | 5555555555 |
   | Madrid     | 6666666666 |
   | Valencia   | 7777777777 |
   | Vigo       | 8888888888 |
   | Bilbao     | 9999999999 |
   | Valladolid | 1111111111 |
   | Toledo     | 2222222222 |
   | Zaragoza   | 3333333333 |
   +------------+------------+
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
    jefe tiene un código de jefe igual a 7.

  ```sql
  select e.nombre_empleado, e.apellido_1, e.apellido_2
  from empleado as e
  INNER JOIN telefono_empleado AS t_e ON e.id = t_e.empleado_id
  WHERE e.codigo_jefe = 7;
  ```

  

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
    empresa.

  ```sql
  SELECT e.nombre_empleado, apellido_1, apellido_2, p_u.nombre_puesto
  FROM empleado as e
  INNER JOIN puesto as p_u ON e.id_puesto = p_u.id
  WHERE codigo_jefe IS NULL;
  +-----------------+------------+------------+-------------------------------------+
  | nombre_empleado | apellido_1 | apellido_2 | nombre_puesto                       |
  +-----------------+------------+------------+-------------------------------------+
  | Eduardo         | Hernández  | López      | Director General                    |
  | María           | García     | Fernández  | Gerente de Ventas                   |
  | Juan            | Martínez   | Pérez      | Analista de Marketing               |
  | Laura           | Sánchez    | Gómez      | Especialista en Recursos Humanos    |
  | Carlos          | Rodríguez  | Ruiz       | Ingeniero de Desarrollo de Software |
  | Ana             | López      | Díaz       | Contador Financiero                 |
  | Pedro           | Fernández  | Torres     | Asistente Administrativo            |
  | Sofía           | Ruiz       | Vázquez    | Técnico de Soporte Técnico          |
  | Luis            | Martínez   | González   | Asesor Comercial                    |
  | Paula           | Gómez      | Hernández  | Operario de Producción              |
  +-----------------+------------+------------+-------------------------------------+
  ```

  

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
     empleados que no sean representantes de ventas.

     ```sql
     SELECT e.nombre_empleado, apellido_1, apellido_2, p_u.nombre_puesto
     FROM empleado as e
     INNER JOIN puesto as p_u ON e.id_puesto = p_u.id
     WHERE p_u.id != 2;
     +-----------------+------------+------------+-------------------------------------+
     | nombre_empleado | apellido_1 | apellido_2 | nombre_puesto                       |
     +-----------------+------------+------------+-------------------------------------+
     | Eduardo         | Hernández  | López      | Director General                    |
     | Juan            | Martínez   | Pérez      | Analista de Marketing               |
     | Laura           | Sánchez    | Gómez      | Especialista en Recursos Humanos    |
     | Carlos          | Rodríguez  | Ruiz       | Ingeniero de Desarrollo de Software |
     | Ana             | López      | Díaz       | Contador Financiero                 |
     | Pedro           | Fernández  | Torres     | Asistente Administrativo            |
     | Sofía           | Ruiz       | Vázquez    | Técnico de Soporte Técnico          |
     | Luis            | Martínez   | González   | Asesor Comercial                    |
     | Paula           | Gómez      | Hernández  | Operario de Producción              |
     +-----------------+------------+------------+-------------------------------------+
     ```

     

6. Devuelve un listado con el nombre de los todos los clientes españoles.

     ```sql
     SELECT DISTINCT c.nombre_cliente, c.apellido_1_cliente, c.apellido_2_cliente
     FROM direccion_cliente AS d_c
     INNER JOIN cliente as c ON d_c.cliente_id = c.id
     INNER JOIN ciudad as ci ON d_c.ciudad_id = ci.id
     INNER JOIN region as reg ON ci.region_id = reg.id
     INNER JOIN pais as pa ON reg.pais_id = pa.id
     WHERE pa.nombre_pais = 'España';
     +----------------+--------------------+--------------------+
     | nombre_cliente | apellido_1_cliente | apellido_2_cliente |
     +----------------+--------------------+--------------------+
     | Marta          | Torres             | Díaz               |
     | Diego          | Vázquez            | Sánchez            |
     | Carmen         | Ruiz               | Pérez              |
     | Javier         | Hernández          | Gómez              |
     | Paula          | López              | Fernández          |
     | Luis           | Martínez           | Vázquez            |
     | Sofía          | Díaz               | Torres             |
     | Pedro          | González           | Ruiz               |
     | Laura          | Fernández          | Díaz               |
     | Carlos         | Rodríguez          | Hernández          |
     | Ana            | Sánchez            | García             |
     | Juan           | Pérez              | López              |
     | María          | Gómez              | Martínez           |
     | Daniel         | Melendez           | Mejía              |
     +----------------+--------------------+--------------------+
     ```

     

7. Devuelve un listado con los distintos estados por los que puede pasar un
     pedido.

     ```sql
     SELECT id, estado FROM estado;
     +----+------------+
     | id | estado     |
     +----+------------+
     |  1 | Pendiente  |
     |  2 | En proceso |
     |  3 | Enviado    |
     |  4 | Entregado  |
     |  5 | Rechazado  |
     +----+------------+
     ```

     

8. Devuelve un listado con el código de cliente de aquellos clientes que
     realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
       aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
       • Utilizando la función YEAR de MySQL.

     ```sql
     SELECT c.id, c.nombre_cliente
     FROM transaccion AS trans
     INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
     INNER JOIN cliente AS c ON fpc.id_cliente = c.id
     WHERE YEAR(trans.fecha_pago) = 2008;
     ```

       • Utilizando la función DATE_FORMAT de MySQL.

     ```sql
     SELECT c.id, c.nombre_cliente, DATE_FORMAT(trans.fecha_pago, '%d/%m/%Y') AS fecha_pago_formateada
     FROM transaccion AS trans
     INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
     INNER JOIN cliente AS c ON fpc.id_cliente = c.id
     WHERE YEAR(trans.fecha_pago) = 2008;
     ```

       • Sin utilizar ninguna de las funciones anteriores.

     ```sql
     SELECT c.id, c.nombre_cliente
     FROM transaccion AS trans
     INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
     INNER JOIN cliente AS c ON fpc.id_cliente = c.id
     WHERE trans.fecha_pago >= '2008-01-01' AND trans.fecha_pago < '2009-01-01';
     
     ```

     

9. Devuelve un listado con el código de pedido, código de cliente, fecha
     esperada y fecha de entrega de los pedidos que no han sido entregados a
       tiempo.

     ```sql
     SELECT pe.id, pe.id_cliente, pe.fecha_esperada, pe.fecha_entrega
     FROM pedido as pe
     WHERE pe.estado_id = 3;
     +----+------------+----------------+---------------+
     | id | id_cliente | fecha_esperada | fecha_entrega |
     +----+------------+----------------+---------------+
     |  3 |          3 | 2024-05-15     | NULL          |
     +----+------------+----------------+---------------+
     ```

     

10. Devuelve un listado con el código de pedido, código de cliente, fecha
        esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
        menos dos días antes de la fecha esperada.
        • Utilizando la función ADDDATE de MySQL.

       ```sql
       SELECT
           pe.id AS codigo_pedido,
           pe.id_cliente AS codigo_cliente,
           pe.fecha_esperada,
           pe.fecha_entrega,
           pe.comentarios
       FROM
           pedido AS pe
       INNER JOIN estado AS st ON pe.estado_id = st.id
       WHERE
           pe.estado_id = 4
           AND YEAR(pe.fecha_pedido) = 2009
           AND pe.fecha_entrega <= ADDDATE(pe.fecha_esperada, -2);
           +---------------+----------------+----------------+---------------+-----------------+
       | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | comentarios     |
       +---------------+----------------+----------------+---------------+-----------------+
       |             4 |              4 | 2009-05-18     | 2009-05-16    | Pedido atrasado |
       +---------------+----------------+----------------+---------------+-----------------+
       
       ```

        • Utilizando la función DATEDIFF de MySQL.

       ```sql
       SELECT
           pe.id AS codigo_pedido,
           pe.id_cliente AS codigo_cliente,
           pe.fecha_esperada,
           pe.fecha_entrega,
           pe.comentarios
       FROM
           pedido AS pe
       INNER JOIN estado AS st ON pe.estado_id = st.id
       WHERE
           pe.estado_id = 4
           AND YEAR(pe.fecha_pedido) = 2009
           AND DATEDIFF(pe.fecha_esperada,  pe.fecha_entrega) <= 2;
           
       +---------------+----------------+----------------+---------------+-----------------+
       | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | comentarios     |
       +---------------+----------------+----------------+---------------+-----------------+
       |             4 |              4 | 2009-05-18     | 2009-05-16    | Pedido atrasado |
       +---------------+----------------+----------------+---------------+-----------------+
       ```

        • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
        resta -?

       ```sql
       SELECT
           pe.id AS codigo_pedido,
           pe.id_cliente AS codigo_cliente,
           pe.fecha_esperada,
           pe.fecha_entrega,
           pe.comentarios
       FROM
           pedido AS pe
       INNER JOIN estado AS st ON pe.estado_id = st.id
       WHERE
           pe.estado_id = 4
           AND YEAR(pe.fecha_pedido) = 2009
           AND fecha_esperada - fecha_entrega <= 2;
           +---------------+----------------+----------------+---------------+-----------------+
       | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | comentarios     |
       +---------------+----------------+----------------+---------------+-----------------+
       |             4 |              4 | 2009-05-18     | 2009-05-16    | Pedido atrasado |
       +---------------+----------------+----------------+---------------+-----------------+
       
       ```

       

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

          ```sql
          +----+--------------+----------------+---------------+-----------------------+------------+-----------+
          | id | fecha_pedido | fecha_esperada | fecha_entrega | comentarios           | id_cliente | estado_id |
          +----+--------------+----------------+---------------+-----------------------+------------+-----------+
          |  5 | 2009-05-05   | 2009-05-20     | NULL          | Pedido de última hora |          5 |         5 |
          +----+--------------+----------------+---------------+-----------------------+------------+-----------+
          ```


      ​    

12. Devuelve un listado de todos los pedidos que han sido entregados en el
            mes de enero de cualquier año.

          ```sql
          SELECT
              pe.id AS codigo_pedido,
              pe.id_cliente AS codigo_cliente,
              pe.fecha_esperada,
              pe.fecha_entrega,
              pe.comentarios
          FROM
              pedido AS pe
          INNER JOIN estado AS st ON pe.estado_id = st.id
          WHERE
              pe.estado_id = 4
              AND MONTH(pe.fecha_pedido) = 01;
          ```


      ​    

13. Devuelve un listado con todos los pagos que se realizaron en el
            año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

          ```sql
          SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
          FROM transaccion AS trans
          INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
          INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
          WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2008;
          /* SE MODIFICO LA FECHA DE LA CONSULTA YA QUE NO HUBIERON RESULTADOS QUE COINCIDIERAN CON LA PRIMERA */
          SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
          FROM transaccion AS trans
          INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
          INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
          WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2009;
          +----+-----------------------+------------+-------+--------+
          | id | id_forma_pago_cliente | fecha_pago | total | tipo   |
          +----+-----------------------+------------+-------+--------+
          |  4 |                     4 | 2009-05-04 |  1200 | PayPal |
          |  9 |                     4 | 2009-05-04 |   300 | PayPal |
          +----+-----------------------+------------+-------+--------+


      ​    
          ```


      ​    

14. Devuelve un listado con todas las formas de pago que aparecen en la
            tabla pago. Tenga en cuenta que no deben aparecer formas de pago
            repetidas.

          ```sql
          SELECT DISTINCT id, tipo FROM forma_pago;
          +----+------------------------+
          | id | tipo                   |
          +----+------------------------+
          |  1 | Transferencia bancaria |
          |  2 | Tarjeta de crédito     |
          |  3 | Cheque                 |
          |  4 | PayPal                 |
          |  5 | Efectivo               |
          +----+------------------------+
          ```


      ​    

15. Devuelve un listado con todos los productos que pertenecen a la
            gama Ornamentales y que tienen más de 100 unidades en stock. El listado
            deberá estar ordenado por su precio de venta, mostrando en primer lugar
            los de mayor precio.

          ```sql
          SELECT p.id, p.nombre_producto, dp.precio_venta, dp.stock
          FROM producto AS p
          INNER JOIN detalle_producto AS dp ON p.id = dp.id_producto
          INNER JOIN gama AS g ON dp.id_gama = g.id
          WHERE g.descripcion_texto = 'Ornamentales' AND dp.stock > 100
          ORDER BY dp.precio_venta DESC;
          ```


      ​    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
            cuyo representante de ventas tenga el código de empleado 11 o 30.

      ~~~sql
      ```sql
      SELECT  c.id , c.nombre_cliente, c.apellido_1_cliente,  c.apellido_2_cliente, c.rep_ventas_id,  c.limite_credito
      FROM cliente AS c
      INNER JOIN direccion_cliente AS dc ON c.id = dc.cliente_id
      INNER JOIN ciudad AS ci ON dc.ciudad_id = ci.id
      WHERE ci.nombre_ciudad = 'Madrid' AND c.rep_ventas_id = 11 OR c.rep_ventas_id = 30;
      ```
      ~~~


      ​    
    
          ##   Consultas multi-tabla (Composición interna)
          
            Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
            sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
               representante de ventas.

          ```sql
          SELECT c.nombre_cliente, e.nombre_empleado, e.apellido_1
          FROM cliente as c
          INNER JOIN empleado as e ON c.id = e.id;
          +----------------+-----------------+------------+
          | nombre_cliente | nombre_empleado | apellido_1 |
          +----------------+-----------------+------------+
          | Daniel         | Eduardo         | Hernández  |
          | María          | María           | García     |
          | Juan           | Juan            | Martínez   |
          | Ana            | Laura           | Sánchez    |
          | Carlos         | Carlos          | Rodríguez  |
          | Laura          | Ana             | López      |
          | Pedro          | Pedro           | Fernández  |
          | Sofía          | Sofía           | Ruiz       |
          | Luis           | Luis            | Martínez   |
          | Paula          | Paula           | Gómez      |
          +----------------+-----------------+------------+
          ```


      ​    

18. Muestra el nombre de los clientes que hayan realizado pagos junto con el
               nombre de sus representantes de ventas.

          ```sql
          SELECT c.nombre_cliente as cliente, e.nombre_empleado as empleado
          FROM cliente as c
          INNER JOIN pedido as pe ON pe.id_cliente = c.id
          INNER JOIN empleado as e ON e.id = c.rep_ventas_id;
          +---------+----------+
          | cliente | empleado |
          +---------+----------+
          | Daniel  | Sofía    |
          | María   | Sofía    |
          | Juan    | Ana      |
          | Ana     | Ana      |
          | Carlos  | Paula    |
          +---------+----------+
          ```


      ​    

19. Muestra el nombre de los clientes que no hayan realizado pagos junto con
               el nombre de sus representantes de ventas.

          ```sql
          SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado
          FROM cliente AS c
          LEFT JOIN pedido AS pe ON pe.id_cliente = c.id
          INNER JOIN empleado AS e ON e.id = c.rep_ventas_id
          WHERE pe.id_cliente IS NULL;
          +-----------+----------+
          | cliente   | empleado |
          +-----------+----------+
          | Laura     | Laura    |
          | Pedro     | Paula    |
          | Sofía     | Carlos   |
          | Luis      | Carlos   |
          | Paula     | Paula    |
          | Javier    | Carlos   |
          | Carmen    | Juan     |
          | Diego     | María    |
          | Marta     | Pedro    |
          | Pablo     | María    |
          | Elena     | Ana      |
          | Andrés    | Carlos   |
          | Patricia  | Carlos   |
          | Francisco | Paula    |
          | Alejandra | Juan     |
          +-----------+----------+
          ```


      ​    

20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
               representantes junto con la ciudad de la oficina a la que pertenece el
               representante.

          ```sql
          SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado, o.nombre_oficina AS oficina
          FROM cliente AS c
          INNER JOIN pedido AS pe ON c.id = pe.id_cliente
          INNER JOIN empleado AS e ON c.rep_ventas_id = e.id
          INNER JOIN oficina AS o ON e.oficina_id = o.id
          WHERE pe.id_cliente is NOT NULL;
          +---------+----------+-----------------------+
          | cliente | empleado | oficina               |
          +---------+----------+-----------------------+
          | Daniel  | Sofía    | Oficina de Desarrollo |
          | María   | Sofía    | Oficina de Desarrollo |
          | Juan    | Ana      | Sede Regional Norte   |
          | Ana     | Ana      | Sede Regional Norte   |
          | Carlos  | Paula    | Sede Administrativa   |
          +---------+----------+-----------------------+
          
          ```


      ​    

21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
               de sus representantes junto con la ciudad de la oficina a la que pertenece el
               representante.

          ```sql
          SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado, o.nombre_oficina AS oficina, cd.nombre_ciudad as ciudad
          FROM cliente AS c
          INNER JOIN pedido AS pe ON c.id = pe.id_cliente
          INNER JOIN empleado AS e ON c.rep_ventas_id = e.id
          INNER JOIN oficina AS o ON e.oficina_id = o.id
          INNER JOIN direccion_oficina as d_o ON o.id =  d_o.oficina_id
          INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
          WHERE pe.id_cliente is NULL;
          ```


      ​    

22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

          ```sql
          SELECT d_o.id as código, d_o.linea_1 as 'Linea 1 ', d_o.linea_2 as 'Linea 2', d_o.codigo_postal as ZIP, d_o.oficina_id as 'código oficina'
          FROM direccion_oficina as d_o
          INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
          INNER JOIN empleado as e ON d_o.oficina_id = e.oficina_id
          INNER JOIN cliente as c ON e.id = c.rep_ventas_id
          WHERE cd.nombre_ciudad = 'Fuenlabrada';
          /* SE MODIFICO EL NOMBRE DE LA CIUDAD  PARA VER RESULTADOS */
          SELECT d_o.id as código, d_o.linea_1 as 'Linea 1 ', d_o.linea_2 as 'Linea 2', d_o.codigo_postal as ZIP, d_o.oficina_id as 'código oficina'
          FROM direccion_oficina as d_o
          INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
          INNER JOIN empleado as e ON d_o.oficina_id = e.oficina_id
          INNER JOIN cliente as c ON e.id = c.rep_ventas_id
          WHERE cd.nombre_ciudad = 'Madrid';
          +--------+----------------------------+---------+-------+----------------+
          | código | Linea 1                    | Linea 2 | ZIP   | código oficina |
          +--------+----------------------------+---------+-------+----------------+
          |      4 | Paseo de la Castellana 100 | NULL    | 28003 |              4 |
          +--------+----------------------------+---------+-------+----------------+
          ```


      ​    

23. Devuelve el nombre de los clientes y el nombre de sus representantes junto
               con la ciudad de la oficina a la que pertenece el representante.

          ```sql
          SELECT c.nombre_cliente as cliente, e.nombre_empleado as Representante, cd.nombre_ciudad as Ciudad
          FROM cliente as c
          INNER JOIN empleado as e ON c.rep_ventas_id = e.id
          INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
          INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id;
          +-----------+---------------+------------+
          | cliente   | Representante | Ciudad     |
          +-----------+---------------+------------+
          | Daniel    | Sofía         | Valladolid |
          | María     | Sofía         | Valladolid |
          | Juan      | Ana           | Vigo       |
          | Ana       | Ana           | Vigo       |
          | Carlos    | Paula         | Zaragoza   |
          | Laura     | Laura         | Madrid     |
          | Pedro     | Paula         | Zaragoza   |
          | Sofía     | Carlos        | Valencia   |
          | Luis      | Carlos        | Valencia   |
          | Paula     | Paula         | Zaragoza   |
          | Javier    | Carlos        | Valencia   |
          | Carmen    | Juan          | Barcelona  |
          | Diego     | María         | Málaga     |
          | Marta     | Pedro         | Bilbao     |
          | Pablo     | María         | Málaga     |
          | Elena     | Ana           | Vigo       |
          | Andrés    | Carlos        | Valencia   |
          | Patricia  | Carlos        | Valencia   |
          | Francisco | Paula         | Zaragoza   |
          | Alejandra | Juan          | Barcelona  |
          +-----------+---------------+------------+
          ```


      ​    

24. Devuelve un listado con el nombre de los empleados junto con el nombre
               de sus jefes.

          ```sql
          SELECT e.nombre_empleado AS empleado, j.nombre_empleado AS jefe
          FROM empleado AS e
          inner JOIN empleado AS j ON e.codigo_jefe = j.id;
          
          +----------+---------+
          | empleado | jefe    |
          +----------+---------+
          | Juan     | Eduardo |
          | Laura    | Eduardo |
          | Carlos   | María   |
          | Ana      | María   |
          | Pedro    | Eduardo |
          | Sofía    | Eduardo |
          | Luis     | Eduardo |
          | Paula    | María   |
          +----------+---------+
          ```

25. Devuelve un listado que muestre el nombre de cada empleados, el nombre
               de su jefe y el nombre del jefe de sus jefe.

          ```sql
          SELECT e.nombre_empleado AS empleado, j.nombre_empleado AS jefe
          FROM empleado AS e
          LEFT JOIN empleado AS j ON e.codigo_jefe = j.id;
          +----------+---------+
          | empleado | jefe    |
          +----------+---------+
          | Eduardo  | NULL    |
          | María    | NULL    |
          | Juan     | Eduardo |
          | Laura    | Eduardo |
          | Carlos   | María   |
          | Ana      | María   |
          | Pedro    | Eduardo |
          | Sofía    | Eduardo |
          | Luis     | Eduardo |
          | Paula    | María   |
          +----------+---------+
          ```


      ​    

26. Devuelve el nombre de los clientes a los que no se les ha entregado a
            tiempo un pedido.

          ```sql
          SELECT c.nombre_cliente as Cliente, c.id
          FROM cliente as c
          INNER JOIN pedido as p ON c.id = p.id_cliente
          INNER JOIN estado as e ON p.estado_id = e.id
          WHERE p.fecha_entrega > p.fecha_esperada;
          
          ```


      ​    

27. Devuelve un listado de las diferentes gamas de producto que ha comprado
            cada cliente.

          ```sql
          SELECT  c.nombre_cliente as cliente, g.descripcion_texto as gama
          from cliente as c
          INNER JOIN pedido as pe ON c.id = pe.id_cliente
          INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
          INNER JOIN detalle_producto as dpt ON dp.detalle_producto_id = dpt.id 
          INNER JOIN gama as g ON dpt.id_gama = g.id;
          +---------+----------------+
          | cliente | gama           |
          +---------+----------------+
          | Daniel  | Hogar y Jardín |
          | Daniel  | Hogar y Jardín |
          | María   | Hogar y Jardín |
          | María   | Hogar y Jardín |
          | Juan    | Hogar y Jardín |
          | Juan    | Hogar y Jardín |
          | Ana     | Hogar y Jardín |
          | Ana     | Hogar y Jardín |
          | Carlos  | Hogar y Jardín |
          | Carlos  | Hogar y Jardín |
          +---------+----------------+
          ```


      ​    
    
          ##   Consultas multitabla (Composición externa)
    
        Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
        LEFT JOIN y NATURAL RIGHT JOIN.

28. Devuelve un listado que muestre solamente los clientes que no han
               realizado ningún pago.

        ```sql
        SELECT c.nombre_cliente as cliente
        FROM cliente as c
        INNER JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
        WHERE fpc.id_cliene is null;
        ```

    
    ​    
    
29. Devuelve un listado que muestre solamente los clientes que no han
               realizado ningún pedido.

        ```sql
        SELECT  c.nombre_cliente as  cliente
        FROM cliente as c 
        LEFT JOIN pedido as pe ON c.id = pe.id_cliente;
        WHERE pe.id_cliente is null;
        +-----------+
        | cliente   |
        +-----------+
        | Daniel    |
        | María     |
        | Juan      |
        | Ana       |
        | Carlos    |
        | Laura     |
        | Pedro     |
        | Sofía     |
        | Luis      |
        | Paula     |
        | Javier    |
        | Carmen    |
        | Diego     |
        | Marta     |
        | Pablo     |
        | Elena     |
        | Andrés    |
        | Patricia  |
        | Francisco |
        | Alejandra |
        +-----------+
        ```

    
    ​    
    
30. Devuelve un listado que muestre los clientes que no han realizado ningún
               pago y los que no han realizado ningún pedido.

        ```sql
        SELECT c.nombre_cliente as cliente
        FROM cliente as c
        LEFT JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
        LEFT JOIN pedido as pe ON c.id = pe.id_cliente;
        WHERE pe.id_cliente is null AND fpc.id_cliene is null;
        +-----------+
        | cliente   |
        +-----------+
        | Daniel    |
        | María     |
        | Juan      |
        | Ana       |
        | Carlos    |
        | Laura     |
        | Pedro     |
        | Sofía     |
        | Luis      |
        | Paula     |
        | Javier    |
        | Carmen    |
        | Diego     |
        | Marta     |
        | Pablo     |
        | Elena     |
        | Andrés    |
        | Patricia  |
        | Francisco |
        | Alejandra |
        +-----------+
        ```

    
    ​    
    
31. Devuelve un listado que muestre solamente los empleados que no tienen
               una oficina asociada.

        ```sql
        SELECT e.nombre_empleado
        FROM empleado as e
        LEFT JOIN oficina as O ON e.oficina_id = o.id
        WHERE o.id is NULL; 
        ```

    
    ​    
    
32. Devuelve un listado que muestre solamente los empleados que no tienen un
               cliente asociado.

        ```sql
        SELECT  e.nombre_empleado
        FROM empleado as e
        LEFT JOIN cliente as c ON e.id = c.rep_ventas_id 
        WHERE c.rep_ventas_id is NULL;
        +-----------------+
        | nombre_empleado |
        +-----------------+
        | Eduardo         |
        | Luis            |
        +-----------------+
        ```

    
    ​    
    
33. Devuelve un listado que muestre solamente los empleados que no tienen un
               cliente asociado junto con los datos de la oficina donde trabajan.

        ```sql
        SELECT  e.nombre_empleado, o.nombre_oficina, d_o.linea_1, d_o.linea_2, d_o.codigo_postal
        FROM empleado as e
        LEFT JOIN cliente as c ON e.id = c.rep_ventas_id 
        INNER JOIN oficina as o ON e.oficina_id = o.id
        INNER JOIN direccion_oficina as d_o ON o.id = d_o.oficina_id
        WHERE c.rep_ventas_id is NULL;
        +-----------------+-------------------------------+-----------------------------+---------+---------------+
        | nombre_empleado | nombre_oficina                | linea_1                     | linea_2 | codigo_postal |
        +-----------------+-------------------------------+-----------------------------+---------+---------------+
        | Eduardo         | Centro de Operaciones         | Calle de la Plaza 10        | Piso 3  |         41010 |
        | Luis            | Centro de Servicio al Cliente | Avenida de la Revolución 45 | NULL    |         10001 |
        +-----------------+-------------------------------+-----------------------------+---------+---------------+
        ```

    
    ​    
    
34. Devuelve un listado que muestre los empleados que no tienen una oficina
               asociada y los que no tienen un cliente asociado.

        ```sql
        SELECT  e.nombre_empleado
        FROM empleado as e
        LEFT JOIN oficina as o ON e.oficina_id = o.id
        LEFT JOIN cliente as c ON e.id = c.rep_ventas_id
        WHERE o.id is null and c.rep_ventas_id is null;
        ```

    
    ​    
    
35. Devuelve un listado de los productos que nunca han aparecido en un
               pedido.

        ```sql
        SELECT p.nombre_producto
        FROM producto as p
        INNER JOIN detalle_producto as det ON p.id = det.id_producto
        LEFT JOIN detalle_pedido as detp ON det.id = detp.detalle_producto_id
        WHERE detp.detalle_producto_id is null;
        ```

    
    ​    
    
36. Devuelve un listado de los productos que nunca han aparecido en un
               pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
               producto.

        ```sql
        SELECT p.nombre_producto, det.descripcion, g.imagen as imagen
        FROM producto as p
        INNER JOIN detalle_producto as det ON p.id = det.id_producto
        INNER JOIN gama as g ON det.id_gama = g.id
        LEFT JOIN detalle_pedido as detp ON det.id = detp.detalle_producto_id
        WHERE detp.detalle_producto_id is null;
        ```

    
    ​    
    
      1. Devuelve las oficinas donde no trabajan ninguno de los empleados que
                 hayan sido los representantes de ventas de algún cliente que haya realizado
                 la compra de algún producto de la gama Frutales.


        ```sql
        SELECT o.nombre_oficina
        FROM oficina as o
        INNER JOIN empleado as e ON o.id = e.oficina_id
        INNER JOIN cliente as c ON  e.id = c.rep_ventas_id
        INNER JOIN pedido as pe ON c.id = pe.id_cliente
        INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
        INNER JOIN detalle_producto as de_p ON dp.detalle_producto_id = de_p.id
        INNER JOIN gama as g on de_p.id_gama = g.id
        WHERE g.descripcion_texto = 'Frutales' and c.rep_ventas_id IS NULL;
        ```


​        

37. Devuelve un listado con los clientes que han realizado algún pedido pero no
            han realizado ningún pago.

        ```sql
        SELECT c.nombre_cliente
        FROM cliente c
        INNER JOIN pedido pe ON c.id = pe.id_cliente
        INNER JOIN forma_pago_cliente fpc ON c.id = fpc.id_cliente
        LEFT JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
        WHERE tr.id_forma_pago_cliente IS NULL and pe.id_cliente is not null;
        
        ```

    
    ​    
    
38. Devuelve un listado con los datos de los empleados que no tienen clientes
            asociados y el nombre de su jefe asociado.

        ```sql
        SELECT e.id, e.nombre_empleado, e.apellido_1, e.apellido_2, e.oficina_id, e.codigo_jefe, e.id_puesto
        FROM empleado as e
        LEFT JOIN cliente as c ON e.id = c.rep_ventas_id
        WHERE c.rep_ventas_id is null;
        +----+-----------------+------------+------------+------------+-------------+-----------+
        | id | nombre_empleado | apellido_1 | apellido_2 | oficina_id | codigo_jefe | id_puesto |
        +----+-----------------+------------+------------+------------+-------------+-----------+
        |  1 | Eduardo         | Hernández  | López      |          1 |        NULL |         1 |
        |  9 | Luis            | Martínez   | González   |          9 |           1 |         9 |
        +----+-----------------+------------+------------+------------+-------------+-----------+
        ```

    
    ​    
    
        ##     Consultas resumen
    
39. ¿Cuántos empleados hay en la compañía?

        ```sql
        SELECT COUNT(id) as 'Cantidad de empleados'
        FROM empleado
        +-----------------------+
        | Cantidad de empleados |
        +-----------------------+
        |                    10 |
        +-----------------------+
        ```


    ​    

40. ¿Cuántos clientes tiene cada país?

        ```sql
        SELECT ci.nombre_ciudad, COUNT(c.id) as 'Cantidad de clientes'
        FROM cliente as c
        INNER JOIN direccion_cliente as d_c on c.id = d_c.cliente_id
        INNER JOIN ciudad as ci ON d_c.ciudad_id = ci.id
        GROUP BY ci.nombre_ciudad;
        +----------------------------+----------------------+
        | nombre_ciudad              | Cantidad de clientes |
        +----------------------------+----------------------+
        | Sevilla                    |                    2 |
        | Málaga                     |                    1 |
        | Mérida                     |                    2 |
        | Melilla                    |                    1 |
        | Barcelona                  |                    1 |
        | Madrid                     |                    1 |
        | Valencia                   |                    1 |
        | Vigo                       |                    1 |
        | Bilbao                     |                    1 |
        | Valladolid                 |                    1 |
        | Toledo                     |                    1 |
        | Zaragoza                   |                    1 |
        | Palma de Mallorca          |                    1 |
        | Las Palmas de Gran Canaria |                    1 |
        | Oviedo                     |                    1 |
        | Santander                  |                    1 |
        +----------------------------+----------------------+
        ```


    ​    

41. ¿Cuál fue el pago medio en 2009?

        ```sql
            SELECT AVG(dp.cantidad * dp.precio_unidad) as Cantidad
            FROM detalle_pedido as dp
            INNER JOIN pedido as pe ON dp.pedido_id = pe.id
            WHERE YEAR(fecha_pedido) = '2009';
        +----------+
        | Cantidad |
        +----------+
        |  55.5000 |
        +----------+
        ```


    ​    

42. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
               descendente por el número de pedidos.

        ```sql
        SELECT COUNT(p.estado_id) as CANTIDAD
        FROM pedido as p
        GROUP BY p.estado_id;
        +----------+
        | CANTIDAD |
        +----------+
        |        1 |
        |        1 |
        |        1 |
        |        1 |
        |        1 |
        +----------+
        ```

    
    ​    
    
43. Calcula el precio de venta del producto más caro y más barato en una
               misma consulta.

      ```sql
      SELECT p.nombre_producto, dp.precio_venta
      FROM producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE dp.precio_venta = (SELECT MIN(precio_venta) FROM detalle_producto)
      UNION ALL
      SELECT p.nombre_producto, dp.precio_venta
      FROM producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE dp.precio_venta = (SELECT MAX(precio_venta) FROM detalle_producto);
      +-----------------+--------------+
      | nombre_producto | precio_venta |
      +-----------------+--------------+
      | Corbata         |           15 |
      | Zapatos         |           50 |
      +-----------------+--------------+
      ```

      

44. Calcula el número de clientes que tiene la empresa.

      ```sql
      SELECT COUNT(id) as Cantidad_clientes
      FROM cliente;
      +-------------------+
      | Cantidad_clientes |
      +-------------------+
      |                20 |
      +-------------------+
      ```

      

45. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

      ```sql
          SELECT COUNT(c.id) as CANTIDAD
          FROM cliente AS  c
          INNER JOIN direccion_cliente as d_o ON c.id = d_o.cliente_id
          INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
          WHERE ci.nombre_ciudad = 'Madrid';
          +----------+
      | CANTIDAD |
      +----------+
      |        1 |
      +----------+
      ```

      

46. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
               por M?

      ```sql
      SELECT COUNT(c.id) AS CANTIDAD
      FROM cliente as c
      INNER JOIN direccion_cliente as d_o ON c.id = d_o.cliente_id
      INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
      WHERE ci.nombre_ciudad like 'M%';
      +----------+
      | CANTIDAD |
      +----------+
      |        5 |
      +----------+
      ```

      

47. Devuelve el nombre de los representantes de ventas y el número de clientes
               al que atiende cada uno.

      ```sql
      select e.nombre_empleado, COUNT(c.id) as clientes
      FROM empleado as e 
      INNER JOIN cliente as c ON e.id = c.rep_ventas_id
      GROUP BY e.nombre_empleado;
      +-----------------+----------+
      | nombre_empleado | clientes |
      +-----------------+----------+
      | María           |        2 |
      | Juan            |        2 |
      | Laura           |        1 |
      | Carlos          |        5 |
      | Ana             |        3 |
      | Pedro           |        1 |
      | Sofía           |        2 |
      | Paula           |        4 |
      +-----------------+----------+
      ```

      

48. Calcula el número de clientes que no tiene asignado representante de
            ventas.

      ```sql
      select e.nombre_empleado, COUNT(c.id) as clientes
      FROM empleado as e 
      INNER JOIN cliente as c ON e.id = c.rep_ventas_id
      WHERE c.rep_ventas_id IS NULL
      GROUP BY e.nombre_empleado;
      ```

      

49. Calcula la fecha del primer y último pago realizado por cada uno de los
            clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

      ```sql
      SELECT c.nombre_cliente, c.apellido_1, c.apellido_2
      FROM cliente AS c
      INNER JOIN forma_pago_cliente AS fpc ON c.id = fpc.cliente_id
      INNER JOIN transaccion AS tr ON c.id = tr.id_forma_pago_cliente;
      
      ```

      

50. Calcula el número de productos diferentes que hay en cada uno de los
            pedidos.

      ```sql
      SELECT dpe.id, COUNT(p.id) as cantidad
      FROM detalle_pedido as dpe
      INNER JOIN detalle_producto as dp ON dpe.detalle_producto_id = dp.id
      INNER JOIN producto as p ON dp.id_producto = p.id
      GROUP BY dpe.id
      ORDER BY dpe.id ASC;
      +----+----------+
      | id | cantidad |
      +----+----------+
      |  1 |        1 |
      |  2 |        1 |
      |  3 |        1 |
      |  4 |        1 |
      |  5 |        1 |
      |  6 |        1 |
      |  7 |        1 |
      |  8 |        1 |
      |  9 |        1 |
      | 10 |        1 |
      +----+----------+
      ```

      

51. Calcula la suma de la cantidad total de todos los productos que aparecen en
            cada uno de los pedidos.

      ```sql
      SELECT dpe.pedido_id, SUM(dpe.cantidad) AS cantidad_total
      FROM detalle_pedido AS dpe
      GROUP BY dpe.pedido_id;
      
      +-----------+----------------+
      | pedido_id | cantidad_total |
      +-----------+----------------+
      |         1 |              3 |
      |         2 |              4 |
      |         3 |              3 |
      |         4 |              6 |
      |         5 |              4 |
      +-----------+----------------+
      ```

      

52. Devuelve un listado de los 20 productos más vendidos y el número total de
            unidades que se han vendido de cada uno. El listado deberá estar ordenado
            por el número total de unidades vendidas.

      ```sql
      SELECT p.nombre_producto, SUM(dpe.cantidad) AS total_unidades_vendidas
      FROM producto AS p
      INNER JOIN detalle_producto AS dp ON p.id = dp.id_producto
      INNER JOIN detalle_pedido AS dpe ON dp.id = dpe.detalle_producto_id
      GROUP BY p.nombre_producto
      ORDER BY total_unidades_vendidas DESC
      LIMIT 20;
      +-----------------+-------------------------+
      | nombre_producto | total_unidades_vendidas |
      +-----------------+-------------------------+
      | Pantalón        |                       5 |
      | Zapatos         |                       5 |
      | Bolso           |                       5 |
      | Camisa          |                       3 |
      | Corbata         |                       2 |
      +-----------------+-------------------------+
      ```

      

53. La facturación que ha tenido la empresa en toda la historia, indicando la
            base imponible, el IVA y el total facturado. La base imponible se calcula
            sumando el coste del producto por el número de unidades vendidas de la
            tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
            suma de los dos campos anteriores.

      ```sql
      SELECT 
          SUM(dpe.precio_unidad * dpe.cantidad) AS base_imponible,
          SUM(dpe.precio_unidad * dpe.cantidad) * 0.21 AS iva,
          SUM(dpe.precio_unidad * dpe.cantidad) + (SUM(dpe.precio_unidad * dpe.cantidad) * 0.21) AS total_facturado
      FROM detalle_pedido AS dpe
      INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id;
      +----------------+--------+-----------------+
      | base_imponible | iva    | total_facturado |
      +----------------+--------+-----------------+
      |            555 | 116.55 |          671.55 |
      +----------------+--------+-----------------+
      ```

      

54. La misma información que en la pregunta anterior, pero agrupada por
            código de producto.

      ```sql
      SELECT 
          SUM(dpe.precio_unidad * dpe.cantidad) AS base_imponible,
          SUM(dpe.precio_unidad * dpe.cantidad) * 0.21 AS iva,
          SUM(dpe.precio_unidad * dpe.cantidad) + (SUM(dpe.precio_unidad * dpe.cantidad) * 0.21) AS total_facturado
      FROM detalle_pedido AS dpe
      INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id
      GROUP BY dp.id_producto;
      
      
      ```

      

55. La misma información que en la pregunta anterior, pero agrupada por
            código de producto filtrada por los códigos que empiecen por OR.

      ```sql
      SELECT 
          SUM(dpe.precio_unidad * dpe.cantidad) AS base_imponible,
          SUM(dpe.precio_unidad * dpe.cantidad) * 0.21 AS iva,
          SUM(dpe.precio_unidad * dpe.cantidad) + (SUM(dpe.precio_unidad * dpe.cantidad) * 0.21) AS total_facturado
      FROM detalle_pedido AS dpe
      INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id
      WHERE dp.id_producto LIKE 'OR%'
      GROUP BY dp.id_producto;
      
      ```

      

56. Lista las ventas totales de los productos que hayan facturado más de 3000
            euros. Se mostrará el nombre, unidades vendidas, total facturado y total
            facturado con impuestos (21% IVA).

      ```sql
      SELECT 
          p.nombre_producto,
          SUM(dpe.cantidad) AS unidades_vendidas,
          SUM(dpe.precio_unidad * dpe.cantidad) AS total_facturado,
          SUM(dpe.precio_unidad * dpe.cantidad) * 1.21 AS total_facturado_con_iva
      FROM detalle_pedido AS dpe
      INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id
      INNER JOIN producto AS p ON dp.id_producto = p.id
      GROUP BY p.nombre_producto
      HAVING SUM(dpe.precio_unidad * dpe.cantidad) > 3000;
      
      ```

      

57. Muestre la suma total de todos los pagos que se realizaron para cada uno
            de los años que aparecen en la tabla pagos.

      ```sql
      SELECT 
          YEAR(fecha_pago) AS año,
          SUM(total) AS total_pagos
      FROM transaccion
      GROUP BY YEAR(fecha_pago);
      
      +------+-------------+
      | año | total_pagos |
      +------+-------------+
      | 2009 |        7500 |
      +------+-------------+
      ```

      

        ##     Subconsulta  Con operadores básicos de comparación

58. Devuelve el nombre del cliente con mayor límite de crédito.

      ```sql
      SELECT nombre_cliente, limite_credito
      FROM cliente
      WHERE limite_credito =  (Select MAX(limite_credito) from cliente);
      +----------------+----------------+
      | nombre_cliente | limite_credito |
      +----------------+----------------+
      | Alejandra      |           2700 |
      +----------------+----------------+
      ```

      

59. Devuelve el nombre del producto que tenga el precio de venta más caro.

      ```sql
      SELECT p.nombre_producto
      FROM producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE precio_venta = (SELECT MAX(precio_venta) from detalle_producto);
      +-----------------+
      | nombre_producto |
      +-----------------+
      | Zapatos         |
      +-----------------+
      ```

      

60. Devuelve el nombre del producto del que se han vendido más unidades.
               (Tenga en cuenta que tendrá que calcular cuál es el número total de
               unidades que se han vendido de cada producto a partir de los datos de la
               tabla detalle_pedido)

      ```sql
      SELECT p.nombre_producto, COUNT(dpe.cantidad) as cantidad
      from producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      INNER JOIN detalle_pedido as dpe ON dp.id = dpe.detalle_producto_id
      GROUP BY p.nombre_producto;
      +-----------------+----------+
      | nombre_producto | cantidad |
      +-----------------+----------+
      | Camisa          |        2 |
      | Pantalón        |        2 |
      | Zapatos         |        2 |
      | Corbata         |        2 |
      | Bolso           |        2 |
      +-----------------+----------+
      ```

      

61. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
               realizado. (Sin utilizar INNER JOIN).

      ```sql
      SELECT c.nombre_cliente
      FROM cliente AS c
      WHERE c.limite_credito > (
          SELECT SUM(cantidad * precio_unidad) AS precio_pagado
          FROM detalle_pedido);
          +----------------+
      | nombre_cliente |
      +----------------+
      | Daniel         |
      | María          |
      | Juan           |
      | Ana            |
      | Carlos         |
      | Laura          |
      | Pedro          |
      | Sofía          |
      | Luis           |
      | Paula          |
      | Javier         |
      | Carmen         |
      | Diego          |
      | Marta          |
      | Pablo          |
      | Elena          |
      | Andrés         |
      | Patricia       |
      | Francisco      |
      | Alejandra      |
      +----------------+
      ```

62. Devuelve el producto que más unidades tiene en stock.

      ```sql
      SELECT p.nombre_producto 
      From producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE stock = (select max(stock) from detalle_producto);
      +-----------------+
      | nombre_producto |
      +-----------------+
      | Corbata         |
      +-----------------+
      ```

      

63. Devuelve el producto que menos unidades tiene en stock.

      ```sql
      SELECT p.nombre_producto 
      From producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE stock = (select min(stock) from detalle_producto);
      +-----------------+
      | nombre_producto |
      +-----------------+
      | Pantalón        |
      +-----------------+
      ```

      

64. Devuelve el nombre, los apellidos y el email de los empleados que están a
               cargo de Alberto Soria.

      ```sql
      SELECT e.nombre_empleado, e.apellido_1, e.apellido_2
      from empleado as e
      WHERE codigo_jefe = (SELECT id from empleado WHERE nombre_empleado = 'Alberto' and apellido_1 = ' Soria');	
      
      
      SELECT e.nombre_empleado, e.apellido_1, e.apellido_2
      from empleado as e
      WHERE codigo_jefe = (SELECT id from empleado WHERE nombre_empleado = 'Eduardo' and apellido_1 = 'Hernández');	
      +-----------------+------------+------------+
      | nombre_empleado | apellido_1 | apellido_2 |
      +-----------------+------------+------------+
      | Juan            | Martínez   | Pérez      |
      | Laura           | Sánchez    | Gómez      |
      | Pedro           | Fernández  | Torres     |
      | Sofía           | Ruiz       | Vázquez    |
      | Luis            | Martínez   | González   |
      +-----------------+------------+------------+
      ```

      

        ###        Subconsultas con ALL y ANY

65. Devuelve el nombre del cliente con mayor límite de crédito.

      ```sql
      SELECT nombre_cliente
      FROM cliente
      WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);
      +----------------+
      | nombre_cliente |
      +----------------+
      | Alejandra      |
      +----------------+
      ```

      

66. Devuelve el nombre del producto que tenga el precio de venta más caro.

      ```sql
      SELECT p.nombre_producto
      FROM producto as p
      INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
      WHERE precio_venta >= ALL (SELECT precio_venta FROM detalle_producto);
      +-----------------+
      | nombre_producto |
      +-----------------+
      | Zapatos         |
      +-----------------+
      ```

      

67. Devuelve el producto que menos unidades tiene en stock.

      ```sql
      SELECT p.nombre_producto
      FROM producto as p
      INNER JOIN detalle_producto as dp on p.id = dp.id_producto
      WHERE stock <= ALL (SELECT stock FROM detalle_producto);
      +-----------------+
      | nombre_producto |
      +-----------------+
      | Pantalón        |
      +-----------------+
      ```

      

        ###     Subconsultas con IN y NOT IN

68. Devuelve el nombre, apellido1 y cargo de los empleados que no
            representen a ningún cliente.

      ```sql
      SELECT nombre_empleado, apellido_1, id_puesto
      FROM empleado
      WHERE id NOT IN (SELECT rep_ventas_id FROM cliente WHERE rep_ventas_id IS NOT NULL);
      +-----------------+------------+-----------+
      | nombre_empleado | apellido_1 | id_puesto |
      +-----------------+------------+-----------+
      | Eduardo         | Hernández  |         1 |
      | Luis            | Martínez   |         9 |
      +-----------------+------------+-----------+
      ```

      

69. Devuelve un listado que muestre solamente los clientes que no han
            realizado ningún pago.

      ```sql
      SELECT c.nombre_cliente
      FROM cliente c
      WHERE c.id NOT IN (
          SELECT fpc.id_cliente
          FROM forma_pago_cliente fpc
          INNER JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
      );
      +----------------+
      | nombre_cliente |
      +----------------+
      | Laura          |
      | Pedro          |
      | Sofía          |
      | Luis           |
      | Paula          |
      | Javier         |
      | Carmen         |
      | Diego          |
      | Marta          |
      | Pablo          |
      | Elena          |
      | Andrés         |
      | Patricia       |
      | Francisco      |
      | Alejandra      |
      +----------------+
      ```

      

70. Devuelve un listado que muestre solamente los clientes que sí han realizado
            algún pago.

      ```sql
      SELECT c.nombre_cliente
      FROM cliente c
      WHERE c.id IN (
          SELECT fpc.id_cliente
          FROM forma_pago_cliente fpc
          INNER JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
      );
      +----------------+
      | nombre_cliente |
      +----------------+
      | Daniel         |
      | María          |
      | Juan           |
      | Ana            |
      | Carlos         |
      +----------------+
      ```

      

71. Devuelve un listado de los productos que nunca han aparecido en un
            pedido.

      ```sql
      SELECT nombre_producto
      FROM producto
      WHERE id NOT IN (
          SELECT detalle_producto_id
          FROM detalle_pedido
      );
      
      ```

      

72. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
            empleados que no sean representante de ventas de ningún cliente.

      ```sql
      SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, p.nombre_puesto, te.numero
      FROM empleado e
      INNER JOIN puesto p ON e.id_puesto = p.id
      LEFT JOIN telefono_empleado te ON e.id = te.empleado_id
      WHERE e.id NOT IN (
          SELECT rep_ventas_id
          FROM cliente
          WHERE rep_ventas_id IS NOT NULL
      );
      +-----------------+------------+------------+------------------+---------+
      | nombre_empleado | apellido_1 | apellido_2 | nombre_puesto    | numero  |
      +-----------------+------------+------------+------------------+---------+
      | Eduardo         | Hernández  | López      | Director General | 5551234 |
      | Luis            | Martínez   | González   | Asesor Comercial | 5558765 |
      +-----------------+------------+------------+------------------+---------+
      ```

      

73. Devuelve las oficinas donde no trabajan ninguno de los empleados que
            hayan sido los representantes de ventas de algún cliente que haya realizado
            la compra de algún producto de la gama Frutales.

      ```sql
      	select o.nombre_oficina 
      	from oficina as o
      	
      ```

      
    
74. Devuelve un listado con los clientes que han realizado algún pedido pero no
            han realizado ningún pago.

      ```sql
      SELECT c.nombre_cliente
      FROM cliente c
      INNER JOIN pedido p ON c.id = p.id_cliente
      LEFT JOIN transaccion t ON p.id = t.id_forma_pago_cliente
      WHERE t.id IS NULL;
      
      ```

      

## Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```sql
    SELECT nombre_cliente
    FROM cliente 
    WHERE NOT EXISTS (SELECT id_cliente 
          FROM forma_pago_cliente);
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```sql
    SELECT nombre_cliente
    FROM cliente 
    WHERE EXISTS (SELECT id_cliente 
          FROM forma_pago_cliente);
          +----------------+
    | nombre_cliente |
    +----------------+
    | Daniel         |
    | María          |
    | Juan           |
    | Ana            |
    | Carlos         |
    | Laura          |
    | Pedro          |
    | Sofía          |
    | Luis           |
    | Paula          |
    | Javier         |
    | Carmen         |
    | Diego          |
    | Marta          |
    | Pablo          |
    | Elena          |
    | Andrés         |
    | Patricia       |
    | Francisco      |
    | Alejandra      |
    +----------------+
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```sql
    SELECT nombre_producto
    FROM producto
    WHERE NOT EXISTS (SELECT id_producto 
                    FROM detalle_producto);
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido
    alguna vez.

    ```sql
    SELECT nombre_producto
    FROM producto
    WHERE EXISTS (SELECT id_producto 
                    FROM detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | Camisa          |
    | Pantalón        |
    | Zapatos         |
    | Corbata         |
    | Bolso           |
    +-----------------+
    ```

    

    ## Consultas varidadas

22. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
      pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
      han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente as cliente, COUNT(p.id) as 'Numero de pedidos'
   FROM cliente as c
   LEFT JOIN pedido as p ON c.id = p.id_cliente
   GROUP BY c.nombre_cliente;
   +-----------+-------------------+
   | cliente   | Numero de pedidos |
   +-----------+-------------------+
   | Daniel    |                 1 |
   | María     |                 1 |
   | Juan      |                 1 |
   | Ana       |                 1 |
   | Carlos    |                 1 |
   | Laura     |                 0 |
   | Pedro     |                 0 |
   | Sofía     |                 0 |
   | Luis      |                 0 |
   | Paula     |                 0 |
   | Javier    |                 0 |
   | Carmen    |                 0 |
   | Diego     |                 0 |
   | Marta     |                 0 |
   | Pablo     |                 0 |
   | Elena     |                 0 |
   | Andrés    |                 0 |
   | Patricia  |                 0 |
   | Francisco |                 0 |
   | Alejandra |                 0 |
   +-----------+-------------------+
   ```

   

23. Devuelve un listado con los nombres de los clientes y el total pagado por
      cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
      realizado ningún pago.

   ```sql
   SELECT c.nombre_cliente, SUM(dp.cantidad * dp.precio_unidad) as 'Total pagado'
   FROM cliente as c
   LEFT JOIN pedido as pe ON c.id = pe.id_cliente
   INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
   GROUP BY c.nombre_cliente;
   +----------------+--------------+
   | nombre_cliente | Total pagado |
   +----------------+--------------+
   | Daniel         |           90 |
   | María          |          105 |
   | Juan           |           65 |
   | Ana            |          220 |
   | Carlos         |           75 |
   +----------------+--------------+
   ```

   

24. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
      ordenados alfabéticamente de menor a mayor.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente as c
   INNER JOIN pedido as p ON c.id = p.id_cliente
   WHERE YEAR(fecha_pedido) = '2008'
   ORDER BY c.nombre_cliente ASC;
   ```

   

25. Devuelve el nombre del cliente, el nombre y primer apellido de su
      representante de ventas y el número de teléfono de la oficina del
      representante de ventas, de aquellos clientes que no hayan realizado ningún
      pago.

   ```sql
   SELECT c.nombre_cliente as cliente, e.nombre_empleado, e.apellido_1, tel_of.numero as 'Numero oficina'
   FROM cliente as c
   INNER JOIN empleado as e ON c.rep_ventas_id = e.id
   INNER JOIN telefono_oficina as tel_of ON e.oficina_id = tel_of.oficina_id
   LEFT JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
   WHERE fpc.id_cliente is null;
   ```

   

26. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
      nombre y primer apellido de su representante de ventas y la ciudad donde
      está su oficina.

   ```sql
   SELECT c.nombre_cliente,  e.nombre_empleado, e.apellido_1, ci.nombre_ciudad
   FROM cliente as c
   INNER JOIN empleado as e ON c.rep_ventas_id = e.id
   INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
   INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id;
   +----------------+-----------------+------------+---------------+
   | nombre_cliente | nombre_empleado | apellido_1 | nombre_ciudad |
   +----------------+-----------------+------------+---------------+
   | Diego          | María           | García     | Málaga        |
   | Pablo          | María           | García     | Málaga        |
   | Carmen         | Juan            | Martínez   | Barcelona     |
   | Alejandra      | Juan            | Martínez   | Barcelona     |
   | Laura          | Laura           | Sánchez    | Madrid        |
   | Sofía          | Carlos          | Rodríguez  | Valencia      |
   | Luis           | Carlos          | Rodríguez  | Valencia      |
   | Javier         | Carlos          | Rodríguez  | Valencia      |
   | Andrés         | Carlos          | Rodríguez  | Valencia      |
   | Patricia       | Carlos          | Rodríguez  | Valencia      |
   | Juan           | Ana             | López      | Vigo          |
   | Ana            | Ana             | López      | Vigo          |
   | Elena          | Ana             | López      | Vigo          |
   | Marta          | Pedro           | Fernández  | Bilbao        |
   | Daniel         | Sofía           | Ruiz       | Valladolid    |
   | María          | Sofía           | Ruiz       | Valladolid    |
   | Carlos         | Paula           | Gómez      | Zaragoza      |
   | Pedro          | Paula           | Gómez      | Zaragoza      |
   | Paula          | Paula           | Gómez      | Zaragoza      |
   | Francisco      | Paula           | Gómez      | Zaragoza      |
   +----------------+-----------------+------------+---------------+
   ```

   

27. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
      empleados que no sean representante de ventas de ningún cliente.

   ```sql
   SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, pues.nombre_puesto, tel_of.numero
   FROM empleado as e
   INNER JOIN puesto as pues ON e.id_puesto = pues.id
   INNER JOIN telefono_oficina as tel_of ON e.oficina_id = tel_of.oficina_id
   LEFT JOIN cliente as c on e.id = c.rep_ventas_id
   WHERE c.rep_ventas_id is null;
   +-----------------+------------+------------+------------------+------------+
   | nombre_empleado | apellido_1 | apellido_2 | nombre_puesto    | numero     |
   +-----------------+------------+------------+------------------+------------+
   | Eduardo         | Hernández  | López      | Director General | 1234567890 |
   | Luis            | Martínez   | González   | Asesor Comercial | 2222222222 |
   +-----------------+------------+------------+------------------+------------+
   ```

   

28. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
      número de empleados que tiene.

   ```sql
   SELECT ci.nombre_ciudad, COUNT(e.id) as 'Cantidad empleados'
   FROM empleado as e
   INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
   INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
   GROuP BY ci.nombre_ciudad;
   +---------------+--------------------+
   | nombre_ciudad | Cantidad empleados |
   +---------------+--------------------+
   | Sevilla       |                  1 |
   | Málaga        |                  1 |
   | Barcelona     |                  1 |
   | Madrid        |                  1 |
   | Valencia      |                  1 |
   | Vigo          |                  1 |
   | Bilbao        |                  1 |
   | Valladolid    |                  1 |
   | Toledo        |                  1 |
   | Zaragoza      |                  1 |
   +---------------+--------------------+
   ```

   # PROCEDIMIENTOS ALMACENADOS

1. Registrar cliente.

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCliente $$
CREATE PROCEDURE registrarCliente(
    IN nombre_cliente VARCHAR(50),
    IN apellido_1_cliente VARCHAR(50),
    IN apellido_2_cliente VARCHAR(50),
    IN rep_ventas_id INT,
    IN limite_credito DECIMAL(10,0)
)
BEGIN 
    INSERT INTO cliente (nombre_cliente, apellido_1_cliente, apellido_2_cliente, rep_ventas_id, limite_credito) 
    VALUES (nombre_cliente, apellido_1_cliente, apellido_2_cliente, rep_ventas_id, limite_credito);
END $$
DELIMITER ;
CALL registrarCliente ('Felipe', 'Mendoza', 'Pineda', 9, 10000);
```

2. Registrar dirección del cliente.

   ```sql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS registrarDireccionCliente $$
   CREATE PROCEDURE registrarDireccionCliente(
       IN  linea_1 VARCHAR(50),
       IN  linea_2 VARCHAR(50),
       IN  codigo_postal INT,
       IN  ciudad_id INT,
       IN  cliente_id INT
   )
   BEGIN 
       INSERT INTO direccion_cliente (linea_1,  linea_2, codigo_postal, ciudad_id,  cliente_id) 
       VALUES (linea_1,  linea_2, codigo_postal, ciudad_id,  cliente_id);
   END $$
   DELIMITER ;
   CALL registrarDireccionCliente ('Cuadrada 63b', '208_265', 68001, 5, 21);
   
   
   ```

   3. Registrar telefono del cliente

      ```sql
      DELIMITER $$
      DROP PROCEDURE IF EXISTS registrarTELCliente $$
      CREATE PROCEDURE registrarTELCliente(
          IN  cliente_id INT,
          IN  tipo_telefono_id INT,
          IN  numero INT,
          IN  fax VARCHAR(20)
      )
      BEGIN 
          INSERT INTO telefono_cliente (cliente_id,  tipo_telefono_id, numero, fax) 
          VALUES (cliente_id,  tipo_telefono_id, numero, fax);
      END $$
      DELIMITER ;
      CALL registrarTELCliente (21, 1, 316588090, 784555);
      
      
      
      ```

      4. Modificar un empleado.

         ```sql
         DELIMITER $$
         DROP PROCEDURE IF EXISTS modificarNombreyApellidosEmpleado $$
         CREATE PROCEDURE modificarNombreyApellidosEmpleado(
             IN in_id INT,
             IN in_nombre_empleado VARCHAR(50),
             IN in_apellido_1 VARCHAR(50),
             IN in_apellido_2 VARCHAR(50) 
         )
         BEGIN 
             UPDATE empleado
             SET nombre_empleado = in_nombre_empleado,
                 apellido_1 = in_apellido_1,
                 apellido_2 = in_apellido_2
             WHERE id = in_id;
         END $$
         DELIMITER ;
         
         CALL modificarNombreyApellidosEmpleado(8, 'Felipe', 'Mendoza', 'Pineda');
         ```

         5. Eliminar una gama

            ```sql
            DELIMITER $$
            DROP PROCEDURE IF EXISTS ElimnarGama $$
            CREATE PROCEDURE ElimnarGama(
                IN in_id INT
            )
            BEGIN 
                DELETE  FROM gama
                WHERE id = in_id;
            END $$
            DELIMITER ;
            CALL ElimnarGama(6);
            ```

            6. Modifica nombre de gama

            ```sql
            DELIMITER $$
            DROP PROCEDURE IF EXISTS modificarNombreGama $$
            CREATE PROCEDURE modificarNombreGama(
                IN in_id INT,
                IN  in_descripcion_texto text
            )
            BEGIN 
                UPDATE gama
                SET descripcion_texto = in_descripcion_texto
                WHERE id = in_id;
            END $$
            DELIMITER ;
            CALL modificarNombreGama(7, 'Mecánica');
            ```

            7. Renombrar puesto.

               ```sql
               DELIMITER $$
               DROP PROCEDURE IF EXISTS modificarPuesto $$
               CREATE PROCEDURE modificarPuesto(
                   IN in_id INT,
                   IN  in_nombre_puesto VARCHAR(20)
               )
               BEGIN 
                   UPDATE puesto
                   SET nombre_puesto = in_nombre_puesto
                   WHERE id = in_id;
               END $$
               DELIMITER ;
               CALL modificarPuesto(10, 'Técnico Auxiliar');
               ```

            8. Crear nuevo puesto.

               ```sql
               DELIMITER $$
               DROP PROCEDURE IF EXISTS CrearPuesto $$
               CREATE PROCEDURE CrearPuesto (
                   IN in_nombre_puesto VARCHAR(50)
               )
               BEGIN 
                   INSERT INTO puesto (nombre_puesto) VALUES (in_nombre_puesto);
               END $$
               DELIMITER ;
               
               
               CALL modificarPuesto(null, 'TProfesional Auxiliar');
               ```

               

         

   # VISTAS

   Vista para ver cantidad de clientes por ciudad.

```sql
CREATE VIEW filtarCantidaClientesPais as
SELECT ci.nombre_ciudad, COUNT(c.id) as 'Cantidad de clientes'
FROM cliente as c
INNER JOIN direccion_cliente as d_c on c.id = d_c.cliente_id
INNER JOIN ciudad as ci ON d_c.ciudad_id = ci.id
GROUP BY ci.nombre_ciudad;

SELECT * from (filtarCantidaClientesPais);
+----------------------------+----------------------+
| nombre_ciudad              | Cantidad de clientes |
+----------------------------+----------------------+
| Sevilla                    |                    2 |
| Málaga                     |                    1 |
| Mérida                     |                    2 |
| Melilla                    |                    1 |
| Barcelona                  |                    1 |
| Madrid                     |                    1 |
| Valencia                   |                    1 |
| Vigo                       |                    1 |
| Bilbao                     |                    1 |
| Valladolid                 |                    1 |
| Toledo                     |                    1 |
| Zaragoza                   |                    1 |
| Palma de Mallorca          |                    1 |
| Las Palmas de Gran Canaria |                    1 |
| Oviedo                     |                    1 |
| Santander                  |                    1 |
+----------------------------+----------------------+
```

Devuelve un listado que muestre el nombre de cada empleados, el nombre
       de su jefe y el nombre del jefe de sus jefe.

```sql
CREATE VIEW clientesYsusRepresentantes as 
SELECT e.nombre_empleado AS empleado, j.nombre_empleado AS jefe
FROM empleado AS e
LEFT JOIN empleado AS j ON e.codigo_jefe = j.id;
SELECT * from (clientesYsusRepresentantes);
+----------+---------+
| empleado | jefe    |
+----------+---------+
| Eduardo  | NULL    |
| María    | NULL    |
| Juan     | Eduardo |
| Laura    | Eduardo |
| Carlos   | María   |
| Ana      | María   |
| Pedro    | Eduardo |
| Sofía    | Eduardo |
| Luis     | Eduardo |
| Paula    | María   |
+----------+---------+
```

Devuelve un listado de las diferentes gamas de producto que ha comprado
    cada cliente.

```sql
CREATE VIEW gamasCompradasClientes as
SELECT  c.nombre_cliente as cliente, g.descripcion_texto as gama
from cliente as c
INNER JOIN pedido as pe ON c.id = pe.id_cliente
INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
INNER JOIN detalle_producto as dpt ON dp.detalle_producto_id = dpt.id 
INNER JOIN gama as g ON dpt.id_gama = g.id;
SELECT * from (gamasCompradasClientes);
```

Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
       representantes junto con la ciudad de la oficina a la que pertenece el
       representante.

```sql
CREATE VIEW pagosCLlientesRepresentanteOficina as
SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado, o.nombre_oficina AS oficina
FROM cliente AS c
INNER JOIN pedido AS pe ON c.id = pe.id_cliente
INNER JOIN empleado AS e ON c.rep_ventas_id = e.id
INNER JOIN oficina AS o ON e.oficina_id = o.id
WHERE pe.id_cliente is NOT NULL;
SELECT * FROM (pagosCLlientesRepresentanteOficina);
+---------+----------+-----------------------+
| cliente | empleado | oficina               |
+---------+----------+-----------------------+
| Daniel  | Sofía    | Oficina de Desarrollo |
| María   | Sofía    | Oficina de Desarrollo |
| Juan    | Ana      | Sede Regional Norte   |
| Ana     | Ana      | Sede Regional Norte   |
| Carlos  | Paula    | Sede Administrativa   |
+---------+----------+-----------------------+
```

Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
        empleados que no sean representante de ventas de ningún cliente.

```sql
CREATE VIEW  empleadosNoRepresentantes as
SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, p.nombre_puesto, te.numero
FROM empleado e
INNER JOIN puesto p ON e.id_puesto = p.id
LEFT JOIN telefono_empleado te ON e.id = te.empleado_id
WHERE e.id NOT IN (
    SELECT rep_ventas_id
    FROM cliente
    WHERE rep_ventas_id IS NOT NULL
);
SELECT nombre_empleado, apellido_1, apellido_2, nombre_puesto, numero from (empleadosNoRepresentantes);
+-----------------+------------+------------+------------------+---------+
| nombre_empleado | apellido_1 | apellido_2 | nombre_puesto    | numero  |
+-----------------+------------+------------+------------------+---------+
| Eduardo         | Hernández  | López      | Director General | 5551234 |
| Luis            | Martínez   | González   | Asesor Comercial | 5558765 |
+-----------------+------------+------------+------------------+---------+
```

Devuelve el producto que menos unidades tiene en stock.

```sql
CREATE VIEW productoMenosStock as 
SELECT p.nombre_producto
FROM producto as p
INNER JOIN detalle_producto as dp on p.id = dp.id_producto
WHERE stock <= ALL (SELECT stock FROM detalle_producto);
SELECT nombre_producto from (productoMenosStock);
+-----------------+
| nombre_producto |
+-----------------+
| Pantalón        |
+-----------------+
```

Devuelve un listado indicando todas las ciudades donde hay oficinas y el
  número de empleados que tiene.

```sql
CREATE VIEW CiudadConOficinaEmpleados as
SELECT ci.nombre_ciudad, COUNT(e.id) as 'Cantidad empleados'
FROM empleado as e
INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
GROuP BY ci.nombre_ciudad;
select * from (CiudadConOficinaEmpleados);
+---------------+--------------------+
| nombre_ciudad | Cantidad empleados |
+---------------+--------------------+
| Sevilla       |                  1 |
| Málaga        |                  1 |
| Barcelona     |                  1 |
| Madrid        |                  1 |
| Valencia      |                  1 |
| Vigo          |                  1 |
| Bilbao        |                  1 |
| Valladolid    |                  1 |
| Toledo        |                  1 |
| Zaragoza      |                  1 |
+---------------+--------------------+
```

Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

```sql
CREATE VIEW estados as 
SELECT id, estado FROM estado;
select id, estado from (estados);
+----+------------+
| id | estado     |
+----+------------+
|  1 | Pendiente  |
|  2 | En proceso |
|  3 | Enviado    |
|  4 | Entregado  |
|  5 | Rechazado  |
+----+------------+
```

Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

```sql
CREATE VIEW ciudadesConOficinayID as
SELECT o.id as 'codigo oficina', c.nombre_ciudad as ciudad
FROM oficina as o
inner join ciudad as c ON c.id = o.id;
SELECT *from (ciudadesConOficinayID);
+----------------+------------+
| codigo oficina | ciudad     |
+----------------+------------+
|              1 | Sevilla    |
|              2 | Málaga     |
|              3 | Barcelona  |
|              4 | Madrid     |
|              5 | Valencia   |
|              6 | Vigo       |
|              7 | Bilbao     |
|              8 | Valladolid |
|              9 | Toledo     |
|             10 | Zaragoza   |
+----------------+------------+
```

Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

```sql
create view oficinasTelefonos as 
SELECT c.nombre_ciudad as ciudad, t_f.numero as numero
FROM direccion_oficina as d_f
INNER JOIN ciudad as c ON d_f.ciudad_id = c.id
INNER JOIN region as r ON c.region_id = r.id
INNER JOIN pais as p ON r.pais_id = p.id
INNER JOIN telefono_oficina as t_f ON d_f.oficina_id = t_f.oficina_id;	
SELECT * from (oficinasTelefonos);
+------------+------------+
| ciudad     | numero     |
+------------+------------+
| Sevilla    | 1234567890 |
| Málaga     | 9876543210 |
| Barcelona  | 5555555555 |
| Madrid     | 6666666666 |
| Valencia   | 7777777777 |
| Vigo       | 8888888888 |
| Bilbao     | 9999999999 |
| Valladolid | 1111111111 |
| Toledo     | 2222222222 |
| Zaragoza   | 3333333333 |
+------------+------------+
```

