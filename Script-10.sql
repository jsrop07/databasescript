use menudb;

-- 기존 DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_list$$

-- Stored Procedure 생성
CREATE PROCEDURE get_menu_list()
BEGIN
    SELECT * FROM tbl_menu;
END$$

-- DELIMITER 원래대로 복구
DELIMITER ;

-- 생성된 Stored Procedure 호출
CALL get_menu_list();



-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_by_category$$

-- IN 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_by_category(
	IN p_category_code INT
)
BEGIN
    SELECT * FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 파라미터를 전달하여 Stored Procedure 호출
CALL get_menu_by_category(5);





-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_count_by_category$$

-- OUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_count_by_category(
	IN p_category_code INT, 
    OUT p_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_count FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @menu_count = 0;
CALL get_menu_count_by_category(4, @menu_count);

-- 결과 확인
SELECT @menu_count AS '메뉴 개수';

-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS calculate_price$$

-- INOUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE calculate_price(
	INOUT p_price DECIMAL(10,2), 
    IN p_tax_rate DECIMAL(4,2)
)
BEGIN
    SET p_price = p_price + (p_price * p_tax_rate);
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @price = 10000;
CALL calculate_price(@price, 0.1);

-- 결과 확인
SELECT @price AS '세금 포함 가격';

CREATE TEMPORARY TABLE tbl_menu_temp (
    menu_name VARCHAR(100),
    menu_price DECIMAL(10,2),
    category_code INT
);

INSERT INTO tbl_menu_temp VALUES
('메뉴1', 8000, 1),
('메뉴2', 9000, 2),
('메뉴3', 7500, 1);





-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS insert_menu;

DELIMITER $$

CREATE PROCEDURE insert_menu(
    IN p_name VARCHAR(100), 
    IN p_price DECIMAL(10,2), 
    IN p_category_code INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    -- 메뉴 중복 여부 확인
    SELECT COUNT(*) INTO v_exists FROM tbl_menu WHERE menu_name = p_name;

    IF v_exists = 0 THEN
        -- 메뉴가 없으면 INSERT
        INSERT INTO tbl_menu (menu_name, menu_price, category_code, orderable_status)
        VALUES (p_name, p_price, p_category_code, 'Y');
    ELSE
        -- 메뉴가 있으면 UPDATE
        UPDATE tbl_menu 
        SET menu_price = p_price 
        WHERE menu_name = p_name;
    END IF;
END$$

DELIMITER ;
