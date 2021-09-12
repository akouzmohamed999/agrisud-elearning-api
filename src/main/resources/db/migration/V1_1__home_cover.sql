CREATE TABLE home_cover (
    home_cover_id          bigint NOT NULL AUTO_INCREMENT,
    home_cover_titre       varchar(120),
    home_cover_description text,
    home_cover_type        varchar(20) not null,
    PRIMARY KEY (home_cover_id)
);

CREATE TABLE home_cover_image (
    home_cover_image_id  bigint NOT NULL AUTO_INCREMENT,
    home_cover_image_url text not null,
    home_cover_id        bigint,
    PRIMARY KEY (home_cover_image_id),
    CONSTRAINT fk_home_cover_image_home_cover FOREIGN KEY (home_cover_id) REFERENCES home_cover (home_cover_id)
);

