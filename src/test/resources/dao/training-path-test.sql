delete
from module;

delete
from training_path;



insert into training_path (training_path_id, training_path_title, image_url, training_path_description, capacity,
                           training_path_time,
                           pre_request, training_path_status, training_path_language)
values (1, 'Parcours 1', 'imageUrl 1', 'Parcours 1', 'test', 15, 'test', false, 'FR');

insert into training_path (training_path_id, training_path_title, image_url, training_path_description, capacity,
                           training_path_time,
                           pre_request, training_path_status, training_path_language)
values (2, 'Parcours 2', 'imageUrl 2', 'Parcours 1', 'test', 15, 'test', false, 'FR');

insert into training_path (training_path_id, training_path_title, image_url, training_path_description, capacity,
                           training_path_time,
                           pre_request, training_path_status, training_path_language)
values (3, 'Parcours 3', 'imageUrl 3', 'Parcours 1', 'test', 15, 'test', false, 'EN');