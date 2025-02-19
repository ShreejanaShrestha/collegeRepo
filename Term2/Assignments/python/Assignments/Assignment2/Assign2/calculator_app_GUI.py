# Created by Shreejana Shrestha

import tkinter as tk
from tkinter import messagebox

class SimpleCalculator:
    def __init__(self, root):
        self.root = root
        self.root.title("Simple Calculator")
        
        # setting background color and border
        self.root.configure(bg='gray')
        self.root.attributes('-alpha', 0.95)
        
        # initialize variables
        self.num1 = tk.StringVar()
        self.num2 = tk.StringVar()
        self.operation = tk.StringVar(value="add")

        # calling function to Create UI components
        self.create_widgets()

    def create_widgets(self):
        # adding Heading label
        tk.Label(self.root, text="Simple Calculator", font=("Helvetica", 16), bg='gray').grid(row=0, column=0, columnspan=2, pady=10)

        # Radio buttons for operation selection in vertical layout
        tk.Radiobutton(self.root, text="Add", variable=self.operation, value="add", bg='gray').grid(row=1, column=0, padx=10, pady=5, sticky='w')
        tk.Radiobutton(self.root, text="Multiply", variable=self.operation, value="multiply", bg='gray').grid(row=2, column=0, padx=10, pady=5, sticky='w')

        # Entry for number 1
        tk.Label(self.root, text="Number 1:", bg='gray').grid(row=3, column=0, padx=10, pady=5, sticky='w')
        tk.Entry(self.root, textvariable=self.num1).grid(row=3, column=1, padx=10, pady=5)

        # Entry for number 2
        tk.Label(self.root, text="Number 2:", bg='gray').grid(row=4, column=0, padx=10, pady=5, sticky='w')
        tk.Entry(self.root, textvariable=self.num2).grid(row=4, column=1, padx=10, pady=5)

        # Submit button
        tk.Button(self.root, text="Submit", command=self.calculate, bg='black', fg='white').grid(row=5, column=0, columnspan=2, pady=10)

        # displaying result
        tk.Label(self.root, text="Result:", bg='gray').grid(row=6, column=0, padx=10, pady=5, sticky='w')
        self.result_label = tk.Label(self.root, text="", bg='gray', fg='white', font=("Helvetica", 12, "bold"))
        self.result_label.grid(row=6, column=1, padx=10, pady=5, sticky='w')

        # By Label 
        tk.Label(self.root, text="By Shreejana Shrestha || C0930321", bg='gray', fg='white').grid(row=7, column=0, columnspan=2, pady=(20, 10))

# function for the calculation operation of add/multiply
    def calculate(self):
        try:
            number1 = float(self.num1.get())
            number2 = float(self.num2.get())
            
            if self.operation.get() == "add":
                result = number1 + number2
            elif self.operation.get() == "multiply":
                result = number1 * number2
            else:
                result = "Invalid operation"

            # Update the result label
            self.result_label.config(text=str(result))
        except ValueError:
            messagebox.showerror("Input Error", "Please enter valid numbers")

if __name__ == "__main__":
    root = tk.Tk()
    root.configure(bg='gray')
    root.title("Simple Calculator")
    calculator = SimpleCalculator(root)
    root.mainloop()
    
