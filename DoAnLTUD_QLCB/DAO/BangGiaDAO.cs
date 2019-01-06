using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class BangGiaDAO
    {
        private static BangGiaDAO instance;

        public static BangGiaDAO Instance
        {
            get
            {
                if (instance == null)
                    BangGiaDAO.instance = new BangGiaDAO();
                return instance;
            }
        }

        public DataTable LoadDonGia(BangGia bg)
        {
            string query = "loadDonGia @sbDi , @sbDen , @hang";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { bg.SBDi, bg.SBDen, bg.GheHang });
            return data;
        }

        public int UpdateDonGia(BangGia bg)
        {
            try
            {
                string strSQL = "ThayDoiDonGia @sbDi , @sbDen , @hang , @gia";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { bg.SBDi, bg.SBDen, bg.GheHang, bg.Gia });
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
