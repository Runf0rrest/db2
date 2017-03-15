--1
SELECT item_name, category_title
FROM item
INNER JOIN category
ON item.category_id = category.category_id;

--2
SELECT item_name, public.order.order_id
FROM item
INNER JOIN item__order
ON item.item_id = item__order.item_id
INNER JOIN public.order
ON public.order.order_id = item__order.order_id
WHERE public.order.order_id = 1;

--3
SELECT public.order.order_id, item.item_name
FROM public.order
INNER JOIN item__order
ON public.order.order_id = item__order.order_id
INNER JOIN item
ON item__order.item_id = item.item_id
WHERE item_name = 'Axe';

--4
SELECT * FROM public.order
WHERE age(localtimestamp, order_created) < INTERVAL '1 hour';

--5
SELECT * FROM public.order
WHERE order_created > TIMESTAMP 'today';

--6
SELECT * FROM public.order
WHERE TIMESTAMP 'yesterday' <= order_created AND order_created < TIMESTAMP 'today';

--7
SELECT DISTINCT(item_name) FROM public.order
INNER JOIN item__order
ON item__order.order_id = public.order.order_id
INNER JOIN item
ON item.item_id = item__order.item_id
INNER JOIN category
ON category.category_id = item.category_id
WHERE age(localtimestamp, order_created) < INTERVAL '1 hour'
AND category_title = '?';

--8
SELECT DISTINCT(item_name) FROM public.order
INNER JOIN item__order
ON item__order.order_id = public.order.order_id
INNER JOIN item
ON item.item_id = item__order.item_id
INNER JOIN category
ON category.category_id = item.category_id
WHERE order_created > TIMESTAMP 'today'
AND category_title = '?';

--9
SELECT DISTINCT(item_name) FROM public.order
INNER JOIN item__order
ON item__order.order_id = public.order.order_id
INNER JOIN item
ON item.item_id = item__order.item_id
INNER JOIN category
ON category.category_id = item.category_id
WHERE TIMESTAMP 'yesterday' <= order_created AND order_created < TIMESTAMP 'today'
AND category_title = '?';

--10
SELECT * FROM item
WHERE item_name LIKE '?%';

--11
SELECT * FROM item
WHERE item_name LIKE '%?';

--12
SELECT * FROM item
WHERE item_name LIKE '%?%';

--13
SELECT category_title, COUNT(category_title)
FROM item
INNER JOIN category
ON item.category_id = category.category_id
GROUP BY (category_title);

--14
SELECT public.order.order_id, COUNT(public.order.order_id)
FROM public.order
INNER JOIN item__order
ON item__order.order_id = public.order.order_id
INNER JOIN item
ON item.item_id = item__order.item_id
GROUP BY public.order.order_id;


--14
SELECT item_name, COUNT(item_name)
FROM public.order
INNER JOIN item__order
ON item__order.order_id = public.order.order_id
INNER JOIN item
ON item.item_id = item__order.item_id
GROUP BY item_name;