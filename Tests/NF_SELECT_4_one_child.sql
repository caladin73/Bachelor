USE normalform;
SET STATISTICS TIME ON
--SELECT 4: Vis en bestemt child ud fra id_child
SELECT c.id_parent, c.id_child, c.id_general, g.name, g.info, g.img_url
FROM general_information g
JOIN child c ON c.id_general=g.id_general
WHERE c.id_child = 1
ORDER BY c.id_child
SET STATISTICS TIME OFF
