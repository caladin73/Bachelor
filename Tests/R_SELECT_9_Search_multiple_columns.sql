USE redundant;
SET STATISTICS TIME ON
--SELECT 9: Søge i flere kolonner (name, info, materials, itemNumber)
DECLARE @string nvarchar(50)
SET @string = 'name100'
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
  WHERE name LIKE '%'+ @string +'%' OR info LIKE '%'+ @string +'%' OR 
  maintenance LIKE '%'+ @string +'%' OR materials LIKE '%'+ @string +'%' OR itemNumber LIKE '%'+ @string +'%'
  SET STATISTICS TIME OFF