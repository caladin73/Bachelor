USE redundant;
SET STATISTICS TIME ON
--SELECT 7: Hent alle optegnelser ud
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
SET STATISTICS TIME OFF