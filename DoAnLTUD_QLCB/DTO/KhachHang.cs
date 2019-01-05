using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class KhachHang
    {
        int _maKH;
        string _tenKH;
        string _CMND;
        string _dienThoai;
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
        public KhachHang()
        {

        }
        public KhachHang(DataRow _row)
        {
            this._maKH = int.Parse(_row["MaKH"].ToString());
            this._tenKH = _row["TenKH"].ToString();
            this._CMND = _row["CMND"].ToString();
            this._dienThoai = _row["DienThoai"].ToString();
        }

    }
}
