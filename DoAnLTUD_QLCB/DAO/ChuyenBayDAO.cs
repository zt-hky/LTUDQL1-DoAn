using System;
using System.Collections.Generic;
using System.Data;
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

        public List<ChuyenBay> getAll()
        {
            List<ChuyenBay> chuyenBays = new List<ChuyenBay>();

            string query = "select * from CHUYENBAY";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                ChuyenBay newChuyenBay = new ChuyenBay(item);

                chuyenBays.Add(newChuyenBay);
            }
            return chuyenBays;
        }
        //=========================== 1660637 - TRANG =======================
        public List<string> DatCho_DanhSachChuyenBay()
        {
            List<string> ds = new List<string>();
            string query = "DatCho_DanhSachChuyenBay";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                string cb = item.ToString();
                ds.Add(cb);
            }
            return ds;
        }
        public DataTable TimKiemKhachHang(string CMND)
        {
            string query = "TimKiemKhachHang @CMND";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { CMND });
            return data;
        }
        public ChuyenBay TimKiemChuyenBay(string MaCB)
        {
            string query = "TimKiemChuyenBay @MaCB";
            ChuyenBay cb = null;
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { MaCB });
            if(data.Rows.Count !=0)
            {
                cb = new ChuyenBay(data.Rows[0]);
            }
            return cb;
        }
        //========================== Het phần của 1660647 - Trang =======================
    }
}
