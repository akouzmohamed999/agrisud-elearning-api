CREATE TABLE course (
    course_id serial primary key not null,
    course_title varchar(150),
    course_description text
);

CREATE TABLE elearning_user (
    user_id varchar(150) primary key not null,
    user_first_name varchar(100),
    user_last_name varchar(100),
    user_email varchar(100),
    user_birth_date date,
    user_nationality varchar(100),
    user_occupation varchar(100),
    user_organisation varchar(100),
    user_sex varchar(100)
);