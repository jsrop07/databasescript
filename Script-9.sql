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