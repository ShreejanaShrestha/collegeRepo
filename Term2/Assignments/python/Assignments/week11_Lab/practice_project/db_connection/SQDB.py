import sqlite3

db=sqlite3.connect('test.db')
query = "Insert into student (name, age, marks) values('Aman', 20, 65.0);"
sql = "SELECT * FROM student"

update_qry = "UPDATE student SET age=? where name=?;"

# try:
#     cur=db.cursor()
#     cur.execute(query)
#     db.commit()
#     print("One record added successfully!")
# except:
#     print("Error in operation!")
#     db.rollback()
# db.close()

# cur = db.cursor()
# cur.execute(sql)
# while True:
#     record = cur.fetchone()
#     if record == None:
#         break
#     print(record)
# db.close()



# try:
#     cur = db.cursor()
#     cur.execute(update_qry, (19, 'Rajeev'))
#     db.commit()
#     print("Record updated successfully!")
# except:
#     print("Error in operation!")
#     db.rollback()
# db.close()

db.execute("DELETE FROM student where StudentID = '3';")
db.commit()
cursor = db.execute("SELECT * FROM student")
print(cursor.fetchall())
db.close()