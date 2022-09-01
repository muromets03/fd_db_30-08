DROP TABLE "a";

CREATE TABLE "a"(
    "b" INT,
    "c" INT,
   CONSTRAINT "unique_pair" UNIQUE ("b", "c")
    );


    INSERT INTO "a"
    VALUES(1,1),(3,1),(2,1),(1,2);