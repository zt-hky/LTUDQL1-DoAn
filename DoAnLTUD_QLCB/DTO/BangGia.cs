using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class BangGia
    {
        private string sbDi;
        private string sbDen;
        private int gheHang;
        private float gia;

        public string SBDi { get => sbDi; set => sbDi = value; }
        public string SBDen { get => sbDen; set => sbDen = value; }
        public int GheHang { get => gheHang; set => gheHang = value; }
        public float Gia { get => gia; set => gia = value; }
    }
}
