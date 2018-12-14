USE redundant;
SET STATISTICS TIME ON
--SELECT 8: Søg i en kolonne (name)
DECLARE @string nvarchar(50)
SET @string = 'name444'
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [redundant].[dbo].[redundant_table]
  WHERE name LIKE '%'+ @string +'%'
SET STATISTICS TIME OFF