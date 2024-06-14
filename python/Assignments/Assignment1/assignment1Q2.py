# Created by: Shreejana Shrestha  || Student Id : c0930321

class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def perimeter(self):
        return 2 * (self.length + self.width)

    def area(self):
        return self.length * self.width
    
    def display(self):
        print(f"Length(L) = {self.length}m")
        print(f"Width(W) = {self.width}m")
        print(f"Perimeter of rectangle(P) = {self.perimeter()}m")
        print(f"Area of rectangle(A) = {self.area()}sq.m")

class Parallelepipede(Rectangle):
    def __init__(self, length, width, height):
        super().__init__(length, width)
        self.height = height
    
    def volume(self):
        base_area = self.area() * self.height
        volume = base_area * self.height
        return volume

    def display(self):
        print(f"Volume of Parallelepipede = {self.volume()}cubic.m")


print("Question 2")
print("-------------------------")
print("Enter the details of rectangular object")
length = int(input("Enter length (L): "))
width = int(input("Enter width (W): "))
height = int(input("Enter height (H): "))
Rect = Rectangle(length, width)
Parallelep = Parallelepipede(length, width, height)
Rect.display()
Parallelep.display()