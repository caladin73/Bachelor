USE redundant;
SET STATISTICS TIME ON
--SELECT 5: Vis alle grandChild som høre til en bestem child ud fra id_child
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [redundant].[dbo].[redundant_table]
  WHERE id_parent = 3;
SET STATISTICS TIME OFF