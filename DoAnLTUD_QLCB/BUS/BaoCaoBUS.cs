using DAO;
using System;
using System.Collections.Generic;
using System.Data;
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

        public DataTable ThongKeThang(int thang, int nam)
        {
            return BaoCaoDAO.Instance.ThongKeThang(thang, nam);
        }

        public DataTable ThongKeNam(int nam)
        {
            return BaoCaoDAO.Instance.ThongKeNam(nam);
        }
    }
}
