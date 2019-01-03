using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;


namespace DAO
{
    public class ChuyenBayDAO
    {
        private static ChuyenBayDAO instance; 

        public static ChuyenBayDAO Instance {
            get
            {
                if (instance == null)
                    ChuyenBayDAO.instance = new ChuyenBayDAO();
                return instance;
            }
        }

        private ChuyenBayDAO() { }

    
    }
}
