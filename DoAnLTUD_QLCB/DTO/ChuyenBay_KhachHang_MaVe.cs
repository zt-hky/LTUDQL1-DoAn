using System;
using System.Data;

namespace DTO
{
    public class ChuyenBay_KhachHang_MaVe
    {
        int _maVe;
        int _maKH;
        string _tenKH;
        string _CMND;
        string _dienThoai;
        private string maCB;
        private string sBDi;
        private string sBDen;
        private DateTime ngayGio;
        public int MaVe
        {
            get
            {
                return _maVe;
            }

            set
            {
                _maVe = value;
            }
        }
        public int MaKH
        {
            get
            {
                return _maKH;
            }

            set
            {
                _maKH = value;
            }
        }
        public string CMND
        {
            get
            {
                return _CMND;
            }

            set
            {
                _CMND = value;
            }
        }
        public string TenKH
        {
            get
            {
                return _tenKH;
            }

            set
            {
                _tenKH = value;
            }
        }
        public string DienThoai
        {
            get
            {
                return _dienThoai;
            }

            set
            {
                _dienThoai = value;
            }
        }
        
        public string MaCB { get => maCB; set => maCB = value; }
        public string SBDi { get => sBDi; set => sBDi = value; }
        public string SBDen { get => sBDen; set => sBDen = value; }
        public DateTime NgayGio { get => ngayGio; set => ngayGio = value; }
        public ChuyenBay_KhachHang_MaVe()
        {

        }
        public ChuyenBay_KhachHang_MaVe(DataRow _row)
        {
            this._maKH = int.Parse(_row["MaKH"].ToString());
            this._tenKH = _row["TenKH"].ToString();
            this._CMND = _row["CMND"].ToString();
            this._dienThoai = _row["DienThoai"].ToString();
            this.maCB = _row["MaCB"].ToString();
            this.sBDi = _row["SBDi"].ToString();
            this.sBDen = _row["SBDen"].ToString();
            this.ngayGio = DateTime.Parse(_row["NgayGio"].ToString());
        }
    }
}
