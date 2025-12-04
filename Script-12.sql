-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS divide_numbers$$

-- 에러 핸들링을 포함한 Stored Procedure 생성
CREATE PROCEDURE divide_numbers(
	IN p_num1 INT, 
	IN p_num2 INT, 
	OUT p_result DECIMAL(10,2)
)
BEGIN
    -- 에러 발생 시 핸들러 정의
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- 에러 발생 시 처리할 내용
        SET p_result = NULL;
        SELECT '에러가 발생했습니다.' AS error_message;
    END;

    -- 0으로 나누기 방지
    IF p_num2 = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0으로 나눌 수 없습니다.';
    ELSE
        -- 정상적으로 나눗셈 계산
        SET p_result = p_num1 / p_num2;
    END IF;
END$$

-- DELIMITER 복구
DELIMITER ;

-- Stored Procedure 호출
CALL divide_numbers(10, 0, @output); -- 0으로 나눔 시도
SELECT @output AS '나눈 결과';

CALL divide_numbers(10, 2, @output); -- 정상 실행
SELECT @output AS '나눈 결과';