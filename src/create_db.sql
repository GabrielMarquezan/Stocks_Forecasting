CREATE DATABASE IF NOT EXISTS stock_forecasting;
USE stock_forecasting;

CREATE TABLE IF NOT EXISTS selic(
    definitionDate DATE PRIMARY KEY,
    rate DECIMAL(2, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS assets (
    name VARCHAR(100) PRIMARY KEY,
    Ticker VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS prices(
    date DATE,
    price DECIMAL(10, 2) NOT NULL,
    openingOrClosing ENUM('opening', 'closing') NOT NULL,
    assetName VARCHAR(100) NOT NULL,
    FOREIGN KEY(assetName) REFERENCES assets(name),
    PRIMARY KEY (date, openingOrClosing, assetName)
);

CREATE TABLE IF NOT EXISTS news(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    emotion ENUM('very positive', 'positive', 'neutral', 'negative', 'very negative') NOT NULL,
    assetName VARCHAR(100) NOT NULL,
    FOREIGN KEY(assetName) REFERENCES assets(name)
);

INSERT INTO assets (name, Ticker) VALUES
('Banco do Brasil', 'BBAS3'),
('Natura', 'NATU3'),
('Locaweb', 'LWSA3'),
('Gold', '-'),
('Soy', '-'),
('Steel', '-'),
('Oil', '-'),
('USD', '-');
