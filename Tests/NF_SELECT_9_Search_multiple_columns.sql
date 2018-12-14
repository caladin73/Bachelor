USE normalform
SET STATISTICS TIME ON
DECLARE @string nvarchar(50)
SET @string = 'name100'

--SELECT 9: Søge i flere kolonner (name, info, materials, itemNumber)
SELECT * FROM (
SELECT g.id_general, p.id_parent, NULL AS id_child, NULL AS id_grandChild, name, info, maintenance, materials, USP, itemNumber
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
UNION
SELECT g.id_general, c.id_parent, c.id_child, NULL AS id_grandChild, cg.name, cg.info, NULL as maintenance, NULL as materials, NULL as USP, NULL as itemNumber
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
		JOIN child c ON c.id_parent=p.id_parent
		JOIN general_information cg ON cg.id_general=c.id_general
UNION
SELECT g.id_general, NULL AS id_parent, gc.id_child, gc.id_grandChild, gcg.name, gcg.info, NULL as maintenance, NULL as materials, NULL as USP, NULL as itemNumber
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
		JOIN child c ON c.id_parent=p.id_parent
		JOIN general_information cg ON cg.id_general=c.id_general
			JOIN grandChild gc ON gc.id_child=c.id_child
			JOIN general_information gcg ON gcg.id_general=gc.id_general
) AS allRecords

--søge parameter
WHERE name LIKE '%'+ @string +'%' OR info LIKE '%'+ @string +'%' OR maintenance LIKE '%'+ @string +'%' OR materials LIKE '%'+ @string +'%' OR itemNumber LIKE '%'+ @string +'%'

SET STATISTICS TIME OFF