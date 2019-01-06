using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class ChiTietChuyenBayDAO
    {
        private static ChiTietChuyenBayDAO instance;

        public static ChiTietChuyenBayDAO Instance
        {
            get
            {
                if (instance == null)
                    ChiTietChuyenBayDAO.instance = new ChiTietChuyenBayDAO();
                return instance;
            }
        }

        private ChiTietChuyenBayDAO() { }

        public List<ChiTietChuyenBay> getByMaCB(string MaCB)
        {
            List<ChiTietChuyenBay> lstCTCB = new List<ChiTietChuyenBay>();

            string query = "uc_getCTCBbyMaSB @MaSB";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query, new object[] { MaCB });

            foreach (DataRow row in dt.Rows)
            {
                ChiTietChuyenBay cctb = new ChiTietChuyenBay(row);
                lstCTCB.Add(cctb);
            }

            return lstCTCB;
        }
    }
}
