USE redundant;
SET STATISTICS TIME ON
--SELECT 6: Vis en bestemt grandChild ud fra id
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [redundant].[dbo].[redundant_table]
  WHERE id = 4;
SET STATISTICS TIME OFF