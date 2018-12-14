/*
Insert dummy data script, for Hierarchical Model
1 root record, top node 
10 parent records
100 child records
1000 grand child records
total records = 1+10+10*100+10*100*1000=1.001.011
*/
USE redundant
DECLARE @p int
DECLARE @c int
DECLARE @gc int
DECLARE @id_parent int
DECLARE @id_child int
DECLARE @info_dummy nvarchar(max)
SET @info_dummy = 'FillDB is a free tool that lets you quickly generate large volumes of custom data in MySql format to use in testing software and populating databases with random data.
Application will try to guess the format of data required based on column names and will generate random names, dates, emails, addresses and more to fill your MySQL database with data.
Just upload you database schema and this unique online service will generate database test data in multiple relational tables with Foreign Key Support.
It can generate unique values, and optional data, populate with values from another table.'

--root, need a root record to bind parent 
INSERT INTO redundant_table(id_parent, name, info, img_url, materials, itemNumber, USP, maintenance)
VALUES(NULL, 'root', 'root', 'root', 'root', 'root', 'root', 'root');

--parent loop
SET @p = 1
WHILE @p <= 10
BEGIN
	INSERT INTO redundant_table(id_parent, name, info, img_url, materials, itemNumber, USP, maintenance)
	VALUES(1, 'parent name' +CAST(@p as nvarchar(10)), @info_dummy + CAST(@p as nvarchar(10)), 
	'parent img_url'+CAST(@p as nvarchar(10)), 'material'+CAST(@p as nvarchar(10)), 'itemNumber'+CAST(@p as nvarchar(10)), 
	'USP'+CAST(@p as nvarchar(10)), 'maintence'+CAST(@p as nvarchar(10)));
		--child loop, no itemNumber, USP and maintanc, use NULL as representation of no data!!!
		SET @c = 1
		SELECT @id_parent = SCOPE_IDENTITY()
		WHILE @c <= 100
		BEGIN
			INSERT INTO redundant_table(id_parent, name, info, img_url)
			VALUES(@id_parent, 'child name' +CAST(@c as nvarchar(10)), @info_dummy + CAST(@c as nvarchar(10)), 'child img_url'+CAST(@c as nvarchar(10)));
				--grand child loop, no itemNumber, USP and maintanc, use NULL as representation of no data!!!
				SET @gc = 1
				SELECT @id_child = SCOPE_IDENTITY()
				WHILE @gc <= 1000
				BEGIN
					INSERT INTO redundant_table(id_parent, name, info, img_url)
					VALUES(@id_child, 'grandChild name' +CAST(@gc as nvarchar(10)), 'grandChild info' + CAST(@gc as nvarchar(10)), 'grandChild img_url'+CAST(@gc as nvarchar(10)));
				SET @gc = @gc + 1
				END
		SET @c = @c + 1
		END
SET @p = @p + 1
END
