DROP PROCEDURE IF EXISTS CalculatePatientFee;

DELIMITER //
CREATE PROCEDURE CalculatePatientFee(
    IN  p_patient_type VARCHAR(10),
    IN  p_total_cost DECIMAL(18,2),
    OUT p_amount_due DECIMAL(18,2),
    OUT p_message VARCHAR(100)
)
BEGIN
    IF p_total_cost < 0 THEN
        SET p_amount_due = 0;
        SET p_message    = 'Lỗi: Chi phí không hợp lệ';

    ELSEIF p_patient_type = 'BHYT' THEN
        SET p_amount_due = p_total_cost * 0.20;
        SET p_message    = 'Đã tính toán xong';

    ELSEIF p_patient_type = 'VIP' THEN
        SET p_amount_due = p_total_cost * 0.90;
        SET p_message    = 'Đã tính toán xong';

    ELSEIF p_patient_type = 'THUONG' THEN
        SET p_amount_due = p_total_cost * 1.00;
        SET p_message    = 'Đã tính toán xong';

    END IF;
END //
DELIMITER ;
