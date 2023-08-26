CREATE TABLE State (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    name VARCHAR2(255)
);

SELECT * FROM State;

CREATE TABLE City (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    state_id VARCHAR2(50),
    name VARCHAR2(255),
    FOREIGN KEY (state_id) REFERENCES State(id)
);

SELECT * FROM City;

CREATE TABLE Amenity (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    name VARCHAR2(255)
);

SELECT * FROM Amenity;

CREATE TABLE "User" (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    email VARCHAR2(255),
    password VARCHAR2(255),
    first_name VARCHAR2(255),
    last_name VARCHAR2(255)
);

SELECT * FROM "User";

CREATE TABLE Review (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    user_id VARCHAR2(50),
    text VARCHAR2(1000),
    FOREIGN KEY (user_id) REFERENCES "User" (id)
);

SELECT * FROM Review;

CREATE TABLE Place (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    user_id VARCHAR2(50),
    name VARCHAR2(255),
    city_id VARCHAR2(50),
    description VARCHAR2(1000),
    number_rooms NUMBER DEFAULT 0,
    number_bathrooms NUMBER DEFAULT 0,
    max_guest NUMBER DEFAULT 0,
    price_by_night NUMBER DEFAULT 0,
    latitude FLOAT,
    longitude FLOAT,
    FOREIGN KEY (user_id) REFERENCES "User" (id),
    FOREIGN KEY (city_id) REFERENCES City (id)
);

SELECT * FROM Place;

CREATE TABLE PlaceAmenity (
    amenity_id VARCHAR2(50),
    place_id VARCHAR2(50),
    FOREIGN KEY (amenity_id) REFERENCES Amenity (id),
    FOREIGN KEY (place_id) REFERENCES Place (id)
);

SELECT * FROM Review;

ALTER TABLE Review
ADD CONSTRAINT fk_review_place FOREIGN KEY (place_id) REFERENCES Place(id);

ALTER TABLE "User"
ADD CONSTRAINT uk_user_email UNIQUE (email);

ALTER TABLE Place
ADD CONSTRAINT chk_price_by_night CHECK (price_by_night >= 0);

ALTER TABLE Review
ADD CONSTRAINT chk_review_text CHECK (LENGTH(text) <= 1000);

ALTER TABLE City
MODIFY name NOT NULL;

ALTER TABLE State
MODIFY name NOT NULL;

ALTER TABLE Place
MODIFY name NOT NULL;











