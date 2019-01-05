using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class BaoCaoThang
    {
        string _maChuyenBay;
        int _soVe;
        float _tyLe;
        float _doanhThu;

        public string MaChuyenBay { get => _maChuyenBay; set => _maChuyenBay = value; }
        public int SoVe { get => _soVe; set => _soVe = value; }
        public float TyLe { get => _tyLe; set => _tyLe = value; }
        public float DoanhThu { get => _doanhThu; set => _doanhThu = value; }


    }
}
