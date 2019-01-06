using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChiTietChuyenBay
    {
        int _stt;
        string _maCB;
        string _maSBTG;
        int _tgDung;
        string _ghiChu;
        private DataRow row;

        public ChiTietChuyenBay(DataRow row)
        {
            this._stt = int.Parse(row["STT"].ToString());
            this._maCB = row["MaCB"].ToString();
            this._maSBTG = row["MaSBTG"].ToString();
            this._tgDung = int.Parse(row["TGDung"].ToString());
            this._ghiChu = row["GhiChu"].ToString();
        }

        public int STT
        {
            get
            {
                return _stt;
            }

            set
            {
                _stt = value;
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
        public string MaSBTG
        {
            get
            {
                return _maSBTG;
            }

            set
            {
                _maSBTG = value;
            }
        }
        public string GhiChu
        {
            get
            {
                return _ghiChu;
            }

            set
            {
                _ghiChu = value;
            }
        }
        public int TGDung
        {
            get
            {
                return _tgDung;
            }

            set
            {
                _tgDung = value;
            }
        }
    }
}
