-- Objetivo: El objetivo de este ejercicio es poder hacer consultas que obtengan datos en forma agregada.

-- 1. Escriba una consulta para saber cuántos estudiantes son de la carrera Mecánica.
SELECT COUNT(*) FROM estudiantes WHERE carrera = 'Mecánica';

-- 2. Escriba una consulta para saber, de la tabla PROFESOR, el salario mínimo de los profesores nacidos en la década del 80.
SELECT MIN(salario) FROM profesores WHERE fecha_nacimiento BETWEEN '1980-01-01' AND '1989-12-31';

-- 3. Para el siguiente modelo relacional:

-- 4. Escriba las siguientes consultas:
--    Cantidad de pasajeros por país
SELECT pais.name COUNT(*) FROM pasajero NATURAL JOIN pais GROUP BY pais.nombre;

--    Suma de todos los pagos realizados
SELECT SUM(monto) FROM pasajero NATURAL JOIN pago;
-- hay que sumar impuestos?
-- SELECT SUM(monto + impuesto) FROM pasajero NATURAL JOIN pago;

--    Suma de todos los pagos que realizó un pasajero. El monto debe aparecer con dos decimales.
SELECT pasajero.idpasajero ROUND(SUM(monto + impuesto), 2) AS "total de pagos" 
FROM pasajero NATURAL JOIN pago 
GROUP BY pago.idpasajero;

--    Promedio de los pagos que realizó un pasajero.
SELECT pasajero.idpasajero AVG(monto + impuesto) AS "Promedio de pagos" 
FROM pasajero NATURAL JOIN pago 
GROUP BY pago.idpasajero; 
