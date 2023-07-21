-- a)
select s.srv_id, s.srv_name from servers s
join server_hdd h on s.srv_id=h.srv_id
group by s.srv_id, s.srv_name
having sum(h.hdd_capacity) < 130 and sum(h.hdd_capacity) > 110;

-- b)
-- Duplicate last rows in server_hdd
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

-- d)
select s4.srv_name,
       s2.hdd_name,
       s2.hdd_capacity,
       LAG(s1.used_space, 1) over (partition by s1.hdd_id order by s1.monitoring_date) as prev,
       s1.used_space,
       s1.monitoring_date
from hdd_monitoring s1
join server_hdd s2
on s1.hdd_id = s2.hdd_id
join (select srv_id, max(hdd_capacity) as hdd_capacity from server_hdd group by srv_id) s3
on s3.srv_id = s2.srv_id
join servers s4
on s2.srv_id = s4.srv_id
where s2.hdd_capacity = s3.hdd_capacity;