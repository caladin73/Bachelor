USE redundant;
SET STATISTICS TIME ON
--SELECT 3: Vis alle child's som høre til en bestemt parent ud fra id_parent
SELECT [id]
      ,[id_parent]
      ,[info]
      ,[name]
      ,[img_url]
  FROM [redundant].[dbo].[redundant_table]
  WHERE id_parent = 2;
SET STATISTICS TIME OFF