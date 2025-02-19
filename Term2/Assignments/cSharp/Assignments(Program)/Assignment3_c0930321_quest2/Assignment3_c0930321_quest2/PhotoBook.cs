using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_c0930321_quest2
{
    internal class PhotoBook
    {
        protected int numPages;

        public PhotoBook() {
            numPages = 16;
        }

        public PhotoBook(int pages)
        {
            numPages = pages;
        }

        public int GetNumberPages()
        {
            return numPages;
        }
    }
}
