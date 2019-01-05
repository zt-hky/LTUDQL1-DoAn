using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class UserBUS
    {
        private static UserBUS instance;

        public static UserBUS Instance {
            get
            {
                if (instance == null)
                    UserBUS.instance = new UserBUS();
                return instance;
            }
        }

        private UserBUS() { }

        public int Login(string _user, string _password)
        {


            return 0;
        }
    }
}
