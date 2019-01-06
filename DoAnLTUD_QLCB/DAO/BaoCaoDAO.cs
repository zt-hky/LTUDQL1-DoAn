using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class BaoCaoDAO
    {
        private static BaoCaoDAO instance;

        public static BaoCaoDAO Instance
        {
            get
            {
                if (instance == null)
                    BaoCaoDAO.instance = new BaoCaoDAO();
                return instance;
            }
        }
    }
}
