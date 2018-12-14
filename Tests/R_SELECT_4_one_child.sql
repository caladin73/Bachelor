USE redundant;
SET STATISTICS TIME ON
--SELECT 4: Vis en bestemt child ud fra id_child
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [redundant].[dbo].[redundant_table]
  WHERE id = 3;
SET STATISTICS TIME OFF