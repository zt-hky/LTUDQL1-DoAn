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
        public int ThemVe_DatCho(VeChuyenBay ve)
        {
            try
            {
                //@MaCB char(10),@MaKH int,@GheHang varchar(10),@NgayDat datetime
                string strSQL = "ThemVe_DatCho @MaCB , @MaKH , @GheHang , @NgayDat , @giaVe";
                int res = DataProvider.Instance.ExecuteNonQuery(strSQL, new object[] {ve.MaCB,ve.MaKH,ve.GheHang,ve.NgayDat,ve.GiaVe});
                return res;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public int XemGiaVe_DatCho(VeChuyenBay ve)
        {
            try
            {
                //@MaCB char(10),@GheHang varchar(10)
                int giaVe = 0;
                string strSQL = "GiaVe_DatCho @MaCB , @GheHang";
                DataTable dt = DataProvider.Instance.ExecuteQuery(strSQL, new object[] { ve.MaCB, ve.GheHang });
                if(dt.Rows.Count!=0)
                {
                    giaVe = int.Parse(dt.Rows[0]["Gia"].ToString());
                }
                return giaVe;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public int TimKiemMaDatCho(int maKH,string maCB)
        {
            try
            {
                int MaVe = 0;
                string strSQL = "TimKiemMaDatCho @MaKH , @MaCB";
                DataTable dt = DataProvider.Instance.ExecuteQuery(strSQL, new object[] { maKH,maCB });
                if (dt.Rows.Count != 0)
                {
                    MaVe = int.Parse(dt.Rows[0]["MaVe"].ToString());
                }
                return MaVe;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
