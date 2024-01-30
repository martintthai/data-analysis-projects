# Tech Retail Sales Analysis with Python :technologist:
## Introduction/Background:
In this project, I use Python, Pandas, and Matplotlib to analyze and answer business questions about 12 months' worth of tech retail sales data. The data contains thousands of electronic store purchases broken down by product type, quantity ordered, price of each product, order date, and purchase address. 
### Skills applied:
- Data analysis
- Data pre-processing
- Data visualization
### Tools Used:
- Python
- Python Pandas
- Python Matplotlib
#### Data cleaning
- Remove NaN values
- Remove rows based on condition
- Convert columns to correct type (pd.to_numeric, pt_to.datetime)
#### Data processing (augmentation and transformation of columns)
- Extract month, hour, and minute from datetime
- Extract city from a full address
#### Data exploration and analysis
- **Explored metrics/business questions:**
    1. Best month for sales and how much was earned
    2. City with the highest number of sales
    3. Best time to display advertisements to maximize the likelihood of customers buying products
    4. Most purchased pairs of items (what items are most often sold together?)
    5. Most sold products and why
- **Used Pandas to:**
    - Merge multiple CSV files to create one large data frame
    - Add columns using .apply and .transform
    - Using groupby to perform aggregate analysis
- **Used Matplotlib to:**
    - Plot bar charts and line graphs to visualize results
    - Label graphs

