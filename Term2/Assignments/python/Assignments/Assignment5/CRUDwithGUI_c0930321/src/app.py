import sqlite3
from tkinter import *
from tkinter import ttk, messagebox

# database connection and table creation
def connect_db():
    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS shreejana_321 (
        StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
        StudentFirstName TEXT NOT NULL,
        StudentLastName TEXT NOT NULL,
        City TEXT NOT NULL
    )
    ''')
    conn.commit()
    conn.close()

def insert_record():
    '''
    Takes input from the user (First Name, Last Name, City) and inserts a new record into the database.
    If the insertion is successful, a success message is displayed. 
    If there is an error, an error message is displayed, and the transaction is rolled back
    '''

    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    try:
        cursor.execute('INSERT INTO shreejana_321 (StudentFirstName, StudentLastName, City) VALUES (?, ?, ?)', 
                       (entry_first_name.get(), entry_last_name.get(), entry_city.get()))
        conn.commit()
        messagebox.showinfo("Success", "Record inserted successfully!")
    except sqlite3.Error as e:
        messagebox.showerror("Error", f"Failed to insert record: {e}")
        conn.rollback()
    finally:
        conn.close()
    display_records()

def update_record():
    '''
    Updates an existing record in the database. It retrieves the selected record from the Treeview, 
    takes new input values, and updates the corresponding record in the database.
    It handles errors such as no selection and database errors, displaying appropriate messages.
    '''

    selected = tree.focus()
    values = tree.item(selected, 'values')
    if not values:
        messagebox.showerror("Error", "Select a record to update!")
        return

    student_id = values[0]
    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    try:
        cursor.execute('UPDATE shreejana_321 SET StudentFirstName=?, StudentLastName=?, City=? WHERE StudentID=?', 
                       (entry_first_name.get(), entry_last_name.get(), entry_city.get(), student_id))
        if cursor.rowcount == 0:
            messagebox.showerror("Error", "No record found with the provided Student ID!")
        else:
            conn.commit()
            messagebox.showinfo("Success", "Record updated successfully!")
    except sqlite3.Error as e:
        messagebox.showerror("Error", f"Failed to update record: {e}")
        conn.rollback()
    finally:
        conn.close()
    display_records()

def delete_record():
    '''
    Deletes a selected record from the database.
    It retrieves the selected record from the Treeview and deletes it from the database. 
    Appropriate success or error messages are displayed based on the operation's outcome.
    '''

    selected = tree.focus()
    values = tree.item(selected, 'values')
    if not values:
        messagebox.showerror("Error", "Select a record to delete!")
        return

    student_id = values[0]
    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    try:
        cursor.execute('DELETE FROM shreejana_321 WHERE StudentID=?', (student_id,))
        if cursor.rowcount == 0:
            messagebox.showerror("Error", "No record found with the provided Student ID!")
        else:
            conn.commit()
            messagebox.showinfo("Success", "Record deleted successfully!")
    except sqlite3.Error as e:
        messagebox.showerror("Error", f"Failed to delete record: {e}")
        conn.rollback()
    finally:
        conn.close()
    display_records()

def display_records():
    '''
    Fetches all records from the database and displays them in the Listbox.
    The list is updated each time a record is inserted, updated, or deleted to 
    reflect the current state of the database.
    '''

    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM shreejana_321')
    rows = cursor.fetchall()
    for row in tree.get_children():
        tree.delete(row)
    for row in rows:
        tree.insert("", END, values=row)
    conn.close()

def select_record(event):
    '''
    Handle the selection of a record from the Treeview. When a row is selected, 
    it populates the entry fields with the selected record's data for easy updating or deletion.
    '''

    selected = tree.focus()
    values = tree.item(selected, 'values')
    if values:
        entry_first_name.delete(0, END)
        entry_first_name.insert(0, values[1])
        entry_last_name.delete(0, END)
        entry_last_name.insert(0, values[2])
        entry_city.delete(0, END)
        entry_city.insert(0, values[3])

# GUI section logic

app = Tk()
app.title("Student Database Management")
app.geometry("600x400")

style = ttk.Style()
style.configure("TLabel", font=('Helvetica', 10))
style.configure("TButton", font=('Helvetica', 10), padding=10)
style.configure("Treeview.Heading", font=('Helvetica', 10, 'bold'))

frame = Frame(app, pady=10)
frame.pack(pady=20)

#  input for StudentID, First Name, Last Name, and City using label and entry widgets
Label(frame, text="First Name").grid(row=0, column=0, padx=5, pady=5)
entry_first_name = Entry(frame)
entry_first_name.grid(row=0, column=1, padx=5, pady=5)

Label(frame, text="Last Name").grid(row=1, column=0, padx=5, pady=5)
entry_last_name = Entry(frame)
entry_last_name.grid(row=1, column=1, padx=5, pady=5)

Label(frame, text="City").grid(row=2, column=0, padx=5, pady=5)
entry_city = Entry(frame)
entry_city.grid(row=2, column=1, padx=5, pady=5)

button_frame = Frame(app, pady=10)
button_frame.pack(pady=10)


Button(button_frame, text="Insert", command=insert_record).grid(row=0, column=0, padx=5, pady=5)
Button(button_frame, text="Update", command=update_record).grid(row=0, column=1, padx=5, pady=5)
Button(button_frame, text="Delete", command=delete_record).grid(row=0, column=2, padx=5, pady=5)
Button(button_frame, text="Display", command=display_records).grid(row=0, column=3, padx=5, pady=5)

# using treeview widget to display the records in tabular format with column headings
tree_frame = Frame(app)
tree_frame.pack(pady=20)

tree = ttk.Treeview(tree_frame, columns=("ID", "First Name", "Last Name", "City"), show="headings")
tree.heading("ID", text="ID")
tree.heading("First Name", text="First Name")
tree.heading("Last Name", text="Last Name")
tree.heading("City", text="City")
tree.column("ID", anchor=CENTER, width=50)
tree.column("First Name", anchor=CENTER, width=150)
tree.column("Last Name", anchor=CENTER, width=150)
tree.column("City", anchor=CENTER, width=100)
tree.pack()

tree.bind("<ButtonRelease-1>", select_record)

# establish a connection to the database
connect_db()
app.mainloop()
