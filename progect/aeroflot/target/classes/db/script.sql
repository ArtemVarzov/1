CREATE SCHEMA `aeroflot` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;


CREATE TABLE `aeroflot`.`pilot`
(
    `id`            INT          NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(60)  NULL,
    `mail`          VARCHAR(100) NULL,
    `telephone`     VARCHAR(60)  NULL,
    `dayofbirthday` VARCHAR(60)  NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_bin;


CREATE TABLE `aeroflot`.`manager`
(
    `id`        INT         NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(60) NULL,
    `telephone` VARCHAR(60) NULL,
    `mail`      VARCHAR(60) NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_bin;


CREATE TABLE `aeroflot`.`plane`
(
    `id`            INT         NOT NULL AUTO_INCREMENT,
    `brand`         VARCHAR(45) NULL,
    `class`         VARCHAR(45) NULL,
    `numberofseats` INT         NULL,
    `planecol`      VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_bin;


CREATE TABLE `aeroflot`.`archive`
(
    `id`         INT NOT NULL AUTO_INCREMENT,
    `id_pilot`   INT NULL,
    `id_manager` INT NULL,
    `id_plane`   INT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_pilot_idx` (`id_pilot` ASC) VISIBLE,
    INDEX `fk_manager_idx` (`id_manager` ASC) VISIBLE,
    INDEX `fk_plane_idx` (`id_plane` ASC) VISIBLE,
    CONSTRAINT `fk_pilot`
        FOREIGN KEY (`id_pilot`)
            REFERENCES `aeroflot`.`pilot` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_manager`
        FOREIGN KEY (`id_manager`)
            REFERENCES `aeroflot`.`manager` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_plane`
        FOREIGN KEY (`id_plane`)
            REFERENCES `aeroflot`.`plane` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_bin;


