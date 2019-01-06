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

        public ChuyenBay getByMaCB(string maCB)
        {
            string sql = "uc_getChuyenBayByMaCB  @MaCB";
            DataTable dt =  DataProvider.Instance.ExecuteQuery(sql, new object[] { maCB });

            ChuyenBay cb = new ChuyenBay(dt.Rows[0]);
                return cb;
        }
        public bool checkMaCB(string MaCB)
        {
            string query = "uc_checkMaCB @MaCB";
            return (int)DataProvider.Instance.ExecuteScalar(query, new object[] { MaCB }) > 0;
        }

        public bool Delete(string MaCB)
        {
            string sql = "uc_deleteChuyenBay @MACB";
            return DataProvider.Instance.ExecuteNonQuery(sql, new object[] { MaCB }) > 0;
        }

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

        public bool Insert(ChuyenBay cb)
        {
            string sql = "uc_ChuyenBayInsert @MaCB , @SBDi , @SBDen , @NgayGio ,  @TGbay , @SLGhe1 , @SLGhe2";
            return DataProvider.Instance.ExecuteNonQuery(sql, new object[] { cb.MaCB, cb.SBDi, cb.SBDen, cb.NgayGio, cb.TGBay, cb.SLGhe1, cb.SLGhe2 }) > 0;
        }

        //=========================== 1660637 - TRANG =======================
        public List<ChuyenBay> DatCho_DanhSachChuyenBay()
        {
            List<ChuyenBay> ds = new List<ChuyenBay>();
            string query = "DatCho_DanhSachChuyenBay";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                ChuyenBay cb = new ChuyenBay(item);
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
