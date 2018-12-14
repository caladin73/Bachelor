USE normalform
--Delete all tables, for easier setup or clean data for new tests
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

CREATE Table parent (
  id_parent int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_general int DEFAULT NULL,
  maintenance nvarchar(50) DEFAULT NULL,
  materials nvarchar(50) DEFAULT NULL,
  USP nvarchar(50) DEFAULT NULL,
  itemNumber nvarchar(50) DEFAULT NULL
)
CREATE Table child (
  id_child int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_parent int DEFAULT NULL,  
  id_general int DEFAULT NULL,
)
CREATE Table grandChild (
  id_grandChild int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_child int DEFAULT NULL,  
  id_general int DEFAULT NULL,
)
CREATE Table general_information (
  id_general int IDENTITY(1,1) NOT NULL PRIMARY KEY,	
  info nvarchar(max) NOT NULL,
  name nvarchar(50) NOT NULL,
  img_url nvarchar(50) NOT NULL
)
ALTER TABLE parent 
  ADD CONSTRAINT FK_parent_general FOREIGN KEY (id_general)
  REFERENCES dbo.general_information (id_general)
  ON DELETE CASCADE
  ON UPDATE CASCADE

  ALTER TABLE child 
  ADD CONSTRAINT FK_child_parent FOREIGN KEY (id_parent)
  REFERENCES dbo.parent (id_parent)
  ON DELETE CASCADE
  ON UPDATE CASCADE

  ALTER TABLE grandChild
  ADD CONSTRAINT FK_grandChild_child FOREIGN KEY (id_child)
  REFERENCES dbo.child (id_child)
  ON DELETE CASCADE
  ON UPDATE CASCADE