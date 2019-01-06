using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class ChiTietChuyenBayBUS
    {
        private static ChiTietChuyenBayBUS instance;

        public  static ChiTietChuyenBayBUS Instance {
            get
            {
                if (instance == null)
                    ChiTietChuyenBayBUS.instance = new ChiTietChuyenBayBUS();
                return instance;
             }
        }

        private ChiTietChuyenBayBUS() { }

        public List<ChiTietChuyenBay> getByMaCB(string MaCB)
        {
            return ChiTietChuyenBayDAO.Instance.getByMaCB(MaCB);
        }
    }
}
