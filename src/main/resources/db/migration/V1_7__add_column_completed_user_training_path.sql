ALTER TABLE user_training_path ADD CONSTRAINT pk_user_training_path PRIMARY KEY (elearning_user_id, training_path_id);
ALTER TABLE user_training_path ADD training_path_completed boolean DEFAULT false;

ALTER TABLE elearning_user ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;