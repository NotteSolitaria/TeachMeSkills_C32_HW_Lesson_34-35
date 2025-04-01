create table logs
(
    id         serial
        constraint logs_pk
            primary key,
    event_type varchar                             not null,
    user_id    integer                             not null,
    event_time timestamp default CURRENT_TIMESTAMP not null,
    comment    text
);

alter table logs
    owner to postgres;

