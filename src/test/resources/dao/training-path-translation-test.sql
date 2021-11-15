delete
from module;

delete
from training_path_translation;

delete
from training_path;

insert into training_path (training_path_id, image_url, training_path_status)
values (100, 'imageUrl 1', false);

INSERT INTO training_path_translation (training_path_translation_id, training_path_title, training_path_description,
                                       capacity, pre_request, language,
                                       training_path_id)
VALUES (1, "Parcours 1", "Parcours 1", "Parcours 1", "Parcours 1", "FR", 100);

INSERT INTO training_path_translation
(training_path_translation_id, training_path_title, training_path_description, capacity, pre_request, language,
 training_path_id)
VALUES (2, "Training Path 1", "Training Path 1", "Training Path 1", "Training Path 1", "EN", 100);