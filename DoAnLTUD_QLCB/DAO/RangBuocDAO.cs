using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class RangBuocDAO
    {
        private static RangBuocDAO instance;

        public static RangBuocDAO Instance
        {
            get
            {
                if (instance == null)
                    RangBuocDAO.instance = new RangBuocDAO();
                return instance;
            }
        }
        
        //Load toan bo danh sach RangBuoc
        public DataTable LoadRangBuoc()
        {
            string query = "LoadRangBuoc";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            return data;
        }

        //Update So luong san bay
        public int UpdateSoLuongSanBay(RangBuoc rb)
        {
            try
            {
                string strSQL = "ThayDoiSoLuongSanBay @slSanBay";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { rb.SLSanBay });
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int UpdateThoiGianBayToiThieu(RangBuoc rb)
        {
            try
            {
                string strSQL = "ThayDoiThoiGianBayMin @thoiGianBayMin";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { rb.ThoiGianBayMin });
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int UpdateSoLuongSanBayTrungGian(RangBuoc rb)
        {
            try
            {
                string strSQL = "ThayDoiSanBayTrungGianMax @sbMax";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { rb.SBTGMax });
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int UpdateThoiGianDung(RangBuoc rb)
        {
            try
            {
                string strSQL = "ThayDoiThoiGianDung @tgMin , @tgMax";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { rb.TGDungMin , rb.TGDungMax });
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
