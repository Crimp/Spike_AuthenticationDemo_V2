using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace ConsoleApplication2 {
    class Program {
        static void Main(string[] args) {
            ServiceReference1.Service1Client test = new ServiceReference1.Service1Client();
            Console.WriteLine(test.GetData(10));
            Console.ReadKey();
        }
    }
}
