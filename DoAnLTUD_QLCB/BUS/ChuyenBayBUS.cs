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

        public bool Delete(string MaCB)
        {

            if (VeChuyenBayDAO.Instance.countByMaCB(MaCB) > 0)
                return false;


            return ChuyenBayDAO.Instance.Delete(MaCB);
        }

        public bool checkMaCB(string MaCB)
        {
            return ChuyenBayDAO.Instance.checkMaCB(MaCB);
        }

        public ChuyenBay getByMaCB(string MaCB)
        {
            return ChuyenBayDAO.Instance.getByMaCB(MaCB);
        }

        public bool Insert(ChuyenBay cb, List<ChiTietChuyenBay> ct)
        {
            if(ChuyenBayDAO.Instance.Insert(cb))
            {
                if (ChiTietChuyenBayDAO.Instance.Insert(ct)) ;
                return true;
            }
            return false;
        }
    }
}
