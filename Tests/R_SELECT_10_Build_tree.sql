USE redundant
SET STATISTICS TIME ON
--SELECT 10: Byg hierarkiet med path til endpoint
/*
retrieves the whole tree by using recursive CTE in MS SQL 
This recursive CTE consists of three main parts:
	1. Invocation – This is the statement using the CTE.
    2. Anchor Member – This portion executes first, and is only called once.
    3. Recursive Member – The portion of the query is repeatedly executed until no rows are returned. The results of each execution are unioned with the prior results.
    4. Termination Check – The termination check ensures the query stops.
*/
;WITH
	path_cte (id, id_parent, name, path)
	AS
	(
		SELECT id, id_parent, name, CAST(name as nvarchar(100)) AS path --2. Anchor Member 
		FROM redundant_table
		WHERE id_parent IS NULL
	UNION ALL
		SELECT c.id, c.id_parent, c.name, CAST(CONCAT(cp.path, ' > ', c.name) AS nvarchar(100)) AS path --3. Recursive Member
		FROM path_cte AS cp
			INNER JOIN redundant_table AS c ON cp.id = c.id_parent --Termination Check 
	)
SELECT * FROM path_cte
SET STATISTICS TIME OFF