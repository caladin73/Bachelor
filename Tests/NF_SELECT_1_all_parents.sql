USE normalform;
SET STATISTICS TIME ON
--SELECT 1: Vis alle parent's
SELECT p.id_parent, p.id_general, p.maintenance, p.materials, p.USP, p.itemNumber, g.name, g.info, g.img_url
FROM general_information g
JOIN parent p ON p.id_general=g.id_general
ORDER BY id_parent;
SET STATISTICS TIME OFF