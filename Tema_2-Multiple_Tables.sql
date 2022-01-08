-- Ejercitación 2
-- Para el siguiente modelo relacional
-- Escriba la siguiente información:

-- Nombre, apellido y cursos que realiza cada estudiante
SELECT e.nombre, e.apellido, c.nombre as 'Curso' FROM estudiante AS e 
INNER JOIN inscripcion AS i on e.legajo = i.ESTUDIANTE_legajo
INNER JOIN curso as c ON i.CURSO_codigo = c.codigo;

-- Nombre, apellido y cursos que realiza cada estudiante, ordenados por el nombre del curso
SELECT e.nombre, e.apellido, c.nombre as 'Curso' FROM estudiante AS e 
INNER JOIN inscripcion AS i on e.legajo = i.ESTUDIANTE_legajo
INNER JOIN curso as c ON i.CURSO_codigo = c.codigo ORDER by c.nombre;

-- Nombre, apellido y cursos que dicta cada profesor
SELECT p.nombre, p.apellido, c.nombre as 'Curso' FROM profesor as p 
INNER JOIN curso AS c ON p.id = c.PROFESOR_id;

-- Nombre, apellido y cursos que dicta cada profesor, ordenados por el nombre del curso
SELECT p.nombre, p.apellido, c.nombre as 'Curso' FROM profesor as p 
INNER JOIN curso AS c ON p.id = c.PROFESOR_id ORDER by c.nombre;

-- Cupo disponible para cada curso (Si el cupo es de 35 estudiantes y hay 5 inscriptos, el cupo disponible será 30)
-- SELECT c.nombre,  (c.cupo - COUNT(i.CURSO_codigo)) AS 'cupo disponible'
-- FROM curso AS c INNER JOIN inscripcion AS i 
-- GROUP BY c.nombre ;
SELECT c.nombre,  (c.cupo - COUNT(*)) AS 'Cupo disponible'
FROM curso AS c INNER JOIN inscripcion AS i 
GROUP BY c.nombre ;

-- Cursos cuyo cupo disponible sea menor a 10
SELECT c.nombre, COUNT(*) AS 'Cupo disponible'
FROM curso AS c INNER JOIN inscripcion AS i 
GROUP BY c.nombre HAVING COUNT(*) < 10;
 
