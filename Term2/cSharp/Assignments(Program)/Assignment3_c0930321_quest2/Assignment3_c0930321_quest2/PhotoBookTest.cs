using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_c0930321_quest2
{
    internal class PhotoBookTest
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("************** Question II ****************");
            Console.WriteLine("-------------------------------------------");
            PhotoBook Pbook = new PhotoBook();
            Console.WriteLine("The total number of pages are: " + Pbook.GetNumberPages());

            PhotoBook Pbook1 = new PhotoBook(24);
            Console.WriteLine("The total number of pages are: " + Pbook1.GetNumberPages());

            BigPhotoBook BigPhotoBook1 = new BigPhotoBook();
            Console.WriteLine("The total number of pages are: " + BigPhotoBook1.GetNumberPages());
        }
    }
}
