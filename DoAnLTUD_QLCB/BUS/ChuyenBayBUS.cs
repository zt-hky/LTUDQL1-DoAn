using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows.Forms;
using DAO;
using DTO;
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

        public List<ChuyenBay> getAll()
        {
            return ChuyenBayDAO.Instance.getAll();
        }

        public List<ChuyenBay> DatCho_DanhSachChuyenBay()
        {
            return ChuyenBayDAO.Instance.DatCho_DanhSachChuyenBay();
        }
        public ChuyenBay TimKiemChuyenBay(string MaCB)
        {
            return ChuyenBayDAO.Instance.TimKiemChuyenBay(MaCB);
        }
    }
}
