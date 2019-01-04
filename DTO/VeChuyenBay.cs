using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    class VeChuyenBay
    {
        int _loai;// 0:dat cho, 1: da ban
        string _maCB;
        string _maKH;
        string _gheHang;
        DateTime _ngayDat;
        public string MaKH
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
    }
}
