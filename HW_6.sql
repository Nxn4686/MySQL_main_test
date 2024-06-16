DROP DATABASE IF EXISTS HW_6;
CREATE DATABASE IF NOT EXISTS HW_6;
USE HW_6;

/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER //
CREATE FUNCTION secconv(num VARCHAR(50))-- количество секунд для вывода 
RETURNS VARCHAR(50) 
DETERMINISTIC 
BEGIN
	DECLARE dd INT;
	DECLARE hh INT;
    DECLARE mm INT; 
    DECLARE ss INT; 
    DECLARE result VARCHAR(50);
    SET dd = num / 86400; -- / 24 / 60 / 60 
	SET num = num % 86400;
	SET hh = num / 3600; 
	SET num = num % 3600; 
	SET mm = num / 60; 
	SET num = num % 60; 
	SET ss = num; 
    SET result = CONCAT(dd, " ", "days", " ", hh, " ", "hours", " ", mm, " ", "minutes", " ", ss, " ", "seconds");
  	RETURN result;
END //
DELIMITER ;

SELECT secconv(123456) AS duration;

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER //
CREATE PROCEDURE chetn(val INT)
BEGIN
	DECLARE i INT DEFAULT 0; 
	DECLARE result VARCHAR(50); 
	SET result=''; 
	WHILE i < val - 1 DO 
	SET i = i + 2; 
	SET result = CONCAT(result, '  ', i); 
	SELECT result AS even_numbers;
    END while;
END // 

CALL chetn(11);
