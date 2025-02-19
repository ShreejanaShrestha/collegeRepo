import mysql.connector

mydb = mysql.connector.connect(user='shreejana', password='password',
                               host='127.0.0.1', database='test',
                               auth_plugin='mysql_native_password')
print(mydb)

cursor =mydb.cursor()
# query = "INSERT INTO users (name, user_name) VALUES(%s, %s)"
## storing values in a variable

values = ("Shreejana", "shreejanas")

## executing the query with values
# cursor.execute(query, values)

## defining the query
query1 = "SELECT * FROM users"

## getting records from the table
cursor.execute(query1)

## fetching all records from the 'cursor' object
records = cursor.fetchall()

print(records)






## to make final output we have to run the 'commit()' method of the database object
# mydb.commit()



# db=sqlite3.connect('test.db')

# try:
#     cur=db.cursor()
#     cur.execute('''CREATE TABLE student(
#                 StudentID INTEGER PRIMATY KEY AUTOINCREMENT,
#                 name TEXT (20) NOT NULL,
#                 age INTEGER,
#                 marks REAL);''')
#     print('table created successfully')

# except:
#     print('error in operation')
#     db.rollback()
# db.close()