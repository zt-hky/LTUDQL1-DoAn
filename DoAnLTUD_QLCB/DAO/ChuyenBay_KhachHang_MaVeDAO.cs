using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace DAO
{
    public class ChuyenBay_KhachHang_MaVeDAO
    {
        private static ChuyenBay_KhachHang_MaVeDAO instance;

        public static ChuyenBay_KhachHang_MaVeDAO Instance
        {
            get
            {
                if (instance == null)
                    ChuyenBay_KhachHang_MaVeDAO.instance = new ChuyenBay_KhachHang_MaVeDAO();
                return instance;
            }
        }

        public ChuyenBay_KhachHang_MaVe ThongTinDatCho(int maVe)
        {
            string query = "ThongTinDatCho @maVe";
            ChuyenBay_KhachHang_MaVe cb = null;
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { maVe });
            if (data.Rows.Count != 0)
            {
                cb = new ChuyenBay_KhachHang_MaVe(data.Rows[0]);
            }
            return cb;
        }
    }
}
