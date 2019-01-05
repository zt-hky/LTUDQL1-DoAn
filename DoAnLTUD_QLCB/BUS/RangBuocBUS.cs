using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class RangBuocBUS
    {
        private static RangBuocBUS instance;

        public static RangBuocBUS Instance
        {
            get
            {
                if (instance == null)
                    RangBuocBUS.instance = new RangBuocBUS();
                return instance;
            }
        }

        private RangBuocBUS() { }

        public DataTable LoadRangBuoc()
        {
            return RangBuocDAO.Instance.LoadRangBuoc();
        }

        public int UpdateSoLuongSanBay(RangBuoc rb)
        {
            return RangBuocDAO.Instance.UpdateSoLuongSanBay(rb);
        }

        public int UpdateThoiGianBayToiThieu(RangBuoc rb)
        {
            return RangBuocDAO.Instance.UpdateThoiGianBayToiThieu(rb);
        }

        public int UpdateSoLuongSanBayTrungGian(RangBuoc rb)
        {
            return RangBuocDAO.Instance.UpdateSoLuongSanBayTrungGian(rb);
        }

        public int UpdateThoiGianDung(RangBuoc rb)
        {
            return RangBuocDAO.Instance.UpdateThoiGianDung(rb);
        }
    }
}
