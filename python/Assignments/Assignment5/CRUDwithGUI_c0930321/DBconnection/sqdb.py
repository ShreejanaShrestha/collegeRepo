import sqlite3

def create_database():
    conn = sqlite3.connect('Shreejana.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS shreejana_321 (
                   StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
                   StudentFirstName TEXT NOT NULL,
                   StudentLastName TEXT NOT NULL,
                   StudentLastName TEXT NOT NULL,
                   City TEXT NOT NULL
                   )          
    ''')
    conn.commit()
    conn.close()

create_database()