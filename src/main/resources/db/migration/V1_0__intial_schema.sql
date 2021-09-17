CREATE TABLE training_path
(
    training_path_id     bigint NOT NULL AUTO_INCREMENT,
    image_url            varchar(200),
    full_image_path      varchar(200),
    training_path_time   int(20),
    training_path_status BOOLEAN,
    archived BOOLEAN,
    PRIMARY KEY (training_path_id)
);

CREATE TABLE training_path_translation
(
    training_path_translation_id bigint NOT NULL AUTO_INCREMENT,
    training_path_title          varchar(100),
    training_path_description    text,
    capacity                     text,
    pre_request                  text,
    language                     varchar(30),
    training_path_id             bigint,
    PRIMARY KEY (training_path_translation_id),
    CONSTRAINT fk_training_path_translation_training_path FOREIGN KEY (training_path_id)
        REFERENCES training_path (training_path_id)
);

CREATE TABLE module
(
    module_id                    bigint NOT NULL AUTO_INCREMENT,
    module_title                 varchar(150),
    order_on_path                int(50),
    training_path_translation_id bigint,
    PRIMARY KEY (module_id),
    CONSTRAINT fk_module_training_path_translation FOREIGN KEY (training_path_translation_id)
        REFERENCES training_path_translation (training_path_translation_id)
);

CREATE TABLE course
(
    course_id       bigint NOT NULL AUTO_INCREMENT,
    course_title    varchar(150),
    course_type     varchar(50),
    course_language varchar(50),
    module_id       bigint,
    PRIMARY KEY (course_id),
    CONSTRAINT fk_course_module FOREIGN KEY (module_id) REFERENCES module (module_id)
);

CREATE TABLE elearning_user
(
    user_id           varchar(150) primary key not null,
    user_first_name   varchar(100),
    user_last_name    varchar(100),
    user_email        varchar(100),
    user_birth_date   date,
    user_nationality  varchar(100),
    user_occupation   varchar(100),
    user_organisation varchar(100),
    user_sex          varchar(100)
);