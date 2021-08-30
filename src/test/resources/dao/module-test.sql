delete
from module;

delete
from training_path;

insert into training_path (training_path_id, training_path_title, image_url, training_path_description, capacity,
                           training_path_time,
                           pre_request, training_path_status, training_path_language)
values (100, 'Parcours 1', 'imageUrl 1', 'Parcours 1', 'test', 15, 'test', false, 'FR');

insert into module (module_id, module_title, order_on_path, training_path_id)
values (1, 'module 1', 1, 100);
insert into module (module_id, module_title, order_on_path, training_path_id)
values (2, 'module 3', 2, 100);
insert into module (module_id, module_title, order_on_path, training_path_id)
values (3, 'module 3', 3, null);