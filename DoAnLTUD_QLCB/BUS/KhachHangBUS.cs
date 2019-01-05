using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;
using System.Data;

namespace BUS
{
    public class KhachHangBUS
    {
        private static KhachHangBUS instance;

        public static KhachHangBUS Instance
        {
            get
            {
                if (instance == null)
                    KhachHangBUS.instance = new KhachHangBUS();
                return instance;
            }
        }

        private KhachHangBUS() { }

        public DataTable TimKiemKhachHang(string CMND)
        {
            return KhachHangDAO.Instance.TimKiemKhachHang(CMND); 
        }
        public int ThemCMNDKhachHang(string CMND)
        {
            return KhachHangDAO.Instance.ThemCMNDKhachHang(CMND);
        }
        public int CapNhatKhachHang(KhachHang kh)
        {
            return KhachHangDAO.Instance.CapNhatKhachHang(kh);
        }
    }
}
