delete
from module;

delete
from training_path_translation;

delete
from training_path;

INSERT INTO training_path_translation (training_path_translation_id, training_path_title, training_path_description,
                                       capacity, pre_request, language,
                                       training_path_id)
VALUES (50, "Parcours 1", "Parcours 1", "Parcours 1", "Parcours 1", "FR", null);

insert into module (module_id, module_title, order_on_path, training_path_translation_id)
values (1, 'module 1', 1, 50);

insert into module (module_id, module_title, order_on_path, training_path_translation_id)
values (2, 'module 3', 2, 50);