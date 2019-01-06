using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class HangVeDAO
    {

        private static HangVeDAO instance;

        public static HangVeDAO Instance
        {
            get
            {
                if (instance == null)
                    HangVeDAO.instance = new HangVeDAO();
                return instance;
            }
        }

        public DataTable LoadHangVe()
        {
            string query = "LoadHangVe";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            return data;
        }

    }
}
