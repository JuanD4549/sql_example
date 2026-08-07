--liquibase formatted sql

--changeset JuanB:1 labels:example-label context:example-context
--comment: example comment
create table TESTQA (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE TESTQA;

--changeset JuanB:2 labels:example-label context:example-context
--comment: example comment
create table TESTQACOMPA (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE TESTQACOMPA;

--changeset other.dev:3 labels:example-label context:example-context
--comment: example comment
alter table TESTQA add column country varchar(2)
--rollback ALTER TABLE TESTQA DROP COLUMN country;

