INSERT INTO servers (srv_id, srv_name) VALUES (1, 'server1');
INSERT INTO servers (srv_id, srv_name) VALUES (2, 'server2');
INSERT INTO servers (srv_id, srv_name) VALUES (3, 'server3');
INSERT INTO servers (srv_id, srv_name) VALUES (4, 'server4');

INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (1, 1, 's1hdd1', 60.0);
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (2, 1, 's1hdd2', 60.0);

INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (3, 2, 's2hdd1', 70.0);
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (4, 2, 's2hdd2', 55.0);

INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (5, 3, 's3hdd1', 70.0);
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (6, 3, 's3hdd2', 60.0);

INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (7, 4, 's4hdd1', 100.0);
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (8, 4, 's4hdd2', 50.0);

INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (3, 20.0, 50.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (3, 30.0, 40.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (3, 50.0, 20.0);

INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (4, 20.0, 35.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (4, 30.0, 25.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (4, 50.0, 5.0);

INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (5, 20.0, 50.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (5, 30.0, 40.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (5, 50.0, 20.0);

INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (6, 20.0, 40.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (6, 30.0, 30.0);
INSERT INTO hdd_monitoring (hdd_id, used_space, formatted_space) VALUES (6, 50.0, 10.0);