using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;
namespace BUS
{
    public class VeChuyenBayBUS
    {
        private static VeChuyenBayBUS instance;

        public static VeChuyenBayBUS Instance
        {
            get
            {
                if (instance == null)
                    VeChuyenBayBUS.instance = new VeChuyenBayBUS();
                return instance;
            }
        }
        
    }
}
