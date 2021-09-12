CREATE TABLE user_training_path (
    elearning_user_id varchar(150),
    training_path_id bigint,
    CONSTRAINT fk_elearning_user FOREIGN KEY (elearning_user_id) REFERENCES elearning_user (user_id),
    CONSTRAINT fk_training_path FOREIGN KEY (training_path_id) REFERENCES training_path (training_path_id)
)