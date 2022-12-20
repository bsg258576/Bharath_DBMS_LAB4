Create table if not exists supplier (
SUPP_ID INT PRIMARY KEY,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL
);

Create table if not exists customer (
CUS_ID INT PRIMARY KEY,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

Create table if not exists category (
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL
);

Create table if not exists product (
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT, 
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

Create table if not exists supplier_pricing (
PRICING_ID INT PRIMARY KEY,
PRO_ID INT, 
FOREIGN KEY(PRO_ID) REFERENCES product(PRO_ID),
SUPP_ID INT,
FOREIGN KEY(SUPP_ID) REFERENCES supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0
);

Create table if not exists order_ (
ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
PRICING_ID INT,
FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

Create table if not exists rating (
RAT_ID INT PRIMARY KEY,
ORD_ID INT,
FOREIGN KEY(ORD_ID) REFERENCES order_(ORD_ID),
RAT_RATSTARS INT NOT NULL
);

