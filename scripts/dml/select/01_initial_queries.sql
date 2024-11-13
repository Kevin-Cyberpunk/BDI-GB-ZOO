--1. Mostrar todos los animales que viven en el habitat Santuario de aves tropical 
SELECT * FROM habitat WHERE nombre LIKE '%aves tropical%';
--2. Mostrar el nombre del cuidador, con el alias cuidador, ordernados afabetticamente
SELECT nombre AS cuidador FROM cuidador ORDER BY nombre ASC;
--3. Mostrar el nombre y el ID de la especie, de los animales que viven en reserva de fauna 
SELECT A.NOMBRE AS ANIMAL,
       H.NOMBRE AS HABITAT
FROM ANIMALES A
LEFT JOIN HABITAT H ON A.IDHABITAT = H.ID;