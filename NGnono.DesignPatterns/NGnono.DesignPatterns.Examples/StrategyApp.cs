using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NGnono.DesignPatterns.StrategyPattern;

namespace NGnono.DesignPatterns.Examples
{
    public class StrategyApp
    {
        StrategyContext context;

        public StrategyApp(string type)
        {
            context = new StrategyContext(type);
            var result = context.Algorithmlnterface();

            Console.WriteLine(result);
        }
    }
}
