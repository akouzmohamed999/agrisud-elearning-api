-- delete
-- from course;
--
-- delete
-- from module;
--
-- delete
-- from training_path;

delete from home_cover_image;
delete from home_cover;
-- delete from training_path;
INSERT INTO home_cover VALUES (1, null, null, 'CAROUSEL');
INSERT INTO home_cover_image VALUES (1, 'http://localhost:3900/s/L75CkXeFPFMpE2S/preview', 1);
INSERT INTO home_cover_image VALUES (2, 'http://localhost:3900/s/2FmTNGBmDtTf2qo/preview', 1);
INSERT INTO home_cover_image VALUES (3, 'http://localhost:3900/s/PQYo8ffT5SE2FG9/preview', 1);

-- TODO: UPDATE DEV DATA
--insert into training_path (image_url, training_path_description, capacity, training_path_time,
--                           pre_request, training_path_status, training_path_language)
--values ('parcours 1', 'imageUrl 1', 'parcours 1', 'test', 15, 'test', false, 'FR');
--insert into training_path (training_path_title, image_url, training_path_description, capacity, training_path_time,
--                           pre_request, training_path_status, training_path_language)
--values ('parcours 2', 'imageUrl 2', 'parcours 1', 'test', 15, 'test', false, 'FR');
--insert into training_path (training_path_title, image_url, training_path_description, capacity, training_path_time,
--                           pre_request, training_path_status, training_path_language)
--values ('parcours 3', 'imageUrl 3', 'parcours 1', 'test', 15, 'test', false, 'EN');

-- insert into training_path (training_path_title, image_url, full_image_path, training_path_description, capacity,
--                            training_path_time,
--                            pre_request, training_path_status, training_path_language)
-- values ('parcours', 'imageUrl', 'imagePath', 'parcours', 'test', 15, 'test',
--         false, 'FR');
-- insert into training_path (training_path_title, image_url, training_path_description, capacity, training_path_time,
--                            pre_request, training_path_status, training_path_language)
-- values ('parcours 2', 'imageUrl 2', 'parcours 1', 'test', 15, 'test', false, 'FR');
-- insert into training_path (training_path_title, image_url, training_path_description, capacity, training_path_time,
--                            pre_request, training_path_status, training_path_language)
-- values ('parcours 3', 'imageUrl 3', 'parcours 1', 'test', 15, 'test', false, 'EN');
--
-- insert into module (module_title, order_on_path, training_path_id)
-- values ('module 1', 1, null);
-- insert into module (module_title, order_on_path, training_path_id)
-- values ('module 3', 2, null);
-- insert into module (module_title, order_on_path, training_path_id)
-- values ('module 3', 3, null);
--
-- insert into course (course_title, course_type, course_language, module_id)
-- values ('course 1', 'PRESENTATION', 'FR', null);
-- insert into course (course_title, course_type, course_language, module_id)
-- values ('course 2', 'VIDEO', 'EN', null);
-- insert into course (course_title, course_type, course_language, module_id)
-- values ('course 3', 'POWER_POINT', 'EN', null);
