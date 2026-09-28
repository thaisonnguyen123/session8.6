DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100),
    avg_score DECIMAL(3,1)
);

DELIMITER $$

CREATE PROCEDURE sp_classify_student (
    IN in_avg_score DECIMAL(3,1),
    OUT out_classification VARCHAR(20)
)
BEGIN
    DECLARE temp_class VARCHAR(20);

    SET temp_class = (
        CASE
            WHEN in_avg_score >= 8.0 THEN 'Giỏi'
            WHEN in_avg_score >= 6.5 THEN 'Khá'
            WHEN in_avg_score >= 5.0 THEN 'Trung bình'
            ELSE 'Yếu'
        END
    );

    SET out_classification = temp_class;
END $$

DELIMITER ;

SET @result = '';

CALL sp_classify_student(7.8, @result);

SELECT @result AS xep_loai;

