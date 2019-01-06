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
    public class BangGiaBUS
    {
        private static BangGiaBUS instance;

        public static BangGiaBUS Instance
        {
            get
            {
                if (instance == null)
                    BangGiaBUS.instance = new BangGiaBUS();
                return instance;
            }
        }

        private BangGiaBUS() { }

        public DataTable LoadDonGia(BangGia bg)
        {
            return BangGiaDAO.Instance.LoadDonGia(bg);
        }

        public int UpdateDonGia(BangGia bg)
        {
            return BangGiaDAO.Instance.UpdateDonGia(bg);
        }
    }
}
