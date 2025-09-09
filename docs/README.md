# Stock Sentiment Analysis and Forecasting

This project collects and analyzes news data for the brazilian companies Banco do Brasil (BBAS3), Marfrig (MRFG3), and SLC Agrícola (SLCE3), alongside economic indicators, to perform sentiment analysis using Large Language Models (LLMs) and forecast the companies' prices.

## Features Used
- **Emotion**: Sentiment derived from news articles.
- **Opening-Closing Delta**: Difference between stock opening and closing prices.
- **Daily High**: Highest price in a day.
- **Daily Low**: Lowest price in a day.
- **Daily Volume**: Trading volume in a day.
- **Oil Price**: Crude oil market prices.
- **Soy Price**: Soybean market prices.
- **Gold Price**: Gold market prices.
- **USD/BRL**: Exchange rate between US Dollar and Brazilian Real.

## Project Workflow

### Step 1: Data Collection
- Collect news articles related to Banco do Brasil (BBAS3), Marfrig (MRFG3), and SLC Agrícola (SLCE3).
- Store the collected news data in a MySQL database.

### Step 2: Emotion Classification
- Perform emotion classification on the news articles using Large Language Models (LLMs) to determine sentiment.

### Step 3: Additional Feature Collection
- Gather data for the following features: Opening-Closing Delta, Daily High, Daily Low, Daily Volume, Oil Price, Soy Price, Gold Price, Steel Price and USD/BRL.
- Store these features in the MySQL database.

### Step 4: Data Structuring
- Create SQL queries to structure the collected data into a dataframe.

### Step 5: Further Analysis
- To be defined

## Requirements
- MySQL for data storage.
- Python libraries (e.g., `mysql-connector-python`, `pandas`) for data collection and manipulation.
- Access to a public Large Language Model
- Data sources for economic indicators (e.g., APIs for oil, soy, gold, steel prices, USD/BRL, and Selic).

## Setup Instructions
1. Install dependencies
2. Configure MySQL database connection in the project settings.
3. Run the data collection scripts to gather news and economic data.
4. Execute the sentiment analysis.
5. Use SQL queries to structure the data into a dataframe.