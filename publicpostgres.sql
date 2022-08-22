-- Active: 1660546976939@@zubdb.cabyoqiwyaa1.us-west-1.rds.amazonaws.com@5432@postgres@rawinput

----Step1 create tabel dari seluruh penjualan

--merubah data types karena sebelumnya pakai integer jadi nolak sistemnya
alter Table product_sold 
alter COLUMN sku TYPE TEXT
;


---# kalau aku mau masukin ini, system akan nolak karena produkdetail ada di schema public, bukan di rawdata input
CREATE Table product_details (LIKE productdetails)
;

--- ambil list status pesanan
create Table list_status (
    id SERIAL     ,
    internal_status TEXT
);

DROP TABLE list_status

;
SELECT
distinct internal_status
INTO list_status
FROM product_sold
;

---copy tabel antar schema dengan seluruh data 
CREATE Table produkdetails AS
select
*
from public.productdetails
;

--- delete lasst kolom
ALTER TABLE produkdetails
DROP COLUMN lasst

