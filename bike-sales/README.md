# Bike Sales by Demographic Analysis (Excel Project) :mountain_bicyclist:

***Below I have linked the Excel sheet's GitHub location if you want to follow along with the writeup.**

<https://github.com/martintthai/data-analysis-projects/tree/main/bike-sales>

## Introduction:

In this project, I used **Microsoft Excel** to clean, process, and analyze bike sale data. Using functions, pivot tables and graphs, I created a dashboard to differentiate customer demographics based on bike purchases to visualize and understand key metrics.

## Data:

The dataset I worked with contains 13 columns with demographic data; ID, marital status, gender, income, children (how many children they had), education, occupation, home owners (if they were a homeowner), cars (how many cars they owned), commute (how far their commute is), region, age, and purchased biked (if they purchased a bike). Below is a preview of the original Excel sheet.

![](https://lh7-us.googleusercontent.com/2WdNW1QSCax5oOMHxVMy5pOlWY61l3ujLEG-wxjJrW99i1EyningFcg6rd3oaG7stG6-x1owAWkM0bpFkaUvraJP3BBmRXm9Amc4Ba_EsF2a4C5H5bjowsGiPOSiODtYNgpyj__6vK3efSn6IqVqum0)

## Data Cleaning and Processing:

**Steps taken:**

1.  Removed all rows with null or blank values

2.  Used find and replace to change 'M' and 'S' in marital status to 'Married' and 'Single'

3.  Used find and replace to change 'M' and 'F' in gender to 'Male' and 'Female'

4.  Changed income to a value instead of a string

5.  Created age brackets for the column age

**Cleaned data:**

![](https://lh7-us.googleusercontent.com/Lk1IOGl-KtOS9DushzfwDsyOZAN40ijmK6zZoKQqKm_lMNzbpEIicJaaKsPYfXVemh7kyPa-tR9sxPjKOk7ssPqK2AkwNqwOq2-gGl6-_lLemHDI8CnI0s-8lQNOLtaBwn8JDF6ZNiNOiEQ_N530W2U)

## Analysis:

I used pivot tables and corresponding graphs to see which customer bought a bike based on 3 key metrics (income, commute distance, and age).

**Metrics:**

**1.  Average income of each gender**

Pivot table:

![](https://lh7-us.googleusercontent.com/LMkWZsZnlw6q7q0PUnY9jGg4f82Byu3QSlg3NtbugQbMhEz2Qpu0W6tmJtDI05DGrMU7sSL-LAYvAQEWODPnFwMHpxV76PZmjhgrjh-I4p5eP9_tPR8EKxcD9EzHEH6arNn-NM7sHQ7mkrQORECSRQ4)

![](https://lh7-us.googleusercontent.com/SX6Vi8yvup5wogWzfImNmXRkWw1S-BpFKiYSdk_4cAtEa7rXThHYGJzjMyBWYjOTwUVAAiGa__HRht7UsZbHE2aH867O5TJHoF6s2xJY3T76gaqupQVHNeIMryMWC8rKo-hhCZm3e1zdtXUatBYjI5g)

**2.  Commute distance**

![](https://lh7-us.googleusercontent.com/z_RwqiEVo8E5b8F--tHOPNLB91vGzCo0aNizCfiiVfp7IKeXayRS95SG3R-BIdMbzZdJi0QQn6YHkNsrHwW46YwSozFE_0E5ZQ0yMqKuKHNcZ-J1pgYcq9O-JtiyWM0-YmQrjTK2ILzrQkOw3rCqeR4)

![](https://lh7-us.googleusercontent.com/c9nm_8FxbUODbcTK_tNUQ_ayTwiVXvOUtVLDnVvgGVM-is1Z8MggwqznmmCt-jnH1fSsbip5RmqdpmkdvwL6i_DUbKgNGPWXz9btulVhAsfuv6kbOqiI2qhT4p78QQ3HXPhF4kYKE0D-mGrhoACBUNE)

**3.  Age bracket**

![](https://lh7-us.googleusercontent.com/hDMAdlxOUMMmeyIEyP4iLUP8IJYqGga8b89dSM-Yvo1FTX5S7_ejA9ONvsr1nk0rrLX5V0aixzuY_tH6Hy746OgvdccGSP7bs6LxPeB6gRcdLgiP61sTgehn26zAkttBerZrTFlAOMRg6u56ZzchF7U)

![](https://lh7-us.googleusercontent.com/ChRpiAa0yz7vn_MQYKkqtSRNnvaDhkWM49uQrMZLpytlfQd_f4Ht3fOWDXjKtnmhL_zJl3Vw-ke-NHMtIBo0vUFD6EJCmFlCHYH73hF1EZpUWO2arhLDEP1lQEd3ygvesRTgEwFfuSRVA5SQ7dKIK7E)

## Dashboard:

I used these charts to create a comprehensive dashboard with marital status, region, and education filters to enhance user interactivity and display more in-depth insights.

![](https://lh7-us.googleusercontent.com/D2woUXJstwhsu6c_AHhnJ2UnRFg_iF9jS1p7KTlqCGUi2313-dJj9Nj1V3JsJxrBmi1S_FsLSBZxc0r_sg_VBItsLlK3FENDU7pSMrKRi97tbHjWQ7eP5mGEjQxTDw0LosXyQsTdsUihA-gmU5MQNe8)

## Key takeaways and conclusions:

1.  Generally, customers that purchase bikes tend to have a higher income than customers that don't.

2.  A majority of bike sales comes from middle aged customers.

3.  Customers with a short commute (0-1 miles) purchase bikes more often than customers with a 1+ mile commute.

## Interesting trends:

1.  In Europe, females that didn't purchase a bike had a higher income than females that did purchase a bike. Maybe women that had a higher income preferred to use cars?

![](https://lh7-us.googleusercontent.com/AJcLzCBkYVBSIAngs8TbWGfPmafbDeeSUgeegPvmq25N__H90Kj8Pz91tmWO08oSC7fUc2ok_Oqe9i9t8FAOH2nUSZ3ubigdyWOC2nMZu0UDJHOsWGDjAr50Y1O6GovV299jvJWe51grZGRYjqTu_l0)

2.  Customers that had a Bachelor's degree more often than not did not purchase a bike. Maybe a Bachelor's degree led to higher income which led to the ability to purchase a car, therefore not requiring a bike for travel?

![](https://lh7-us.googleusercontent.com/Rrn5iL_cwsdiZEPDkLcUj3SRzVi5Ut7ataYu9xahiPSAwLQNLLls5E2HddoH6dZPTWqxGEAJh2f74_ZXIE7895TFCiWN7nNO4mMPaCfuixqYXJcR0cvF9k7uTYovm8_ZwDbwUdAxygePc3xy6R3uQHI)

Thank you for reading! Below I have linked my portfolio and socials if you want to reach out and chat or simply just take a look at my other projects!

**LinkedIn: <https://www.linkedin.com/in/martin-thai-0a3955223/>**

**GitHub: <https://github.com/martintthai/data-analysis-projects>**
