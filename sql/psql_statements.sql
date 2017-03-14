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
SELECT * from public.order 
WHERE cast(extract(epoch from now()) AS INTEGER) - cast(extract(epoch from public.order.order_created) AS INTEGER) < 3600;

--5
