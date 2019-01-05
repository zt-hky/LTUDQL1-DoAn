using System;
using System.Collections.Generic;
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

        public KhachHang TimKiemKhachHang(string CMND)
        {
            KhachHang kh = new KhachHang();
            return kh;
        }

    }
}
