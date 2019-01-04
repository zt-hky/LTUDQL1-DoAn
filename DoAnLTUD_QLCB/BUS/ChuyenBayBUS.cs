using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows.Forms;
using DAO;

namespace BUS
{
    public class ChuyenBayBUS
    {

        private static ChuyenBayBUS instance;   

        public static ChuyenBayBUS Instance {
            get
            {
                if (instance == null)
                    ChuyenBayBUS.instance = new ChuyenBayBUS();
                return instance;
            }
         }

        private ChuyenBayBUS() { }

        public void LoadAll(DataGridView data)
        {
            data.DataSource = ChuyenBayDAO.Instance.getAll();
        }
    }
}
