using System;

namespace Assignment5_Q2_c0930321
{
    public abstract class Shape
    {
        protected Location c;

        public Shape(Location c)
        {
            this.c = c;
        }

        public abstract double Area();
        public abstract double Perimeter();

        public override string ToString()
        {
            return $"Shape at location ({c.x}, {c.y})\n";
        }
    }

    public class Rectangle : Shape
    {
        private double side1;
        private double side2;

        public Rectangle(Location c, double side1, double side2) : base(c)
        {
            this.side1 = side1;
            this.side2 = side2;
        }

        public override double Area()
        {
            return side1 * side2;
        }

        public override double Perimeter()
        {
            return 2 * (side1 + side2);
        }

        public override string ToString()
        {
            return $"Rectangle at location ({c.x}, {c.y}) with sides {side1} and {side2}\n";
        }
    }

    public class Circle : Shape
    {
        private double radius;

        public Circle(Location c, double radius) : base(c)
        {
            this.radius = radius;
        }

        public override double Area()
        {
            return Math.PI * radius * radius;
        }

        public override double Perimeter()
        {
            return 2 * Math.PI * radius;
        }

        public override string ToString()
        {
            return $"Circle at location ({c.x}, {c.y}) with radius {radius}\n";
        }
    }
}
