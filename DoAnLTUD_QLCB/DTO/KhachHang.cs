using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
<<<<<<< HEAD:DoAnLTUD_QLCB/DTO/KhachHangDTO.cs
    public class KhachHangDTO
=======
    public class KhachHang
>>>>>>> b6f5dd0be2d521c337c073c24c3bc10b99b97dee:DoAnLTUD_QLCB/DTO/KhachHang.cs
    {
        string _maKH;
        string _tenKH;
        string _CMND;
        string _dienThoai;
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
    }
}
