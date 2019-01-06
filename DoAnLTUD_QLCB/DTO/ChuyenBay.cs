using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChuyenBay
    {
        public ChuyenBay() {  }

        public ChuyenBay(string maCB, string sBDi, string sBDen, 
            DateTime ngayGio, int tGBay, int sLGhe1, int sLGhe2, 
            int soGheTrong, int soGheDat, int soVe, float tyLe, float DoanhThu )
        {
            this.maCB = maCB;
            this.sBDi = sBDi;
            this.sBDen = sBDen;
            this.ngayGio = ngayGio;
            this.tGBay = tGBay;
            this.sLGhe1 = sLGhe1;
            this.sLGhe2 = sLGhe2;
            this.soGheTrong = soGheTrong;
            this.soGheDat = soGheDat;
            this.soVe = soVe;
            this.tyLe = tyLe;
            this.DoanhThu = DoanhThu;
    }
        public ChuyenBay(DataRow _row)
        {
            this.maCB = _row["MaCB"].ToString();
            this.sBDi = _row["SBDi"].ToString();
            this.sBDen = _row["SBDen"].ToString();
            this.ngayGio = DateTime.Parse( _row["NgayGio"].ToString());
            this.tGBay = int.Parse(_row["TGBay"].ToString());
            this.sLGhe1 = int.Parse(_row["SLGhe1"].ToString());
            this.sLGhe2 = int.Parse(_row["SLGhe2"].ToString());
            this.soGheTrong = int.Parse(_row["SoGheTrong"].ToString());
            this.soGheDat = int.Parse(_row["SoGheDat"].ToString());
            this.soVe = int.Parse(_row["SoVe"].ToString());
            this.tyLe = float.Parse(_row["TyLe"].ToString());
            this.doanhThu = float.Parse(_row["DoanhThu"].ToString());
        }


        private string maCB;
        private string sBDi;
        private string sBDen;
        private DateTime ngayGio;
        private int tGBay;
        private int sLGhe1;
        private int sLGhe2;
        private int soGheTrong;
        private int soGheDat;
        private int soVe;
        private float tyLe;
        private float doanhThu;

        public string MaCB { get => maCB; set => maCB = value; }
        public string SBDi { get => sBDi; set => sBDi = value; }
        public string SBDen { get => sBDen; set => sBDen = value; }
        public DateTime NgayGio { get => ngayGio; set => ngayGio = value; }
        public int TGBay { get => tGBay; set => tGBay = value; }
        public int SLGhe1 { get => sLGhe1; set => sLGhe1 = value; }
        public int SLGhe2 { get => sLGhe2; set => sLGhe2 = value; }
        public int SoGheTrong { get => soGheTrong; set => soGheTrong = value; }
        public int SoGheDat { get => soGheDat; set => soGheDat = value; }
        public int SoVe { get => soVe; set => soVe = value; }
        public float TyLe { get => tyLe; set => tyLe = value; }
        public float DoanhThu { get => doanhThu; set => doanhThu = value; }
    }
}
