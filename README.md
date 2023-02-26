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
### Create your pandas env
conda create -n "your env name" python=3.9
source activate "your env name"

### Install mysql.connector library
!pip install mysql.connector


### Dependencies
import pandas as pd
import os
import warnings
import getpass # To hide your local password

### Connect MySQL database using python
import pymysql as mysql


# Integrate your python environment to MySQL database.
conn = mysql.connect(host='localhost',
                    port = int(3306),
                    user = '****',
                    passwd=getpass.getpass('Enter password:'),
                    db="your database")
                    
### Create cursor for executing query
db_cursor = conn.cursor()

### Create database
db_cursor.execute("CREATE DATABASE "your database name"

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
---

## Data Source

The dataset has 3 different CSV files:

- **Calendar**: This dataset consists of 1.4 million rows and 4 columns. It covers the listing IDs of properties, dates, availability of the property, and the daily price of staying at the property. This dataset can be used to analyze the availability and pricing patterns of the properties listed.<br>
- **Listings**: This dataset consists of 3,818 rows and 92 columns. It covers various aspects of each listing, such as descriptions and details of the property and host, review scores, location, amenities, etc. This dataset can be used to analyze the characteristics of the listed properties and their hosts.<br>
- **Reviews**: This dataset consists of 84,849 rows and 6 columns. It focuses on written reviews for stays at each property. This dataset can be used to analyze the feedback and opinions of the guests who have stayed at the listed properties.

---

## Data Importing Structure

- **Data importing.ipynb**

To import data into the MySQL database, we utilized Python to establish a connection between MySQL and Pandas. Subsequently, we created a database and developed the schemas for each table. Primary keys and foreign keys were assigned for all tables. However, we opted to disable the foreign key checks to prevent data from being loaded into the parent table first and then the child tables sequentially. This decision was motivated by the existence of some unparented **listing_id** values in the referencing field of the child table, which do not correspond to any valid values in the referenced field of the parent table. While this approach proved useful in facilitating data loading, it is important to exercise caution when working with disabled foreign key checks to avoid referential integrity issues.

To mitigate the risk of referential integrity issues, we recommend either removing unparented rows or updating them to reference a valid identifier in the parent table. Additionally, we advise inserting the parent table before the child tables during deployment to ensure data consistency.

Furthermore, it is crucial to note that the **listing** table (parent table) must be inserted before the **calendar** and **reviews** tables since they both depend on the **listing_id**. Finally, to create unique identifiers for each row in the calendar table, we created an auto-incrementing column for its primary key.

---

ERR Diagram of the tables

```
![alt text] ( https://github.com/ruddysimon/ADS507-Practical-Data-Engineering-Airbnb_Seattle-/blob/main/ERR%20Diagram.png )

```

---

## Data Modeling

- **Airbnb_Seattle_Model_Creation.ipynb**

The dataset, named listings, comprises 92 columns, and our objective is to predict the price column using different algorithms. Prior to our prediction analysis, we performed several data preprocessing steps, including the removal of missing values, the conversion of data types, and the utilization of label encoding and dummies for categorical variables. Additionally, we excluded unnecessary columns that do not have any significant impact on the price column.

To enhance the accuracy of our prediction analysis, we utilized multicollinearity analysis to exclude columns that are highly correlated and may negatively impact our forecasting procedure. Overall, our approach demonstrates sound data preprocessing techniques and statistical methods that facilitate the prediction of the price column using different algorithms. To model the dataset and predict the price column, we employed various algorithms, including linear regression, lasso regression, xgboost, and random forest. To evaluate the performance of the models, we used the MAE (mean absolute error) metric. Our analysis revealed that the random forest algorithm achieved the best results among the models tested.

Overall, our study incorporated sound data preprocessing techniques, statistical methods, and state-of-the-art machine learning algorithms to accurately predict the price column of the listings dataset.








