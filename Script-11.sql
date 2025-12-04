CREATE TEMPORARY TABLE tbl_menu_temp (
    menu_name VARCHAR(100),
    menu_price DECIMAL(10,2),
    category_code INT
);

INSERT INTO tbl_menu_temp VALUES
('메뉴1', 8000, 1),
('메뉴2', 9000, 2),
('메뉴3', 7500, 1);

DELIMITER $$

DROP PROCEDURE IF EXISTS insert_menu$$

CREATE PROCEDURE insert_menu(
    IN p_name VARCHAR(100), 
    IN p_price DECIMAL(10,2), 
    IN p_category_code INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    -- 메뉴 중복 여부 확인
    SELECT COUNT(*) INTO v_exists 
    FROM tbl_menu 
    WHERE menu_name = p_name;

    IF v_exists = 0 THEN
        INSERT INTO tbl_menu (menu_name, menu_price, category_code, orderable_status)
        VALUES (p_name, p_price, p_category_code, 'Y');
    ELSE
        UPDATE tbl_menu 
        SET menu_price = p_price 
        WHERE menu_name = p_name;
    END IF;
END$$

DELIMITER ;

-- Stored Procedure 호출
CALL insert_menu('새로운메뉴', 8000, 3);
CALL insert_menu('새로운메뉴', 8500, 3);
