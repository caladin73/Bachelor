USE normalform
SET STATISTICS TIME ON
--SELECT 8: Søge i en kolonne (name)
DECLARE @string nvarchar(50)
SET @string = 'name444'
SELECT [id_general]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [normalform].[dbo].[general_information]
  WHERE name LIKE '%'+ @string +'%'
SET STATISTICS TIME OFF