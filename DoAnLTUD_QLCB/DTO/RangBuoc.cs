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
        private int slHangVe;
        private DateTime tgDatVe;
        private DateTime tgHuyVe;



        public int PK { get => pk; set => pk = value; }
        public int SLSanBay { get => slSanBay; set => slSanBay = value; }
        public int ThoiGianBayMin { get => thoiGianBayMin; set => thoiGianBayMin = value; }
        public int SBTGMax { get => sbtgMax; set => sbtgMax = value; }
        public int TGDungMin { get => tgDungMin; set => tgDungMin = value; }
        public int TGDungMax { get => tgDungMax; set => tgDungMax = value; }
        public int SLHangVe { get => slHangVe; set => slHangVe = value; }
        public DateTime TGDatVe { get => tgDatVe; set => tgDatVe = value; }
        public DateTime TGHuyVe { get => tgHuyVe; set => tgHuyVe = value; }


    }
}
