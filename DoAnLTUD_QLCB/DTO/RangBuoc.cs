using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class RangBuoc
    {
        private int pk;
        private int slSanBay;
        private int thoiGianBayMin;
        private int sbtgMax;
        private int tgDungMin;
        private int tgDungMax;
        private int slHangVe1;
        private int slHangVe2;
        private int tgDatVe;
        private int tgHuyVe;



        public int PK { get => pk; set => pk = value; }
        public int SLSanBay { get => slSanBay; set => slSanBay = value; }
        public int ThoiGianBayMin { get => thoiGianBayMin; set => thoiGianBayMin = value; }
        public int SBTGMax { get => sbtgMax; set => sbtgMax = value; }
        public int TGDungMin { get => tgDungMin; set => tgDungMin = value; }
        public int TGDungMax { get => tgDungMax; set => tgDungMax = value; }
        public int SLHangVe1 { get => slHangVe1; set => slHangVe1 = value; }
        public int SLHangVe2 { get => slHangVe2; set => slHangVe2 = value; }
        public int TGDatVe { get => tgDatVe; set => tgDatVe = value; }
        public int TGHuyVe { get => tgHuyVe; set => tgHuyVe = value; }


    }
}
