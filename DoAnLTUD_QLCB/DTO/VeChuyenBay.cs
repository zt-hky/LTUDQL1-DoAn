using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class VeChuyenBay
    {
        int _loai;// 0:dat cho, 1: da ban
        string _maCB;
        int _maKH;
        string _gheHang;
        DateTime _ngayDat;
        int _giaVe;
        int _maVe;
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
        public string MaCB
        {
            get
            {
                return _maCB;
            }

            set
            {
                _maCB = value;
            }
        }
        public string GheHang
        {
            get
            {
                return _gheHang;
            }

            set
            {
                _gheHang = value;
            }
        }
        public int Loai
        {
            get
            {
                return _loai;
            }

            set
            {
                _loai = value;
            }
        }
        public DateTime NgayDat
        {
            get
            {
                return _ngayDat;
            }

            set
            {
                _ngayDat = value;
            }
        }
        public int GiaVe
        {
            get
            {
                return _giaVe;
            }

            set
            {
                _giaVe = value;
            }
        }
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
        public VeChuyenBay(DataRow row)
        {
            this._gheHang = row["GheHang"].ToString();
            //Loai 0: đặt chổ, 1: đã mua vé
            this._loai = int.Parse(row["Loai"].ToString());
            this._maCB = row["MaCB"].ToString();
            this._maKH = int.Parse(row["MaKH"].ToString());
            this._ngayDat = DateTime.Parse(row["NgayDat"].ToString());
            this._giaVe = int.Parse(row["GiaVe"].ToString());
            this._maVe = int.Parse(row["MaVe"].ToString());
        }
    }
}
