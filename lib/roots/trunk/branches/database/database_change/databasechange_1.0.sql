


CREATE TABLE `users` (
    `id` int(11) NOT NULL,
    `Name` varchar(150) NOT NULL,
    `Email` varchar(150) NOT NULL,
    `telefono` varchar(100) NOT NULL,
    `Password` varchar(150) NOT NULL,
    `fcm_token` varchar(200) NOT NULL,
    `status` int(10) NOT NULL
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- final String? name;
-- final String? password;
-- final List<TermOfServiceResult> termsOfService;
-- final Map<String, String>? additionalSignupData;

-- CREATE TABLE users_singup (
--     `id` int(11) NOT NULL,
--     `name` varchar(150) NOT NULL,
--     `password` varchar(150) NOT NULL,
--     `termsOfService` varchar(200) NOT NULL,
--     `additionalSignupData` varchar(200) NOT NULL,
--     ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--

INSERT INTO public.users_singup(
    id, name, password, "termsOfService", "additionalSignupData")
VALUES (3, 'mm', 'mmjj', '"ff"', '"yyy"');

-- ok
INSERT INTO public.users_singup(
    id, name, password, "termsOfService", "additionalSignupData")
VALUES (4, 'testquesry', 'test@gmail.com', '"ff"', '"yyy"');

-- auto-generated definition
create table users_singup
(
    id                     integer not null,
    name                   varchar,
    password               varchar,
    "termsOfService"       varchar,
    "additionalSignupData" varchar
);


--### Databse sqlite
--E:\Lahat\Projet App\AppBio\workspace_ecobio\ecobioweb\.dart_tool\sqflite_common_ffi\databases\ecobio.db

---create table users( id integer constraint users_data_pk primary key autoincrement,users_data_json JSON,creation_date TEXT,modified_date TEXT))
-- create table users_data_dg_tmp
-- (
-- id              integer
-- constraint users_data_pk
--    primary key autoincrement,
-- users_data_json JSON,
-- creation_date   TEXT,
-- modifiel_date   TEXT
-- );
