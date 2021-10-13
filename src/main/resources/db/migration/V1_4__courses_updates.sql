ALTER TABLE course DROP COLUMN course_language;
ALTER TABLE training_path DROP COLUMN training_path_time;
ALTER TABLE course ADD COLUMN course_hours int;
ALTER TABLE course ADD COLUMN course_minutes int;
ALTER TABLE course ADD COLUMN course_support_url varchar(200);
ALTER TABLE course ADD COLUMN course_support_path varchar(200);
ALTER TABLE module ADD COLUMN module_duration varchar(200);
ALTER TABLE training_path_translation ADD COLUMN training_path_duration varchar(200);

CREATE TABLE user_course_status
(
    user_id varchar(150),
    course_id  bigint,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES elearning_user (user_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES course (course_id)
)