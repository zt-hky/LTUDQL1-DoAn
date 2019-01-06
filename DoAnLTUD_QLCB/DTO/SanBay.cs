using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SanBay
    {
        public SanBay(string maSB, string tenSB)
        {
            this.maSB = maSB;
            this.tenSB = tenSB;
        }

        public SanBay(DataRow _row)
        {
            this.maSB = _row["maSB"].ToString();
            this.tenSB = _row["tenSB"].ToString();
        }

        private string maSB;
        private string tenSB;

        public SanBay() { }


        public string MaSB { get => maSB; set => maSB = value; }
        public string TenSB { get => tenSB; set => tenSB = value; }

       
    }
}
