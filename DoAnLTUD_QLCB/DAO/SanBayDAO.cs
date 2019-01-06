using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAO
{
    public class SanBayDAO
    {
        private static SanBayDAO instance;

        public static SanBayDAO Instance {
            get
            {
                if (instance == null)
                    SanBayDAO.instance = new SanBayDAO();
                return instance;

            }
        }

        private SanBayDAO() { }

        public List<SanBay> getAll()
        {
            List<SanBay> lstSB = new List<SanBay>();

            string query = "uc_getSanBayAll";

            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            
            foreach(DataRow row in dt.Rows)
            {
                SanBay sbnew = new SanBay(row);
                lstSB.Add(sbnew);
            }
            return lstSB;

        }

    }
}
