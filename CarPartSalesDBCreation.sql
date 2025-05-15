#Database Creation with all pk/fk specifications.

CREATE database CarPartSales;
use CarPartSales;
CREATE TABLE `applications` (
    `app_id` int  NOT NULL ,
    `headline` varchar(250)   NULL ,
    `price_usd` int   NULL ,
    `app_register_date` date   NULL ,
    `status_id` int   NULL ,
    `category_id` int   NULL ,
    `vehicle_type_id` int   NULL ,
    `item_condition` varchar(250)   NULL ,
    `insert_date` date   NULL ,
    PRIMARY KEY (
        `app_id`
    )
);

CREATE TABLE `application_status` (
    `id` int   NOT NULL ,
    `status_name` varchar(250)   NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `product_category` (
    `id` int    NOT NULL ,
    `catgory_name` varchar(250)   NULL ,
    `parent_categoty_id` int   NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `vehicle_type` (
    `id` int   NOT NULL ,
    `vehicle_type_name` varchar(250)   NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `vehicles` (
    `id` int   NOT NULL ,
    `model_name` varchar(250)   NULL ,
    `manufacturer_name` varchar(250)   NULL ,
    `vehicle_type_id` int   NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `compatibility` (
    `app_id` int  NOT NULL ,
    `bottom_year` int   NULL ,
    `top_year` int   NULL ,
    `vehicles_id` int   NULL );


ALTER TABLE `applications` ADD CONSTRAINT `fk_applications_status_idd` FOREIGN KEY(`status_id`)
REFERENCES `application_status` (`id`);

ALTER TABLE `applications` ADD CONSTRAINT `fk_applications_category_id` FOREIGN KEY(`category_id`)
REFERENCES `product_category` (`id`);

ALTER TABLE `applications` ADD CONSTRAINT `fk_applications_vehicle_type_id` FOREIGN KEY(`vehicle_type_id`)
REFERENCES `vehicle_type` (`id`);

ALTER TABLE `product_category` ADD CONSTRAINT `fk_product_category_parent_categoty_id` FOREIGN KEY(`parent_categoty_id`)
REFERENCES `product_category` (`id`);

ALTER TABLE `vehicles` ADD CONSTRAINT `fk_vehicles_vehicle_type_id` FOREIGN KEY(`vehicle_type_id`)
REFERENCES `vehicle_type` (`id`);

ALTER TABLE `compatibility` ADD CONSTRAINT `fk_compatibility_app_id` FOREIGN KEY(`app_id`)
REFERENCES `applications` (`app_id`);

ALTER TABLE `compatibility` ADD CONSTRAINT `fk_compatibility_vehicles_id` FOREIGN KEY(`vehicles_id`)
REFERENCES `vehicles` (`id`);
