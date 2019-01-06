using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;
namespace BUS
{
    public class ChuyenBay_KhachHang_MaVeBUS
    {
        private static ChuyenBay_KhachHang_MaVeBUS instance;

        public static ChuyenBay_KhachHang_MaVeBUS Instance
        {
            get
            {
                if (instance == null)
                    ChuyenBay_KhachHang_MaVeBUS.instance = new ChuyenBay_KhachHang_MaVeBUS();
                return instance;
            }
        }

        public ChuyenBay_KhachHang_MaVe ThongTinDatCho(int maVe)
        {
            return ChuyenBay_KhachHang_MaVeDAO.Instance.ThongTinDatCho(maVe);
        }
    }
}
