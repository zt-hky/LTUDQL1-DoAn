using DTO;
using System;
using System.Collections.Generic;
using System.Data;
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

        public DataTable ThongKeThang(int thang, int nam) 
        {
            string query = "ThongKeThang @thang , @nam";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { thang, nam });
            return data;
        }

        public DataTable ThongKeNam(int nam)
        {
            string query = "ThongKeNam @nam";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { nam });
            return data;
        }



    }
}
