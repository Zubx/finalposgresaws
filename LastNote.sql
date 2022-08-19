-- Active: 1660546976939@@zubdb.cabyoqiwyaa1.us-west-1.rds.amazonaws.com@5432@postgres@public
ALTER Table productdetails 
    ADD COLUMN lasst BOOLEAN
;

CREATE table store_list 
store_id INTEGER ,
store_name TEXT
;

-- untuk c
SELECT
 distinct store_id,
 store_name
 into store_list
 FROM salesorder
;

DROP TABLE store_list
;



---step 1 (buat table baru, tanpa capek)
CREATE TABLE salesorder_temp (LIKE salesorder);

---step 2
INSERT INTO salesorder_temp
    SELECT *, salesorder_id
	
---buat update ya zub
INSERT INTO productdetails (sku,product_name,product_group,product_etalase,sticker_type)
SELECT sku,product_name,product_group,product_etalase,sticker_type
FROM produksetails_temp

;
--request pak M dari penjualan offline, list invoice dan nama customernya
;
SELECT 
    distinct salesorder_id,
salesorder_no, shipping_full_name, store_name
INTO salesorder_temp3
FROM salesorder
WHERE store_id is NULL
;

--setelah itu, export data dan pakai vlookup ke data Sku dan kita bisa manage 


CREATE Table produksetails_temp (LIKE productdetails);
