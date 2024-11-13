--1.INNER JOIN: listar aniamles con el nombre de su cuidador y el habitat en el que viven 
SELECT 	A.NOMBRE AS ANIMAL,
        C.NOMBRE AS CUIDADOR,
		H.NOMBRE AS HABITAT
FROM ANIMALES A
INNER JOIN CUIDADOR C ON A.IDCUIDADOR = C.ID
JOIN HABITAT H ON A.IDHABITAT = H.ID 
--2.LEFT JOIN: listar todos los animales, incluyendo aquellos que no tienen habitat asignado.
SELECT A.NOMBRE AS ANIMAL,
       H.NOMBRE AS HABITAT
FROM ANIMALES A
LEFT JOIN HABITAT H ON A.IDHABITAT = H.ID;
--3..RIGHT JOIN: listar todos los cuidadores y los animales que tienen asignados, incluyendo cuidadores que no tienen animales a su cargo  
SELECT C.NOMBRE AS CUIDADOR,
       A.NOMBRE AS ANIMAL
FROM CUIDADOR C
RIGHT JOIN ANIMALES A ON C.ID = A.IDCUIDADOR;
--4.FULL JOIN: listar todas las especialidades y los cuidadores que las poseen, incluyendo especialidades que no estan asignadas a ningun cuidador y cuidadores sin especialidad
SELECT E.Nombre AS Especialidad,
       C.Nombre AS Cuidador
FROM Especialidad E
FULL JOIN Cuidador C ON E.ID = C.IDEspecialidad;
--5. SELF JOIN - Pares de Animales con el Mismo Cuidador
SELECT 
    A1.Nombre AS Animal1,
    A2.Nombre AS Animal2,
    C.Nombre AS Cuidador
FROM 
    Animales A1
INNER JOIN 
    Animales A2 ON A1.IDCuidador = A2.IDCuidador AND A1.ID < A2.ID
INNER JOIN 
    Cuidador C ON A1.IDCuidador = C.ID;
