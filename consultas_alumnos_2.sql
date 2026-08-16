-- SE CAMBIO LA TABLA USADA DE CONSULTAS_ALUMNOS_1, YA QUE SE AGREGÓ EL CAMPO SEXO NO BINARIO

-- 1. Encuentre todos los estudiantes con sexo = No Binario.

SELECT *
FROM alumnos
WHERE sexo = 'No binario';
-- RESULTADO: 1978

-- 2. Encuentre los estudiantes que no tengan correo.

SELECT *
FROM alumnos
WHERE correo IS NULL
   OR correo = '';
-- RESULTADO: 0

-- 3. Muestre los 10 estudiantes de menor edad.

SELECT *
FROM alumnos
ORDER BY fecha_de_nacimiento DESC
LIMIT 10;
-- RESULTADO: 10


-- 4. Muestre los 10 estudiantes de mayor edad.

SELECT *
FROM alumnos
ORDER BY fecha_de_nacimiento ASC
LIMIT 10;
--RESULTADO: 10

-- 5. Muestre el número total de estudiantes con sexo = Mujer.
SELECT COUNT(*) AS total_mujeres
FROM alumnos
WHERE sexo = 'Mujer';
--RESULTADO: 24042

-- 6. Muestre el número total de estudiantes con sexo = Hombre.

SELECT COUNT(*) AS total_hombres
FROM alumnos
WHERE sexo = 'Hombre';
--- RESULTADO: 23980

-- 7. Muestre el número total de estudiantes con sexo = No Binario.

SELECT COUNT(*) AS total_no_binario
FROM alumnos
WHERE sexo = 'No binario';
-- RESULTADO: 1978

-- 8. Muestre todos los estudiantes que tengan un solo nombre.

SELECT *
FROM alumnos
WHERE TRIM(nombre) NOT LIKE '% %';
-- RESULTADO: 50000

-- 9. Muestre los estudiantes ordenados alfabéticamente por el apellido1.
-- Limítelo a 1000 estudiantes.

SELECT *
FROM alumnos
ORDER BY primer_apellido ASC
LIMIT 1000;
-- RESULTADO: 1000

-- 10. Muestre los estudiantes ordenados alfabéticamente por el apellido2.
-- Limítelo a 1000 estudiantes.

SELECT *
FROM alumnos
ORDER BY segundo_apellido ASC NULLS LAST
LIMIT 1000;
--- RESULTADO: 1000