USE normalform;
SET STATISTICS TIME ON
--SELECT 6: Vis en bestemt grandChild ud fra id_grandChild
SELECT gc.id_child, gc.id_grandChild, gc.id_general, g.name, g.info, g.img_url
FROM general_information g
JOIN grandChild gc ON gc.id_general=g.id_general
WHERE gc.id_grandChild = 1
ORDER BY gc.id_grandChild
SET STATISTICS TIME OFF