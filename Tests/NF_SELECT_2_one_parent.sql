USE normalform;
SET STATISTICS TIME ON
--SELECT 2: Vis en bestem parent ud fra id_parent
SELECT p.id_parent, p.id_general, p.maintenance, p.materials, p.USP, p.itemNumber, g.name, g.info, g.img_url
FROM general_information g
JOIN parent p ON p.id_general=g.id_general
WHERE p.id_parent = 1
ORDER BY id_parent;
SET STATISTICS TIME OFF