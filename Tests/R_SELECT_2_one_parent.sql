USE redundant;
SET STATISTICS TIME ON
--SELECT 2: Vis en bestem parent ud fra id
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
      ,[materials]
      ,[itemNumber]
      ,[USP]
      ,[maintenance]
  FROM [redundant].[dbo].[redundant_table]
  WHERE id = 2;
SET STATISTICS TIME OFF