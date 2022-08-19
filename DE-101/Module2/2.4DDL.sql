-- -----------------------------------------------------
-- Table product_dim
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product_dim (
  product_id VARCHAR(20) NULL,
  product_name VARCHAR(130) NULL,
  subcategory_name VARCHAR(100) NULL,
  category_name VARCHAR(100) NULL,
  PRIMARY KEY (product_id))
;


-- -----------------------------------------------------
-- Table geo_dim
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS geo_dim (
  geo_id INT NOT NULL,
  city_name VARCHAR(100) NULL,
  state_name VARCHAR(100) NULL,
  region_name VARCHAR(100) NULL,
  country_name VARCHAR(45) NULL,
  postal_code VARCHAR(50) NULL,
  person_name VARCHAR(45) NULL,
  PRIMARY KEY (geo_id))
;


-- -----------------------------------------------------
-- Table customer_dim
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer_dim (
  customer_id VARCHAR(50) NOT NULL,
  customer_name VARCHAR(150) NULL,
  segment_name VARCHAR(50) NULL,
  PRIMARY KEY (customer_id))
;


-- -----------------------------------------------------
-- Table calendar_dim
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS calendar_dim (
  order_date DATE NOT NULL,
  ship_date DATE NOT NULL,
  PRIMARY KEY (order_date, ship_date))
;


-- -----------------------------------------------------
-- Table ship_dim
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ship_dim (
  ship_id INT NOT NULL,
  ship_name VARCHAR(100) NULL,
  PRIMARY KEY (ship_id))
;


-- -----------------------------------------------------
-- Table sale_fact
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sale_fact (
  sale_id INT NOT NULL,
  order_id VARCHAR(14) NULL,
  returned VARCHAR(20) NULL,
  sales DECIMAL NULL,
  quantity DECIMAL NULL,
  discount DECIMAL NULL,
  profit DECIMAL NULL,
  product_id VARCHAR(20) NULL,
  customer_id VARCHAR(50) NULL,
  order_date DATE NULL,
  ship_date DATE NULL,
  ship_id INT NULL,
  geo_id INT NULL,
  PRIMARY KEY (sale_id),
  CONSTRAINT fk_sale_fact_product_dim
    FOREIGN KEY (product_id)
    REFERENCES product_dim (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_fact_customer_dim1
    FOREIGN KEY (customer_id)
    REFERENCES customer_dim (customer_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_fact_calendar_dim1
    FOREIGN KEY (order_date , ship_date)
    REFERENCES calendar_dim (order_date , ship_date)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_fact_ship_dim1
    FOREIGN KEY (ship_id)
    REFERENCES ship_dim (ship_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_fact_geo_dim1
    FOREIGN KEY (geo_id)
    REFERENCES geo_dim (geo_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

