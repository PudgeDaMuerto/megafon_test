CREATE TABLE servers (
    srv_id NUMBER(38),
    srv_name VARCHAR2(255) NOT NULL,
    PRIMARY KEY(srv_id)
);

CREATE TABLE server_hdd (
    hdd_id NUMBER(38),
    srv_id NUMBER(38) NOT NULL,
    hdd_name VARCHAR2(255) NOT NULL,
    hdd_capacity NUMERIC(6, 2) NOT NULL,
    PRIMARY KEY(hdd_id),

    CONSTRAINT fk_servers_srv_id
        FOREIGN KEY (srv_id)
            REFERENCES servers(srv_id)
);

CREATE TABLE hdd_monitoring (
    hdd_id NUMBER(38),
    used_space NUMERIC(6, 2),
    formatted_space NUMERIC(6, 2),
    monitoring_date DATE DEFAULT sysdate,

    CONSTRAINT fk_server_hdd_id
        FOREIGN KEY (hdd_id)
            REFERENCES server_hdd(hdd_id)
);