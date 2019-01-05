using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;
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

        //public KhachHang TimKiemKhachHang(string CMND)
        //{
        //    //return kh.TimKiemKhachHang(CMND);
        //}
    }
}
