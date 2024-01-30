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
#### Data processing/feature engineering (augmentation and transformation of columns)
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

Charts:

![](https://lh7-us.googleusercontent.com/YNdc3V6WZiIGjBpm0rrfen4a_P6bdJWvwM8LtWyJodqjNp89rK_g6tLzNNUc9_CTabWSbrh-hYZ-UdRUlvaIeDN4DSeMIHnAv3Sg4yyPP_wl3JUgJMiDMp_aSsNF7ONP0qYhOcwt-EYaoukpZr2Vw3M)

![](https://lh7-us.googleusercontent.com/TLiyg4wS6vVUmPo4r0e0r5k1c1YtqZY3MYWQUA4xcJAS4clpWiiAAGIqPHlMDAHuBdC0BUuhj8IJ_RMiille2ptY6ofielurVGNt3_lrdcAxFotR3F-1QLMUzpR4jsoVIZLzdrsy9tRgJWxg98lVQrM)

![](https://lh7-us.googleusercontent.com/dWuNm0O93ALrpMbMceUnchdBpTHRAItuUdzw-G2T53opa5Z-tvghhzf5vtMU3QQy_tpWkFWpP1nuKdNNbj7Hyvh3BULy_Y7ALF-thZK-K_IdwHod-J3UvY7B-AFg_IlASa02BLkpl8Nui_FomB06SzU)

![](https://lh7-us.googleusercontent.com/arBR6V3OvkFOAVk-hLJIDZ_c8wzQqrheY8aqLQ4db36qCKYXw-ih1VPOPr2oFBg94sDpFzV-nuLO8d-HXw9XT0EF8G9cRThpp4WYiYKLvfCPxuEKW8BX8iQZ9Ib13ujLF61v25swUrPGGw1YrH9unN0)
