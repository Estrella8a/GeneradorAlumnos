-- 1. Muestre los estudiantes ordenados de forma alfabética por el nombre.
-- Limítelo a 1000 estudiantes.

SELECT *
FROM alumnos
ORDER BY nombre ASC
LIMIT 1000;

 matricula | primer_apellido | segundo_apellido | nombre | fecha_de_nacimiento |         correo          |    sexo
-----------+-----------------+------------------+--------+---------------------+-------------------------+------------
 23350898  | Winkler         | Nieto            | An     | 1964-01-03          | 23350898@unikino.edu.mx | Mujer
 23343774  | Sommer          | JimÚnez          | An     | 1983-03-31          | 23343774@unikino.edu.mx | Mujer
 23332964  | Meyer           | Flores           | An     | 1994-11-01          | 23332964@unikino.edu.mx | Mujer
 23325161  | Berger          | Calvo            | An     | 1998-06-29          | 23325161@unikino.edu.mx | Mujer
 23346345  | Vogel           | Guerrero         | An     | 1963-12-17          | 23346345@unikino.edu.mx | Hombre
(1000 filas)

-- 2. Encuentre el número de estudiantes que tienen el mismo apellido1
-- y sus incidencias.

SELECT
    primer_apellido,
    COUNT(*) AS incidencias
FROM alumnos
GROUP BY primer_apellido
HAVING COUNT(*) > 1
ORDER BY incidencias DESC, primer_apellido ASC;

 primer_apellido | incidencias
-----------------+-------------
 Zimmermann      |         563
 Berger          |         555
 Kruse           |         550
 Vogel           |         550
 (100 filas)

-- 3. Encuentre el número de estudiantes que tienen el mismo apellido2
-- y sus incidencias.

SELECT
    segundo_apellido,
    COUNT(*) AS incidencias
FROM alumnos
WHERE segundo_apellido IS NOT NULL
  AND segundo_apellido <> ''
GROUP BY segundo_apellido
HAVING COUNT(*) > 1
ORDER BY incidencias DESC, segundo_apellido ASC;

sistema_escolar-# ORDER BY incidencias DESC, segundo_apellido ASC;
 segundo_apellido | incidencias
------------------+-------------
 DÝaz             |         553
 Ramos            |         551
 Bravo            |         548
 Blanco           |         540
 Herrera          |         539
 Calvo            |         533
 Alonso           |         532
 Guerrero         |         530
 GimÚnez          |         527
 DomÝnguez        |         526
 Mu±oz            |         525
 Pardo            |         524
 (100 filas)


-- 4. Encuentre el número de estudiantes que tienen el mismo nombre
-- y sus incidencias.

SELECT
    nombre,
    COUNT(*) AS incidencias
FROM alumnos
GROUP BY nombre
HAVING COUNT(*) > 1
ORDER BY incidencias DESC, nombre ASC;

 nombre | incidencias
--------+-------------
 Sheng  |        1068
 Lian   |         991
 Bo     |         955
 Mei    |         560
 Fan    |         556
 Kang   |         540
 Xue    |         534
 Shen   |         533
 Chu    |         531
 Kou    |         530
 Qiang  |         524
 Xiang  |         524
 (100 filas)


-- 5. Encuentre los homónimos y cuántos son.
-- Aquí consideramos homónimos a quienes comparten nombre,
-- primer apellido y segundo apellido.

SELECT
    nombre,
    primer_apellido,
    segundo_apellido,
    COUNT(*) AS incidencias
FROM alumnos
GROUP BY nombre, primer_apellido, segundo_apellido
HAVING COUNT(*) > 1
ORDER BY incidencias DESC;

 nombre | primer_apellido | segundo_apellido | incidencias
--------+-----------------+------------------+-------------
 Xiang  | Gro▀            | Alonso           |           3
 Min    | K÷nig           | Cordero          |           3
 Lian   | Kruse           | Guerrero         |           3
 Lian   | Engel           | Torres           |           3
 Yun    | Kruse           | Ortiz            |           3
 Fang   | Frank           | Pascual          |           3
 Xian   | Winkler         | Ortiz            |           3
 Qiang  | Mayer           | Navas            |           3
 Cai    | Graf            | MartÝn           |           3
 Zeng   | Maier           | Cßrdenas         |           3
 (1288 filas)


-- 6. Encuentre las personas que nacieron en marzo.

SELECT *
FROM alumnos
WHERE EXTRACT(MONTH FROM fecha_de_nacimiento) = 3;

matricula | primer_apellido | segundo_apellido | nombre | fecha_de_nacimiento |         correo          |    sexo
-----------+-----------------+------------------+--------+---------------------+-------------------------+------------
 23311210  | Schmid          | Romero           | Sheng  | 1976-03-01          | 23311210@unikino.edu.mx | No binario
 23311220  | Werner          | Valero           | Kang   | 1997-03-08          | 23311220@unikino.edu.mx | Hombre
 23311227  | Friedrich       | MartÝnez         | Na     | 1971-03-27          | 23311227@unikino.edu.mx | Mujer
 23311235  | K÷nig           | Santana          | Zuo    | 1981-03-12          | 23311235@unikino.edu.mx | Mujer
 23311237  | Zimmer          | Navarro          | Chu    | 2002-03-02          | 23311237@unikino.edu.mx | Mujer
 23311243  | Schubert        | Moreno           | Jing   | 2001-03-20          | 23311243@unikino.edu.mx | Mujer
 23311258  | Koch            | Aguilar          | He     | 1963-03-08          | 23311258@unikino.edu.mx | Hombre
 23311263  | Meyer           | Flores           | Yong   | 2006-03-22          | 23311263@unikino.edu.mx | Mujer
 23311283  | Schulte         | MartÝn           | Song   | 1996-03-05          | 23311283@unikino.edu.mx | Mujer
 23311326  | Lehmann         | Cßrdenas         | You    | 1964-03-02          | 23311326@unikino.edu.mx | Mujer
 23311366  | Schmidt         | MartÝnez         | Rong   | 1987-03-25          | 23311366@unikino.edu.mx | Mujer
 (4256 filas)

-- 7. Encuentre las personas que nacieron un viernes.

SELECT *
FROM alumnos
WHERE EXTRACT(DOW FROM fecha_de_nacimiento) = 5;

 matricula | primer_apellido | segundo_apellido | nombre | fecha_de_nacimiento |         correo          |    sexo
-----------+-----------------+------------------+--------+---------------------+-------------------------+------------
 23311208  | Schubert        | Sola             | He     | 1995-01-06          | 23311208@unikino.edu.mx | Mujer
 23311214  | Berger          | Sola             | Xiang  | 2002-07-05          | 23311214@unikino.edu.mx | Hombre
 23311217  | Schubert        | Soto             | Sheng  | 1964-02-07          | 23311217@unikino.edu.mx | Hombre
 23311234  | Pfeiffer        | Sßnchez          | Jun    | 1974-10-18          | 23311234@unikino.edu.mx | Hombre
 23311236  | Zimmermann      | RamÝrez          | Mei    | 2002-09-20          | 23311236@unikino.edu.mx | Mujer
 23311238  | Schwarz         | Hidalgo          | Quan   | 1987-06-26          | 23311238@unikino.edu.mx | Hombre
 23311240  | H³bner          | Ochoa            | Zhan   | 1967-05-05          | 23311240@unikino.edu.mx | Hombre
 (7114 filas)

-- 8. Muestre el número de estudiantes con sexo Hombre,
-- Mujer y No binario.

SELECT
    sexo,
    COUNT(*) AS total
FROM alumnos
GROUP BY sexo
ORDER BY sexo;

  sexo    | total
------------+-------
 Hombre     | 23980
 Mujer      | 24042
 No binario |  1978
(3 filas)

-- 9. Encuentre las personas que nacieron en año bisiesto.

SELECT *
FROM alumnos
WHERE (
        EXTRACT(YEAR FROM fecha_de_nacimiento)::INT % 400 = 0
      )
   OR (
        EXTRACT(YEAR FROM fecha_de_nacimiento)::INT % 4 = 0
        AND EXTRACT(YEAR FROM fecha_de_nacimiento)::INT % 100 <> 0
      );

 matricula | primer_apellido | segundo_apellido | nombre | fecha_de_nacimiento |         correo          |    sexo
-----------+-----------------+------------------+--------+---------------------+-------------------------+------------
 23311207  | Haas            | Vargas           | Fan    | 2008-04-12          | 23311207@unikino.edu.mx | Hombre
 23311210  | Schmid          | Romero           | Sheng  | 1976-03-01          | 23311210@unikino.edu.mx | No binario
 23311213  | Beck            | Palacios         | Sheng  | 1980-08-18          | 23311213@unikino.edu.mx | Mujer
 23311215  | Schulte         | L¾pez            | Shao   | 1964-01-25          | 23311215@unikino.edu.mx | Mujer
 23311217  | Schubert        | Soto             | Sheng  | 1964-02-07          | 23311217@unikino.edu.mx | Hombre
 23311219  | Fischer         | Morales          | Yi     | 2008-10-25          | 23311219@unikino.edu.mx | Hombre
 23311221  | Haas            | G¾mez            | Cheng  | 1968-07-23          | 23311221@unikino.edu.mx | Hombre
 23311222  | Brandt          | Vßzquez          | Chu    | 1964-06-14          | 23311222@unikino.edu.mx | No binario
 23311239  | Busch           | Campos           | Cai    | 2000-02-22          | 23311239@unikino.edu.mx | Mujer
 23311249  | Schõfer         | Cßrdenas         | Zhen   | 1968-04-13          | 23311249@unikino.edu.mx | Mujer
 23311255  | Kruse           | Delgado          | Yi     | 2000-01-11          | 23311255@unikino.edu.mx | Mujer
(12646 filas
)
-- 10. Encuentre las personas que nacieron los viernes de enero.

SELECT *
FROM alumnos
WHERE EXTRACT(MONTH FROM fecha_de_nacimiento) = 1
  AND EXTRACT(DOW FROM fecha_de_nacimiento) = 5;

   matricula | primer_apellido | segundo_apellido | nombre | fecha_de_nacimiento |         correo          |    sexo
-----------+-----------------+------------------+--------+---------------------+-------------------------+------------
 23311208  | Schubert        | Sola             | He     | 1995-01-06          | 23311208@unikino.edu.mx | Mujer
 23311278  | Vogel           | DomÝnguez        | Dian   | 1996-01-05          | 23311278@unikino.edu.mx | Mujer
 23311434  | Ludwig          | MartÝn           | Yi     | 1971-01-22          | 23311434@unikino.edu.mx | Hombre
 23311451  | Sommer          | MartÝn           | Bo     | 1999-01-08          | 23311451@unikino.edu.mx | Mujer
 23311469  | Krõmer          | Lozano           | Zuo    | 1965-01-22          | 23311469@unikino.edu.mx | Mujer
 23311471  | Voigt           | Prieto           | Lian   | 1989-01-27          | 23311471@unikino.edu.mx | Hombre
 23311473  | B÷hm            | Cabrera          | Xin    | 1984-01-27          | 23311473@unikino.edu.mx | Hombre
 23311547  | Hofmann         | Palacios         | Quan   | 2005-01-07          | 23311547@unikino.edu.mx | Mujer
 23311739  | Voigt           | Medina           | Yuan   | 1997-01-17          | 23311739@unikino.edu.mx | Mujer
 (627 filas)