using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SanBayDTO
    {
        public SanBayDTO(string maSB, string tenSB)
        {
            this.maSB = maSB;
            this.tenSB = tenSB;
        }

        private string maSB;
        private string tenSB;


        public string MaSB { get => maSB; set => maSB = value; }
        public string TenSB { get => tenSB; set => tenSB = value; }

       
    }
}
