import pandas as pd
from sqlalchemy import create_engine

data1 = pd.read_csv('customers.csv')
data2 = pd.read_csv('geolocation.csv')
data3 = pd.read_csv('order_items.csv')
data4 = pd.read_csv('orders.csv')
data5 = pd.read_csv('payments.csv')
data6 = pd.read_csv('products.csv')
data7 = pd.read_csv('sellers.csv')

engine = create_engine('mysql+pymysql://root:Uttam%239695@localhost:3306/E_Commerce_Data')
data1.to_sql('customers', con=engine, if_exists='replace', index=False)
data2.to_sql('geolocation', con=engine, if_exists='replace', index=False)
data3.to_sql('order_items', con=engine, if_exists='replace', index=False)
data4.to_sql('orders', con=engine, if_exists='replace', index=False)
data5.to_sql('payments', con=engine, if_exists='replace', index=False)
data6.to_sql('products', con=engine, if_exists='replace', index=False)
data7.to_sql('sellers', con=engine, if_exists='replace', index=False)

print("Data imported successfully into the database.")