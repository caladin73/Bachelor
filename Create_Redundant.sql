USE redundant
--Delete all tables, for easier setup or alter database tables
DECLARE @Sql NVARCHAR(500) DECLARE @Cursor CURSOR

SET @Cursor = CURSOR FAST_FORWARD FOR
SELECT DISTINCT sql = 'ALTER TABLE [' + tc2.TABLE_NAME + '] DROP [' + rc1.CONSTRAINT_NAME + ']'
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc1
LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc2 ON tc2.CONSTRAINT_NAME =rc1.CONSTRAINT_NAME

OPEN @Cursor FETCH NEXT FROM @Cursor INTO @Sql

WHILE (@@FETCH_STATUS = 0)
BEGIN
Exec sp_executesql @Sql
FETCH NEXT FROM @Cursor INTO @Sql
END

CLOSE @Cursor DEALLOCATE @Cursor
GO

EXEC sp_MSforeachtable 'DROP TABLE ?'
GO

/*
Hierarchical Tabel Model
no foreign key
id will have redundant data stored
*/
CREATE Table redundant_table (
  id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_parent int DEFAULT NULL,
  info nvarchar(max) NOT NULL,
  name nvarchar(50) NOT NULL,
  img_url nvarchar(50) NOT NULL,
  materials nvarchar(50) DEFAULT NULL,
  itemNumber nvarchar(50) DEFAULT NULL,
  USP nvarchar(50) DEFAULT NULL,
  maintenance nvarchar(50) DEFAULT NULL
)


