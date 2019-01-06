using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace DAO
{
    public class VeChuyenBayDAO
    {
        private static VeChuyenBayDAO instance;

        public static VeChuyenBayDAO Instance
        {
            get
            {
                if (instance == null)
                    VeChuyenBayDAO.instance = new VeChuyenBayDAO();
                return instance;
            }
        }
      
    }
}
