-- current time
SELECT TIME(NOW());
SELECT CURTIME();
SELECT DATE_FORMAT(NOW(), '%T');
SELECT DATE_FORMAT(NOW(), '%h: %i %s');
SELECT DATE_FORMAT(NOW(), '%H: %I %S');

-- current date
SELECT DATE(NOW());
SELECT CURDATE();
SELECT DATE_FORMAT(NOW(), '%D-%M-%Y');	-- ddth-mmmmm-yyyy
SELECT DATE_FORMAT(NOW(), '%d-%m-%y');	-- dd-mm-yy
SELECT DATE_FORMAT(NOW(), '%D-%b-%Y');	-- ddth-mmm-yyyy
SELECT DATE_FORMAT(NOW(), '%D-%b-%y');	-- ddth-mmm-yy

-- current day of week like as Monday....
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');	-- 'Thursday'
SELECT DATE_FORMAT(NOW(), '%w');	-- 4 means (Thursday)

-- dd:mm:yyyy
SELECT DATE_FORMAT(NOW(), '%d:%m:%Y');

-- monthname dd at 22:00:25
SELECT DATE_FORMAT(NOW(), '%M %D at %T');