USE `19_report_service`;
--
DROP TRIGGER IF EXISTS trg_reports_set_completed_on_close;

DELIMITER ~
--
CREATE TRIGGER trg_reports_set_completed_on_close
    BEFORE UPDATE
    ON `reports`
    FOR EACH ROW
BEGIN
    IF NEW.`close_date` IS NOT NULL
        AND (OLD.`close_date` IS NULL OR OLD.`close_date` <> NEW.`close_date`)
    THEN
        SET NEW.`status_id` = (SELECT s.`id`
                               FROM `status` AS s
                               WHERE s.`label` = 'completed'
                               LIMIT 1);
    END IF;
END
--
~

UPDATE `reports`
SET `close_date` = NOW()
WHERE `employee_id` = 5;
