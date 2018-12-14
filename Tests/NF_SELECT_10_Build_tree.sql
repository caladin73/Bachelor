USE normalform
SET STATISTICS TIME ON
--SELECT 10: Byg hierarkiet med path til endpoint
SELECT * FROM (
SELECT g.id_general, p.id_parent, NULL AS id_child, NULL AS id_grandChild, name, CAST(CONCAT(g.name, ' > ') AS nvarchar(100)) AS Path
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
UNION
SELECT g.id_general, c.id_parent, c.id_child, NULL AS id_grandChild, cg.name, CAST(CONCAT(g.name, ' > ', cg.name) AS nvarchar(100)) AS Path
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
		JOIN child c ON c.id_parent=p.id_parent
		JOIN general_information cg ON cg.id_general=c.id_general
UNION
SELECT g.id_general, NULL AS id_parent, gc.id_child, gc.id_grandChild, gcg.name, CAST(CONCAT(g.name, ' > ', cg.name, ' > ', gcg.name) AS nvarchar(100)) AS Path
FROM general_information g
	JOIN parent p ON p.id_general=g.id_general
		JOIN child c ON c.id_parent=p.id_parent
		JOIN general_information cg ON cg.id_general=c.id_general
			JOIN grandChild gc ON gc.id_child=c.id_child
			JOIN general_information gcg ON gcg.id_general=gc.id_general
) AS allRecords
--ORDER BY LEN(Path), id_parent
SET STATISTICS TIME OFF