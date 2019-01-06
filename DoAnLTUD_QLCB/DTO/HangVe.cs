using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HangVe
    {
        int _maHangVe;
        string _tenHangVe;
        public int MaHangVe
        {
            get
            {
                return _maHangVe;
            }

            set
            {
                _maHangVe = value;
            }
        }
        public string TenHangVe
        {
            get
            {
                return _tenHangVe;
            }

            set
            {
                _tenHangVe = value;
            }
        }
    }
}
