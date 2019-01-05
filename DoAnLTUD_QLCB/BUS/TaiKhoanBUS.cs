using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class TaiKhoanBUS
    {
        private static TaiKhoanBUS instance;

        public static TaiKhoanBUS Instance {
            get
            {
                if (instance == null)
                    TaiKhoanBUS.instance = new TaiKhoanBUS();
                return instance;
            }
        }

        private TaiKhoanBUS() { }

        public int Login(string _user, string _password)
        {
            TaiKhoan tk = null;
            tk = TaiKhoanDAO.Instance.getByUsername(_user);
            if (tk == null)
                return -1;

            if (tk.Password == "" & _password == "")
                return tk.LoaiUSER ;

            if (tk.Password == _password)
                return tk.LoaiUSER;
            return -1;
        }
    }
}
