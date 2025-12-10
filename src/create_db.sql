CREATE DATABASE IF NOT EXISTS stock_forecasting;
USE stock_forecasting;

CREATE TABLE IF NOT EXISTS assets (
    ticker VARCHAR(100) PRIMARY KEY,
    name VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS prices(
    date DATE,
    opening DECIMAL(10, 2) NOT NULL,
    closing DECIMAL(10, 2) NOT NULL,
    high DECIMAL(10, 2) NOT NULL,
    low DECIMAL(10, 2) NOT NULL,
    volume DECIMAL(20, 2) NOT NULL,
    assetTicker VARCHAR(100) NOT NULL,
    FOREIGN KEY(assetTicker) REFERENCES assets(ticker),
    PRIMARY KEY (date, assetTicker)
);

CREATE TABLE IF NOT EXISTS news(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body_text VARCHAR (1000) NOT NULL,
    date DATE NOT NULL,
    isNational BOOLEAN NOT NULL,
    emotion ENUM('very negative', 'negative', 'neutral', 'positive', 'very positive') NOT NULL,
    assetTicker VARCHAR(100) NOT NULL,
    FOREIGN KEY(assetTicker) REFERENCES assets(ticker)
);

INSERT INTO assets (name, Ticker) VALUES
('Banco do Brasil', 'BBAS3'),
('Marfrig', 'MRFG3'),
('SLC Agrícola', 'SLCE3'),
('Gold', 'GC=F'),
('Soy', 'ZS=F'),
('Oil', 'CL=F'),
('USD', 'USDBRL=X');
