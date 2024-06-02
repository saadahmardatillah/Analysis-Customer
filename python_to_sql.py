# import library mysql connector
import mysql.connector

# Tes Koneksi
con = mysql.connector.connect(user='root',password='password',
                              host='localhost',database='KALBE')
# Cek Koneksi
if con.is_connected():
    print('Connected')

# Create Object Cursor
cursor = con.cursor()

# Add Value to Table
insert_sql = ("INSERT INTO inventory(item_code,item_name,item_price,item_total) VALUES ('2346','Fitbar',15000,200)")
#values = ('2346','Fitbar',15000,200)

#Execute
cursor.execute(insert_sql)
con.commit()