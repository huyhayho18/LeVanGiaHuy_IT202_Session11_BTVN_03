DELIMITER //
CREATE PROCEDURE CalculatePatientFee(
    IN  p_patient_type VARCHAR(10),
    IN  p_total_cost DECIMAL(18,2),
    OUT p_amount_due DECIMAL(18,2)
)
BEGIN
    IF p_total_cost < 0 THEN
        SET p_amount_due = 0;
        SELECT 'Lỗi: Chi phí không hợp lệ';
    ELSEIF p_patient_type = 'BHYT' THEN
        SET p_amount_due = p_total_cost * 0.20;
        SELECT 'Đã tính toán xong';
    ELSEIF p_patient_type = 'VIP' THEN
        SET p_amount_due = p_total_cost * 0.90;
        SELECT 'Đã tính toán xong';
    ELSEIF p_patient_type = 'THUONG' THEN
        SET p_amount_due = p_total_cost * 1.00;
        SELECT 'Đã tính toán xong';
    END IF;
END //
DELIMITER ;