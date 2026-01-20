CREATE TABLE user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    address VARCHAR(255),
    phone_number VARCHAR(30)
);

CREATE TABLE agency (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE vehicle_type (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    acriss_code VARCHAR(10) NOT NULL,
    description_key VARCHAR(100) NOT NULL
);

CREATE TABLE rental_offer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    price_per_day DECIMAL(10,2) NOT NULL,
    agency_id BIGINT NOT NULL,
    vehicle_type_id BIGINT NOT NULL,

    CONSTRAINT fk_offer_agency
        FOREIGN KEY (agency_id)
        REFERENCES agency(id),

    CONSTRAINT fk_offer_vehicle_type
        FOREIGN KEY (vehicle_type_id)
        REFERENCES vehicle_type(id)
);

CREATE TABLE booking (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    status_code VARCHAR(30) NOT NULL,
    created_at DATETIME NOT NULL,
    start_date_time DATETIME NOT NULL,
    end_date_time DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30),
    payment_provider VARCHAR(50),
    payment_reference VARCHAR(100),
    drop_off_agency BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    rental_offer_id BIGINT NOT NULL,

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES user(id),

    CONSTRAINT fk_booking_offer
        FOREIGN KEY (rental_offer_id)
        REFERENCES rental_offer(id),

    CONSTRAINT fk_booking_dropoff_agency
        FOREIGN KEY (drop_off_agency)
        REFERENCES agency(id)
);

CREATE TABLE customer_message (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    message TEXT NOT NULL,
    sender_type VARCHAR(20) NOT NULL,
    user_id BIGINT NOT NULL,

    CONSTRAINT fk_message_user
        FOREIGN KEY (user_id)
        REFERENCES user(id)
);
