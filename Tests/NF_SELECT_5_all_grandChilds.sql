USE normalform;
SET STATISTICS TIME ON
--SELECT 5: Vis alle grandChild som høre til en bestem child ud fra id_child
SELECT gc.id_child, gc.id_grandChild, gc.id_general, g.name, g.info, g.img_url
FROM general_information g
JOIN grandChild gc ON gc.id_general=g.id_general
WHERE gc.id_child = 1
ORDER BY gc.id_grandChild
SET STATISTICS TIME OFF