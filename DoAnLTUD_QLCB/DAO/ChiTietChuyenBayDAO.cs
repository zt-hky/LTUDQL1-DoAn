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

        public bool Insert(List<ChiTietChuyenBay> cts)
        {
            string sql = "uc_InsertCTTB @stt , @MaCB , @SBTG , @TGDung , @ghichu ";
            foreach (ChiTietChuyenBay ct in cts)
            {
                int n = DataProvider.Instance.ExecuteNonQuery(sql, new object[] { ct.STT, ct.MaCB, ct.MaSBTG, ct.TGDung, ct.GhiChu });
                if (n == 0)
                    return false;
            }
            return true;
        }
    }
}
