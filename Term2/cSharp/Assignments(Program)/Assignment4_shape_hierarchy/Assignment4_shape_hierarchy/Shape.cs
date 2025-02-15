using System;

namespace Assignment4_shape_hierarchy
{
    internal abstract class Shape
    {
        public abstract double GetArea();
    }

    internal class Square : Shape
    {
        private double side;

        public Square(double side)
        {
            if (side < 0)
            {
                throw new ArgumentException("The sides of the square cannot be negative. Please enter a positive value!");
            }
            this.side = side;
        }

        public override double GetArea()
        {
            return side * side;
        }
    }

    internal class Circle : Shape
    {
        private double radius;

        public Circle(double radius)
        {
            if (radius < 0)
            {
                throw new ArgumentException("Radius value cannot be negative. Please enter a positive value!");
            }
            this.radius = radius;
        }

        public override double GetArea()
        {
            return Math.PI * radius * radius;
        }
    }

    internal class Triangle : Shape
    {
        private double baseLength;
        private double height;

        public Triangle(double baseLength, double height)
        {
            if (baseLength < 0 || height < 0)
            {
                throw new ArgumentException("Base length and height must be positive. Please enter positive values!");
            }
            this.baseLength = baseLength;
            this.height = height;
        }

        public override double GetArea()
        {
            return 0.5 * baseLength * height;
        }
    }
}
