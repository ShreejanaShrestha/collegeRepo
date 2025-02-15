# Created by: Shreejana Shrestha  || Student Id : C0930321

print("Question 1")
print("---------------------------")
# getting username input from the user
username = input("Enter the username: ")
remaining_attempts = 3 # max attempt to enter the password

if username == "Tim": # Checking the username with Tim
    # 
    while remaining_attempts > 0:
        password = input("Enter the password: ") #getting the password form user
        if password == "12345": # Checking the username
            print("Successful Attempt! Correct Username and password")
            break
        else:
            remaining_attempts -= 1
            if remaining_attempts > 0:
                print(f"Incorrect password. You have {remaining_attempts} attempt(s) left. Please try again.")
            else:
                print("Sorry! You have used all your attempts.")
else:
    print("Your username is incorrect! Please enter a valid username.")