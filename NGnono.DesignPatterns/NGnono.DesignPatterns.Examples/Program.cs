using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NGnono.DesignPatterns.Examples
{
    class Program
    {
        static void Main(string[] args)
        {
            //策略模式
            StrategyApp strategy = new StrategyApp(3.ToString());

            Console.ReadLine();
        }
    }
}
