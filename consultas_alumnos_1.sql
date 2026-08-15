-- 1. Estudiantes de 18 años cumplidos a la fecha.

SELECT *
FROM alumnos
WHERE DATE_PART('year', AGE(CURRENT_DATE, fecha_de_nacimiento)) = 18;
-- RESULTADO: 1163

-- 2. Estudiantes de 19 años cumplidos a la fecha.

SELECT *
FROM alumnos
WHERE DATE_PART('year', AGE(CURRENT_DATE, fecha_de_nacimiento)) = 19;
-- RESULTADO: 1059

-- 3. Estudiantes de 20 años cumplidos a la fecha.

SELECT *
FROM alumnos
WHERE DATE_PART('year', AGE(CURRENT_DATE, fecha_de_nacimiento)) = 20;
-- RESULTADO: 966

-- 4. Estudiantes de 21 años cumplidos a la fecha.

SELECT *
FROM alumnos
WHERE DATE_PART('year', AGE(CURRENT_DATE, fecha_de_nacimiento)) = 21;
-- RESULTAO: 1044

-- 5. Estudiantes de 22 años cumplidos a la fecha.

SELECT *
FROM alumnos
WHERE DATE_PART('year', AGE(CURRENT_DATE, fecha_de_nacimiento)) = 22;
-- RESULTADO: 1037

-- 6. Estudiantes más jóvenes.

SELECT *
FROM alumnos
WHERE fecha_de_nacimiento = (
    SELECT MAX(fecha_de_nacimiento)
    FROM alumnos
);
-- RESULTADO: 3

-- 7. Estudiantes de mayor edad inscritos.

SELECT *
FROM alumnos
WHERE fecha_de_nacimiento = (
    SELECT MIN(fecha_de_nacimiento)
    FROM alumnos
);
-- RESULTADO: 1


-- 8. Estudiantes que no tengan segundo apellido.

SELECT *
FROM alumnos
WHERE segundo_apellido IS NULL
   OR segundo_apellido = '';
-- RESULTADO: 0

-- 9. Estudiantes con sexo = Mujer.

SELECT *
FROM alumnos
WHERE sexo = 'Mujer';
-- RESULTADO: 25096

-- 10. Estudiantes con sexo = Hombre.

SELECT *
FROM alumnos
WHERE sexo = 'Hombre';
-- RESULTADO: 24904