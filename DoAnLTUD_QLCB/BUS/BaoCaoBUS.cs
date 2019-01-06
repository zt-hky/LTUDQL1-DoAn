using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BaoCaoBUS
    {
        private static BaoCaoBUS instance;

        public static BaoCaoBUS Instance
        {
            get
            {
                if (instance == null)
                    BaoCaoBUS.instance = new BaoCaoBUS();
                return instance;
            }
        }

        private BaoCaoBUS() { }

    }
}
