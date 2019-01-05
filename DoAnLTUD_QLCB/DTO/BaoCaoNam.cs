using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class BaoCaoNam
    {
        int _thang;
        int _soChuyenBay;
        float _tyLe;
        float _doanhThu;

        public int Thang { get => _thang; set => _thang = value; }
        public int SoChuyenBay { get => _soChuyenBay; set => _soChuyenBay = value; }
        public float TyLe { get => _tyLe; set => _tyLe = value; }
        public float DoanhThu { get => _doanhThu; set => _doanhThu = value; }


    }
}
