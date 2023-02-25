# ADS507-Practical-Data-Engineering



<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://hire.refactored.ai/upload-nct/portfolio_images/92/life.png" alt="Project logo"></a>
</p>

<h3 align="center">Airbnb Seattle</h3>


--- 

## 🧐 About <a name = "about"></a>
The Airbnb Seattle dataset is a collection of information about Seattle, Washington, Airbnb listings. The dataset includes information on the location, property type, room type, price, number of reviews, and many other pertinent parameters for each listing. The dataset can be used for statistical modeling, machine learning, and data analysis to uncover numerous patterns and trends in the Seattle Airbnb market. By examining the dataset, we may gain a variety of insights into the Airbnb industry, including the evolution of demand for Airbnb listings and the existence of seasonality trends in terms of costs, reservations, and availability. Different factors, such as location, season, and property type, can be impacted by pricing trends. The Airbnb Seattle dataset can also provide insights into the factors that influence the demand and price of Airbnb listings in Seattle, such as the availability of public transportation, tourist attractions, and local events. This information can be used to help Airbnb hosts make informed decisions about pricing and marketing their listings. Furthermore, the dataset can also help researchers and policymakers understand the impact of Airbnb on the local housing market, such as the effects on rental prices and the availability of affordable housing. Overall, the Airbnb Seattle dataset is a valuable resource for those looking to gain a deeper understanding of the Airbnb market in Seattle.

---

## 🎈 Contributions

- Hoori Javadnia   
- Dennis Myasnyankin
- Ruddy Simonpour 

---

## Prerequisites
Setup your environement and install project dependencies
```
conda create -n "your env name" python=3.9
source activate "your env name"

import pandas as pd
import pymysql as mysql
import os
import warnings
import getpass # To hide your local password

# Integrate your python environment to MySQL database.
conn = mysql.connect(host='localhost',
                    port = int(3306),
                    user = '****',
                    passwd=getpass.getpass('Enter password:'),
                    db="your database")

df = pd.read_sql_query("Show tables ", conn)
```
---

## Project Tree
```
|- README.md \  
|- Src \   
|-     |- Listings.csv  
|-     |- Reviews.csv  
|-     |- Calendar.csv  
|- Notebooks \
|-     |- Data_Importing.ipynb  
|-     |- Airbnb_Seattle_Preprocessing.ipynb  
|-     |- Airbnb_Seattle_Model_Creation.ipynb  
```

## Data Source

The dataset has 3 different CSV files:

- **Calendar**: This dataset consists of 1.4 million rows and 4 columns. It covers the listing IDs of properties, dates, availability of the property, and the daily price of staying at the property. This dataset can be used to analyze the availability and pricing patterns of the properties listed.<br>
- **Listings**: This dataset consists of 3,818 rows and 92 columns. It covers various aspects of each listing, such as descriptions and details of the property and host, review scores, location, amenities, etc. This dataset can be used to analyze the characteristics of the listed properties and their hosts.<br>
- **Reviews**: This dataset consists of 84,849 rows and 6 columns. It focuses on written reviews for stays at each property. This dataset can be used to analyze the feedback and opinions of the guests who have stayed at the listed properties.

