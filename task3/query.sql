-- a)
select s.srv_id, s.srv_name from servers s
join server_hdd h on s.srv_id=h.srv_id
group by s.srv_id, s.srv_name
having sum(h.hdd_capacity) < 130 and sum(h.hdd_capacity) > 110;

-- b)
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (9, 4, 's4hdd2', 50.0);
INSERT INTO server_hdd (hdd_id, srv_id, hdd_name, hdd_capacity) VALUES (10, 4, 's4hdd2', 50.0);

DELETE FROM server_hdd
WHERE rowid not in
    (SELECT MIN(rowid)
    FROM server_hdd
    GROUP BY srv_id, hdd_name, hdd_capacity);

-- c)
ALTER TABLE server_hdd
ADD CONSTRAINT hdd_unique UNIQUE (hdd_name);

