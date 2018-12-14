--insert script, p,c and gc records in parent, child and grandchild
USE normalform
DECLARE @p int
DECLARE @c int
DECLARE @gc int
DECLARE @id_parent int
DECLARE @id_child int
DECLARE @id_grandChild int
DECLARE @id_general int
DECLARE @info_dummy nvarchar(max)
SET @info_dummy = 'FillDB is a free tool that lets you quickly generate large volumes of custom data in MySql format to use in testing software and populating databases with random data.
Application will try to guess the format of data required based on column names and will generate random names, dates, emails, addresses and more to fill your MySQL database with data.
Just upload you database schema and this unique online service will generate database test data in multiple relational tables with Foreign Key Support.
It can generate unique values, and optional data, populate with values from another table.'

--parent loop, p parent insert
SET @p = 1
WHILE @p <= 10
BEGIN
	INSERT INTO general_information(name, info, img_url)
	VALUES('parent name' +CAST(@p as nvarchar(10)), @info_dummy + CAST(@p as nvarchar(10)),
	 'parent img_url'+CAST(@p as nvarchar(10)));
	SELECT @id_general = SCOPE_IDENTITY()
	INSERT INTO parent(id_general, maintenance, materials, USP, itemNumber)
	VALUES(@id_general, 'maintence' + CAST(@p as nvarchar(10)), 'material' +CAST(@p as nvarchar(10)),
	 'USP'+CAST(@p as nvarchar(10)), 'itemNumber'+CAST(@p as nvarchar(10)));
	SELECT @id_parent = SCOPE_IDENTITY() 
		--child loop, c child inseret in each parent
		SET @c = 1
		WHILE @c <= 100
		BEGIN
			INSERT INTO general_information(name, info, img_url)
			VALUES('child name' +CAST(@c as nvarchar(10)), @info_dummy + CAST(@c as nvarchar(10)), 'child img_url'+CAST(@c as nvarchar(10)));
			SELECT @id_general = SCOPE_IDENTITY()
			INSERT INTO child(id_parent, id_general)
			VALUES(@id_parent, @id_general);
			SELECT @id_child = SCOPE_IDENTITY()
				--grand child loop, gc insert in each child
				SET @gc = 1
				WHILE @gc <= 1000
				BEGIN
					INSERT INTO general_information(name, info, img_url)
					VALUES('grandChild name' +CAST(@gc as nvarchar(10)), 'grandChild url_pdf' + CAST(@gc as nvarchar(10)),
					 'grandChild img_url'+CAST(@gc as nvarchar(10)));
					SELECT @id_general = SCOPE_IDENTITY()
					INSERT INTO grandChild(id_child, id_general)
					VALUES(@id_child, @id_general);
					SET @gc = @gc + 1
				END
		SET @c = @c + 1
		END
SET @p = @p + 1
END

