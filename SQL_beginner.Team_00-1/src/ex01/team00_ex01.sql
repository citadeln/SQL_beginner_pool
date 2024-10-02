CREATE TABLE IF NOT EXISTS nodes(
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER
);

INSERT INTO nodes(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);


WITH RECURSIVE roads AS (
    (SELECT point1 AS path,
        point1, 
        point2, 
        cost
    FROM nodes
    WHERE point1 = 'a')
    UNION
    (SELECT roads.path || ',' || nodes.point1 AS path,
        nodes.point1, 
        nodes.point2,
        roads.cost + nodes.cost
    FROM roads
        JOIN nodes ON nodes.point1 = roads.point2 
    WHERE path NOT LIKE '%' || nodes.point1 || '%')
    )
SELECT 
    cost AS total_cost,
    '{' || path || ',a}' AS tour 
FROM roads 
WHERE LENGTH(path) = 7
    AND point2 = 'a'
    AND (
        cost = (SELECT cost FROM roads WHERE LENGTH(path) = 7 AND point2 = 'a' ORDER BY cost LIMIT 1)
        OR
        cost = (SELECT cost FROM roads WHERE LENGTH(path) = 7 AND point2 = 'a' ORDER BY cost DESC LIMIT 1)
    )      
ORDER BY total_cost, tour;
