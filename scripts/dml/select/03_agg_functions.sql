-- 1. Calcular el salario total de todos los cuidadores en el zoológico
-- Utilizando la función SUM() para obtener el total de todos los salarios de los cuidadores
SELECT SUM(SALARIO) AS SALARIO_TOTAL
FROM animals.CUIDADOR;

-- 2. Obtener el salario promedio de los cuidadores agrupados por especialidad
-- Utilizando la función AVG() para calcular el promedio y GROUP BY para agrupar por especialidad
SELECT E.NOMBRE AS ESPECIALIDAD, 
       ROUND(AVG(C.SALARIO), 2) AS SALARIO_PROMEDIO
FROM animals.CUIDADOR C
JOIN animals.ESPECIALIDAD E ON C.IDEspecialidad = E.ID
GROUP BY E.NOMBRE;

-- 3. Contar el número total de animales en cada hábitat
-- Utilizando la función COUNT() para contar los animales y GROUP BY para agrupar por hábitat
SELECT H.NOMBRE AS HABITAT, 
       COUNT(A.ID) AS TOTAL_ANIMALES
FROM animals.ANIMALES A
JOIN animals.HABITAT H ON A.IDHabitat = H.ID
GROUP BY H.NOMBRE;

-- 4. Mostrar la fecha de contratación más antigua y la más reciente de los cuidadores
-- Utilizando las funciones MIN() y MAX() para obtener las fechas de contratación
SELECT MIN(FechaContratacion) AS FECHA_CONTRATACION_MAS_ANTIGUA,
       MAX(FechaContratacion) AS FECHA_CONTRATACION_MAS_RECIENTE
FROM animals.CUIDADOR;
