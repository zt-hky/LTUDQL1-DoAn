using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;
namespace BUS
{
    public class VeChuyenBayBUS
    {
        private static VeChuyenBayBUS instance;

        public static VeChuyenBayBUS Instance
        {
            get
            {
                if (instance == null)
                    VeChuyenBayBUS.instance = new VeChuyenBayBUS();
                return instance;
            }
        }
        public int XemGiaVe_DatCho(VeChuyenBay ve)
        {
            return VeChuyenBayDAO.Instance.XemGiaVe_DatCho(ve);
        }
        public int ThemVe_DatCho(VeChuyenBay ve)
        {
            return VeChuyenBayDAO.Instance.ThemVe_DatCho(ve);
        }
        public int TimKiemMaDatCho(int maKH, string maCB)
        {
            return VeChuyenBayDAO.Instance.TimKiemMaDatCho(maKH, maCB);
        }
        public int CapNhatLoaiVe_BanVe(int maDatCho)
        {
            return VeChuyenBayDAO.Instance.CapNhatLoaiVe_BanVe(maDatCho);
        }
    }
}
