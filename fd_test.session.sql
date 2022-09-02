CREATE EXTENSION IF NOT EXISTS  "uuid-ossp"; 

DROP TABLE IF EXISTS "foods_to_orders";
DROP TABLE IF EXISTS "foods";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "users";

CREATE TABLE "users"(
    "id" SERIAL PRIMARY KEY,
    "firstName" VARCHAR(32) NOT NULL CHECK("firstName" !=''),
    "lastName" VARCHAR(32) NOT NULL CHECK("lastName" !=''),
    "email" VARCHAR(256) NOT NULL  UNIQUE CHECK("email" !=''),
    "isMale" BOOLEAN NOT NULL, 
    "birthday" DATE NOT NULL CHECK("birthday"<current_date),
    "height" NUMERIC (3,2) NOT NULL  CHECK("height">=1.1  AND  "height"<=2.05)

);



CREATE TABLE "foods"(
    "id" SERIAL PRIMARY KEY,
    "foodsName" VARCHAR(32) NOT NULL UNIQUE,
    "price" NUMERIC(30,2) NOT NULL CHECK("price">0),
    "currancy" VARCHAR(16) NOT NULL CHECK("currancy" !=''),
    "dateProduction" DATE NOT NULL CHECK("dateProduction"<current_date), 
    "shelfLife" VARCHAR(8) CHECK("shelfLife" !=''),
    "amount" INTEGER CHECK("amount">0 AND  "amount"<1000),
    -- CONSTRAINT unique_foodsName UNIQUE("foodsName"),
    -- CONSTRAINT check_pr_date CHECK("dateProduction"<current_date),
    "expirationDate" VARCHAR(50)
);


CREATE TABLE "orders"(
    "id" SERIAL PRIMARY KEY,
    "userId" INT REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL CHECK("createdAt"<=current_date) DEFAULT current_date
);

CREATE TABLE "foods_to_orders"(
"foodsId" INT REFERENCES "foods"("id"),
"orderId" INT REFERENCES "orders"("id"),
"amount" INT  CHECK("amount">0),
PRIMARY KEY ("foodsId","orderId")

)


INSERT INTO "users" ( "firstName","lastName","email", "isMale","birthday","height")
VALUES('Tom', 'Musk', 'elon@gmail.com', true,'1971-06-28', 1.88),
('Fil', 'Musk', 'musk4@gmail.com', true, '1971-06-28', 1.88),
('Elon', 'Musk', 'musks@gmail.com', true, '1971-06-28', 1.98),
('Oleg', 'Musk', 'musktr7@gmail.com', true, '1971-06-28', 1.88);



INSERT INTO "foods" ("foodsName","price","currancy","dateProduction" ,"shelfLife", "amount")
VALUES('Betroot', 20.5, 'UAH', '2022-06-30','3 month', 30),
('Bred', 12.5, 'UAH', '2022-08-20','1 month', 90),
('Onion', 18.5, 'UAH', '2022-08-20','5 month', 80),
('Orange', 15.5, 'UAH', '2022-08-20','7 month', 60);

INSERT INTO "orders"("userId")VALUES(1),(2),(1);


INSERT INTO "foods_to_orders" ( "orderId","foodsId",   "amount")
VALUES (1,2,10),(1,1,1),(1,3,1),
(2,3,5),
(3,4,20);


ALTER TABLE "users"
DROP CONSTRAINT "iniqueEmail";

ALTER TABLE "users"
ADD UNIQUE ("email");








INSERT INTO "foods" ("foodsName","price","currancy","dateProduction" ,"shelfLife", "amount")
VALUES('Betroot', 20.5, 'UAH', '2022-06-30','3 month', 30),
('Onion', 18.5, 'UAH', '2022-08-20','2 month', 20),
('Sugar', 29.1, 'UAH', '2022-06-20','24 month', 300);


















DROP TABLE IF EXISTS "messages";
CREATE TABLE "messages" (
    "id" SERIAL PRIMARY KEY,
    -- "id" UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
    -- "id" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v1(),
    "body" VARCHAR(2048) NOT NULL CHECK("body" !=''),
    "author" VARCHAR(256) NOT NULL CHECK("author" !='') DEFAULT 'anonim',
    "isReady" BOOLEAN NOT NULL DEFAULT FALSE,
    "createdAt" TIMESTAMP NOT NULL CHECK("createdAt"<=current_timestamp) DEFAULT  current_timestamp
);




INSERT INTO "messages" ("author", "body") 
VALUES ('Elon Musk2','context2');



INSERT INTO "messages" ( "author", "body") 
VALUES ('Elon Musk1','hi'),
('Elon Musk2','context2'),
('Elon Musk2','context2');
