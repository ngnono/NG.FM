using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NGnono.DesignPatterns.StrategyPattern
{
    /// <summary>
    /// 策略模式
    /// </summary>
    public abstract class Strategy
    {
        public abstract string Algorithmlnterface();
    }

    public class Strategy1 : Strategy
    {
        public override string Algorithmlnterface()
        {
            return this.ToString();
        }
    }

    public class Strategy2 : Strategy
    {
        public override string Algorithmlnterface()
        {
            return this.ToString();
        }
    }

    /// <summary>
    /// 策略模式 上下文
    /// </summary>
    public class StrategyContext
    {
        private Strategy strategy;

        public StrategyContext(string type)
        {
            //加入简单工厂
            switch (type)
            {
                case "1":
                    this.strategy = new Strategy1();
                    break;
                case "2":
                    this.strategy = new Strategy2();
                    break;
                default:
                    this.strategy = null;
                    break;
            }
        }

        public string Algorithmlnterface()
        {
            if (strategy == null)
            {
                throw new ArgumentNullException("strategy");
            }

            return strategy.Algorithmlnterface();
        }
    }
}
