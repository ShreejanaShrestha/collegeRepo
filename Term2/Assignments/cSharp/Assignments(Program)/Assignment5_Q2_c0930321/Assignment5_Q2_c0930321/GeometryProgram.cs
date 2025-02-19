using System;

namespace Assignment5_Q2_c0930321
{
    internal class GeometryProgram
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Question 2\nGeometry Program\n-------------------------------\n");
            Location location1 = new Location(4.0, 3.0);
            Console.WriteLine("Rectangle\n--------------\n");
            Shape rect = new Rectangle(location1, 6.0, 2.0);
            Console.WriteLine(rect.ToString());
            Console.WriteLine($"Area: {rect.Area()}");
            Console.WriteLine($"Perimeter: {rect.Perimeter()}\n");

            Location location2 = new Location(5.0, 6.0);
            Console.WriteLine("Circle\n--------------\n");
            Shape circle = new Circle(location2, 2.5);
            Console.WriteLine(circle.ToString());
            Console.WriteLine($"Area: {circle.Area()}");
            Console.WriteLine($"Perimeter: {circle.Perimeter()}");
        }
    }
}
