using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class HangVeBUS
    {
        private static HangVeBUS instance;

        public static HangVeBUS Instance
        {
            get
            {
                if (instance == null)
                    HangVeBUS.instance = new HangVeBUS();
                return instance;
            }
        }

        private HangVeBUS() { }

        public DataTable LoadHangVe()
        {
            return HangVeDAO.Instance.LoadHangVe();
        }

    }
}
