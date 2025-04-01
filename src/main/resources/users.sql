create table users
(
    id       serial
        constraint users_pk
            primary key,
    username varchar     not null,
    password varchar(10) not null
);

alter table users
    owner to postgres;
