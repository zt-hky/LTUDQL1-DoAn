using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChiTietChuyenBayDTO
    {
        int _stt;
        string _maCB;
        string _maSBTG;
        int _tgDung;
        string _ghiChu;
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
