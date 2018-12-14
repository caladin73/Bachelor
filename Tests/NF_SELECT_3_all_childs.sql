USE normalform;
SET STATISTICS TIME ON
--SELECT 3: Vis alle child's som høre til en bestemt parent ud fra id_parent
SELECT c.id_parent, c.id_child, c.id_general, g.name, g.info, g.img_url
FROM general_information g
JOIN child c ON c.id_general=g.id_general
WHERE c.id_parent = 1
ORDER BY id_child;
SET STATISTICS TIME OFF
