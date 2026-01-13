import mysql.connector
import pandas as pd

file_path = "2025 - Overall Rank.csv"

#Coloque As Informações do seu servidor aqui.
mydb = mysql.connector.connect(
  host="your_host",
  user="root",
  password="password",
  database="your_database"
)


mycursor = mydb.cursor()
mycursor.execute("CREATE TABLE 2025_Overall_Rank (Global_Rank INT(5), Institution TEXT, Country VARCHAR(5), Sector TEXT, Best_Country_Quartile INT(1))")

df = pd.read_csv(file_path)

for index, row in df.iterrows():
    mycursor.execute(
        "INSERT INTO 2025_Overall_Rank (Global_Rank , Institution, Country, Sector, Best_Country_Quartile) VALUES (%s, %s, %s, %s, %s)",
        (row['Global Rank'], row['Institution'], row['Country'], row['Sector'], row['Best Country Quartile'])
    )

mydb.commit()

mycursor.close()
mydb.close()