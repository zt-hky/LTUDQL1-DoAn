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
        //Sai roi
        public List<VeChuyenBay> DatCho_DanhSachChuyenBay()
        {
            List<VeChuyenBay> ds = new List<VeChuyenBay>();
            string query = "DatCho_DanhSachChuyenBay";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach(DataRow item in data.Rows)
            {
                VeChuyenBay ve = new VeChuyenBay(item);
                ds.Add(ve);
            }
            return ds;
        }
    }
}
