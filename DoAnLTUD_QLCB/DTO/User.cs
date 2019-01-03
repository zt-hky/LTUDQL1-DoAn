using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class User
    {
        private string user;
        private string password;
        private string loaiUSER;

       

        public string Password { get => password; set => password = value; }
        public string LoaiUSER { get => loaiUSER; set => loaiUSER = value; }
        public string USER { get => user; set => user = value; }
    }
}
