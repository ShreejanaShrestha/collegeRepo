using System;

namespace Assignment4_shape_hierarchy
{
    internal class ShapeHierarchy
    {
        public static void Main(string[] args)
        {
            Shape[] shapes = new Shape[]
            {
                new Square(4),
                new Circle(3),
                new Triangle(5, 6),
                new Square(6),
                new Circle(7),
            };

            double totalArea = 0;
            foreach (Shape shape in shapes)
            {
                double area = shape.GetArea();
                totalArea += area;
                Console.WriteLine($"Area of {shape.GetType().Name}: {area}");
            }

            Console.WriteLine($"Total area of all shapes: {totalArea}");
        }
    }
}
