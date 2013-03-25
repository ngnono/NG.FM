using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NGnono.ExamplesApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("X = {0}, Y = {1}", A.X, B.Y);//⑤ 输出结果
            Console.ReadLine();
        }
    }



    class A
    {
        public static int X;

        static A() //④ 执行完后返回到③
        {
            X = B.Y + 1;
            Console.WriteLine("static A()");
        }
    }

    class B
    {
        public static int Y = A.X + 1; //③ 调用了A的静态成员,
        // 转到A的静态构造函数---->

        static B() //② 如果带有初始值设定项的静态字段,
        // 执行该类的静态构造函数时,
        // 先要按照文本顺序执行那些初始值设定项。
        // 转到初始值设定项---->
        {
            Console.WriteLine("static B()");
        }
    }
}

