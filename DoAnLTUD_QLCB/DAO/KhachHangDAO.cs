using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace DAO
{
    public class KhachHangDAO
    {
        private static KhachHangDAO instance;

        public static KhachHangDAO Instance
        {
            get
            {
                if (instance == null)
                    KhachHangDAO.instance = new KhachHangDAO();
                return instance;
            }
        }

        private KhachHangDAO() { }

        public DataTable TimKiemKhachHang(string CMND)
        {
            string query = "TimKiemKhachHang @CMND";
            DataTable data = DataProvider.Instance.ExecuteQuery(query,new object[] { CMND});
            return data;
        }
        public int ThemCMNDKhachHang(string CMND)
        {
            try
            {
                // ThemCMNDKhachHang
                //@CMND char(10),@ketQua int out
                string strSQL = "ThemCMNDKhachHang @CMND";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] { CMND });
                return res;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public int CapNhatKhachHang(KhachHang kh)
        {
            try
            {
                // ThemCMNDKhachHang
                //@CMND char(10),@ketQua int out
                string strSQL = "CapNhatKhachHang @CMND,@MaKH,@TenKH,@DienThoai";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] {kh.CMND,kh.MaKH,kh.TenKH,kh.DienThoai });
                return res;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
