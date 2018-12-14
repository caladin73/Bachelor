USE normalform
SET STATISTICS TIME ON
--SELECT 7: Hent alle optegnelser ud
SELECT g.id_general, p.id_parent, NULL AS id_child, NULL AS id_grandChild, name, info, img_url, materials, itemNumber, USP, maintenance
FROM general_information g 
	JOIN parent p ON p.id_general=g.id_general
UNION
SELECT g.id_general, c.id_parent, c.id_child, NULL AS id_grandChild, name, info, img_url, NULL AS materials, NULL AS itemNumber, NULL AS USP, NULL AS maintenance
FROM general_information g
	JOIN child c ON c.id_general=g.id_general
UNION
SELECT g.id_general, NULL AS id_parent, gc.id_child, gc.id_grandChild, name, info, img_url, NULL AS materials, NULL AS itemNumber, NULL AS USP, NULL AS maintenance
FROM general_information g
	JOIN grandChild gc ON gc.id_general=g.id_general
SET STATISTICS TIME OFF