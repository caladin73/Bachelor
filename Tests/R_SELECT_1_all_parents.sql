USE redundant;
SET STATISTICS TIME ON
--SELECT 1: Vis alle parent's
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
  WHERE id_parent = 1
SET STATISTICS TIME OFF