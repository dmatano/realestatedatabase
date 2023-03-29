-- create a postgresql database named nyumbani
CREATE DATABASE nyumbani;
-- create a table named property
CREATE TABLE property (
    id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    rentalprice VARCHAR(255) NOT NULL,
    bedrooms VARCHAR(255) NOT NULL,
    bathrooms VARCHAR(255) NOT NULL
    agent_id INTEGER REFERENCES agent(id)
    landlord_id INTEGER REFERENCES landlord(id)
    tenant_id INTEGER REFERENCES tenant(id)
    available BOOLEAN NOT NULL
    date_added DATE NOT NULL
);
-- insert 10 values into the property table in one query

INSERT INTO property (address, city, rentalprice, bedrooms, bathrooms, agent_id, landlord_id, tenant_id, available, date_added) VALUES
('123 Main St', 'San Francisco', '1000000', '2', '1', '1', '1', '1', 'true', '2018-01-01'),
('456 Main St', 'San Francisco', '2000000', '3', '2', '2', '2', '2', 'true', '2018-01-02'),
('789 Main St', 'San Francisco', '3000000', '4', '3', '3', '3', '3', 'true', '2018-01-03'),
('123 Main St', 'San Francisco', '4000000', '5', '4', '4', '4', '4', 'true', '2018-01-04'),
('456 Main St', 'San Francisco', '5000000', '6', '5', '5', '5', '5', 'true', '2018-01-05'),
('789 Main St', 'San Francisco', '6000000', '7', '6', '6', '6', '6', 'true', '2018-01-06'),
('123 Main St', 'San Francisco', '7000000', '8', '7', '7', '7', '7', 'true', '2018-01-07'),
('456 Main St', 'San Francisco', '8000000', '9', '8', '8', '8', '8', 'true', '2018-01-08'),
('789 Main St', 'San Francisco', '9000000', '10', '9', '9', '9', '9', 'true', '2018-01-09'),
('123 Main St', 'San Francisco', '10000000', '11', '10', '10', '10', '10', 'true', '2018-01-10');

-- create a table named tenant
CREATE TABLE tenant (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
);

-- insert 10 values into the tenant table in one query
INSERT INTO tenant (name, email, phone) VALUES
('Otieno Eric', 'etieno@mail.com', '123456789'),
('Jaka Kimba', 'jakakimba@mail.com', '987654321'),
('Theuri Henry', 'htheuri@mail.com', '123456789'),
('Indiana Koch', 'indiana@mail.com', '987654321'),
('Kipchamba Ken', 'kkipchamba@mail.com', '5793874597'),
('Kipchumba Daniel', 'dkipchumba @mail.com', '123456789'),
('Mutua Brian', 'bmutua@mail.com', '987654321'),
('Ian Wathe', 'iwathe@mail.com', '4673647676'),
('Kipkoech John', 'jkipkoech@mail.com', '123456789'),
('Talam Ruto', 'truto@mail.com', '987654321');

-- create a table named landlord
CREATE TABLE landlord (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
);

-- insert 10 values into the landlord table in one query
INSERT INTO landlord (name, email, phone) VALUES
('Mary Jane', 'mjane@mail.com', '123456789'),
('Ibrahim mohamed', 'mohamed@mail.com', '989654321'),
('wanjiru ciru', 'ciru@mail.com','8213456789'),
('nasieku sintei', 'sintei@mail.com', '988654321'),
('gabow noor', 'nogabow@mail.com', '123456789'),
('Duncan mohamed', 'duncan@mail.com', '987654321'),
('seyyid said', 'said@mail.com', '123456789'),
('Grace otieno', 'gotieno@mail.com', '987624321'),
('Fatuma Aisha', 'fatuma@mail.com', '345456789'),
('Moses Musa', 'musa@mail.com', '987654321');


-- create a table named property_landlord
CREATE TABLE property_landlord (
    id SERIAL PRIMARY KEY,
    property_id INTEGER REFERENCES property(id),
    landlord_id INTEGER REFERENCES landlord(id)
);

-- create a table named property_tenant
CREATE TABLE property_tenant (
    id SERIAL PRIMARY KEY,
    property_id INTEGER REFERENCES property(id),    
    tenant_id INTEGER REFERENCES tenant(id)
);
--create a trigger to update the property table when a new tenant is added
CREATE OR REPLACE FUNCTION update_property_tenant() RETURNS TRIGGER AS $$
BEGIN
    UPDATE property SET tenant_id = NEW.tenant_id WHERE id = NEW.property_id;
    RETURN NEW;
END;


--create table named agent
CREATE TABLE agent (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    commission_rate VARCHAR(255) NOT NULL,
);

