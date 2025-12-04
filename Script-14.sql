--- TRIGGER

use menudb;
-- TBL LOG 테이블 생성
CREATE TABLE tbl_menu_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    menu_code INT,
    menu_name VARCHAR(100),
    action VARCHAR(10),
    action_time DATETIME
);

delimiter $$

DROP TRIGGER IF EXISTS trg_after_menu_insert$$

CREATE TRIGGER trg_after_menu_insert
-- 로그 기록 추가
AFTER INSERT ON tbl_menu
FOR EACH ROW
BEGIN
    -- tbl_menu_log에 로그 기록 추가
    INSERT INTO tbl_menu_log (menu_code, menu_name, action, action_time)
    VALUES (NEW.menu_code, NEW.menu_name, 'INSERT', NOW());
END$$

DELIMITER ;

-- tbl_menu에 새로운 메뉴 추가
INSERT INTO tbl_menu (menu_name, menu_price, category_code, orderable_status)
VALUES ('트리거메뉴', 9000, 2, 'Y');

-- tbl_menu_log에서 로그 확인
SELECT * FROM tbl_menu_log;