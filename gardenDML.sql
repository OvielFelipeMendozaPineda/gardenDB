------------------------------------ INSERTS ---------------------------------------
INSERT INTO cliente VALUES ("2", "María", "Gómez", "Martínez", NULL, 2000);
INSERT INTO cliente VALUES ("3", "Juan", "Pérez", "López", NULL, 1800);
INSERT INTO cliente VALUES ("4", "Ana", "Sánchez", "García", NULL, 1700);
INSERT INTO cliente VALUES ("5", "Carlos", "Rodríguez", "Hernández", NULL, 1600);
INSERT INTO cliente VALUES ("6", "Laura", "Fernández", "Díaz", NULL, 1900);
INSERT INTO cliente VALUES ("7", "Pedro", "González", "Ruiz", NULL, 1750);
INSERT INTO cliente VALUES ("8", "Sofía", "Díaz", "Torres", NULL, 1650);
INSERT INTO cliente VALUES ("9", "Luis", "Martínez", "Vázquez", NULL, 1550);
INSERT INTO cliente VALUES ("10", "Paula", "López", "Fernández", NULL, 1850);
INSERT INTO cliente VALUES ("11", "Javier", "Hernández", "Gómez", NULL, 1950);
INSERT INTO cliente VALUES ("12", "Carmen", "Ruiz", "Pérez", NULL, 2100);
INSERT INTO cliente VALUES ("13", "Diego", "Vázquez", "Sánchez", NULL, 2200);
INSERT INTO cliente VALUES ("14", "Marta", "Torres", "Díaz", NULL, 2250);
INSERT INTO cliente VALUES ("15", "Pablo", "Fernández", "González", NULL, 2050);
INSERT INTO cliente VALUES ("16", "Elena", "García", "Martínez", NULL, 2400);
INSERT INTO cliente VALUES ("17", "Andrés", "Mejía", "Sánchez", NULL, 2300);
INSERT INTO cliente VALUES ("18", "Patricia", "Martínez", "López", NULL, 2150);
INSERT INTO cliente VALUES ("19", "Francisco", "López", "Hernández", NULL, 2600);
INSERT INTO cliente VALUES ("20", "Alejandra", "González", "Ruiz", NULL, 2700);




INSERT INTO pais VALUES ("2", "Francia");
INSERT INTO pais VALUES ("3", "Alemania");
INSERT INTO pais VALUES ("4", "Italia");
INSERT INTO pais VALUES ("5", "Reino Unido");
INSERT INTO pais VALUES ("6", "Estados Unidos");
INSERT INTO pais VALUES ("7", "Canadá");
INSERT INTO pais VALUES ("8", "Australia");
INSERT INTO pais VALUES ("9", "Brasil");
INSERT INTO pais VALUES ("10", "Argentina");
INSERT INTO pais VALUES ("11", "México");
INSERT INTO pais VALUES ("12", "Japón");
INSERT INTO pais VALUES ("13", "China");
INSERT INTO pais VALUES ("14", "India");
INSERT INTO pais VALUES ("15", "Rusia");
INSERT INTO pais VALUES ("16", "Corea del Sur");
INSERT INTO pais VALUES ("17", "Sudáfrica");
INSERT INTO pais VALUES ("18", "Chile");
INSERT INTO pais VALUES ("19", "Colombia");
INSERT INTO pais VALUES ("20", "Perú");




INSERT INTO region VALUES ("1", "Andalucía", "1");
INSERT INTO region VALUES ("2", "Cataluña", "1");
INSERT INTO region VALUES ("3", "Madrid", "1");
INSERT INTO region VALUES ("4", "Comunidad Valenciana", "1");
INSERT INTO region VALUES ("5", "Galicia", "1");
INSERT INTO region VALUES ("6", "País Vasco", "1");
INSERT INTO region VALUES ("7", "Castilla y León", "1");
INSERT INTO region VALUES ("8", "Castilla-La Mancha", "1");
INSERT INTO region VALUES ("9", "Aragón", "1");
INSERT INTO region VALUES ("10", "Islas Baleares", "1");
INSERT INTO region VALUES ("11", "Canarias", "1");
INSERT INTO region VALUES ("12", "Asturias", "1");
INSERT INTO region VALUES ("13", "Cantabria", "1");
INSERT INTO region VALUES ("14", "Murcia", "1");
INSERT INTO region VALUES ("15", "Extremadura", "1");
INSERT INTO region VALUES ("16", "La Rioja", "1");
INSERT INTO region VALUES ("17", "Navarra", "1");
INSERT INTO region VALUES ("18", "Ceuta", "1");
INSERT INTO region VALUES ("19", "Melilla", "1");
INSERT INTO region VALUES ("20", "Comunidad Foral de Navarra", "1");




INSERT INTO ciudad VALUES ("1", "Sevilla", "1");
INSERT INTO ciudad VALUES ("2", "Málaga", "1");
INSERT INTO ciudad VALUES ("3", "Barcelona", "2");
INSERT INTO ciudad VALUES ("4", "Madrid", "3");
INSERT INTO ciudad VALUES ("5", "Valencia", "4");
INSERT INTO ciudad VALUES ("6", "Vigo", "5");
INSERT INTO ciudad VALUES ("7", "Bilbao", "6");
INSERT INTO ciudad VALUES ("8", "Valladolid", "7");
INSERT INTO ciudad VALUES ("9", "Toledo", "8");
INSERT INTO ciudad VALUES ("10", "Zaragoza", "9");
INSERT INTO ciudad VALUES ("11", "Palma de Mallorca", "10");
INSERT INTO ciudad VALUES ("12", "Las Palmas de Gran Canaria", "11");
INSERT INTO ciudad VALUES ("13", "Oviedo", "12");
INSERT INTO ciudad VALUES ("14", "Santander", "13");
INSERT INTO ciudad VALUES ("15", "Murcia", "14");
INSERT INTO ciudad VALUES ("16", "Mérida", "15");
INSERT INTO ciudad VALUES ("17", "Logroño", "16");
INSERT INTO ciudad VALUES ("18", "Pamplona", "17");
INSERT INTO ciudad VALUES ("19", "Ceuta", "18");
INSERT INTO ciudad VALUES ("20", "Melilla", "19");




INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Operaciones');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede Principal');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina Central de Ventas');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Innovación');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina Ejecutiva');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede Regional Norte');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro Logístico');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina de Desarrollo');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Servicio al Cliente');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede Administrativa');




INSERT INTO puesto(nombre_puesto) VALUES ('Director General');
INSERT INTO puesto(nombre_puesto) VALUES ('Gerente de Ventas');
INSERT INTO puesto(nombre_puesto) VALUES ('Analista de Marketing');
INSERT INTO puesto(nombre_puesto) VALUES ('Especialista en Recursos Humanos');
INSERT INTO puesto(nombre_puesto) VALUES ('Ingeniero de Desarrollo de Software');
INSERT INTO puesto(nombre_puesto) VALUES ('Contador Financiero');
INSERT INTO puesto(nombre_puesto) VALUES ('Asistente Administrativo');
INSERT INTO puesto(nombre_puesto) VALUES ('Técnico de Soporte Técnico');
INSERT INTO puesto(nombre_puesto) VALUES ('Asesor Comercial');
INSERT INTO puesto(nombre_puesto) VALUES ('Operario de Producción');




INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Electrodomésticos', '<p>Productos electrónicos para el hogar.</p>', 'electrodomesticos.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Electrónica de Consumo', '<p>Dispositivos electrónicos de uso diario.</p>', 'electronica_consumo.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Juguetes', '<p>Productos para el entretenimiento infantil.</p>', 'juguetes.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Artículos Deportivos', '<p>Equipos y accesorios para deportes.</p>', 'deportes.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Hogar y Jardín', '<p>Productos para el hogar y actividades al aire libre.</p>', 'hogar_jardin.jpg');





INSERT INTO proveedor(nombre_proveedor) VALUES ('Electrodomésticos y Más Distribuidores');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Electrónica Innovadora S.A.');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Juguetes Divertidos Ltda.');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Artículos Deportivos Rápido y Fuerte');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Hogar y Jardín Exteriores Inc.');


INSERT INTO estado(estado) VALUES ('Pendiente');
INSERT INTO estado(estado) VALUES ('En proceso');
INSERT INTO estado(estado) VALUES ('Enviado');
INSERT INTO estado(estado) VALUES ('Entregado');
INSERT INTO estado(estado) VALUES ('Rechazado');



INSERT INTO forma_pago(tipo) VALUES ('Transferencia bancaria');
INSERT INTO forma_pago(tipo) VALUES ('Tarjeta de crédito');
INSERT INTO forma_pago(tipo) VALUES ('Cheque');
INSERT INTO forma_pago(tipo) VALUES ('PayPal');
INSERT INTO forma_pago(tipo) VALUES ('Efectivo');


INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Teléfono fijo');
INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Teléfono móvil');
INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Fax');
