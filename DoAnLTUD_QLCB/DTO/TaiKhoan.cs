using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TaiKhoan
    {
        private string username;
        private string password;
        private int loaiUSER;

       

        public string Password { get => password; set => password = value; }
        public int LoaiUSER { get => loaiUSER; set => loaiUSER = value; }
        public string Username { get => username; set => username = value; }
       

        public TaiKhoan(DataRow _row)
        {
            this.username = _row["username"].ToString();
            this.password = _row["password"].ToString();
            this.loaiUSER = int.Parse(_row["loaiUSER"].ToString());

        }
    }

   
}
