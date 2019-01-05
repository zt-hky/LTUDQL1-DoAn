using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;



namespace DAO
{
    public class TaiKhoanDAO
    {
        private static TaiKhoanDAO instance;

        public static TaiKhoanDAO Instance
        {
            get
            {
                if (instance == null)
                    TaiKhoanDAO.instance = new TaiKhoanDAO();
                return instance;
            }
        }

        public TaiKhoan getByUsername(string _username)
        {
            string query = "EXEC dbo.uc_getTK_by_Username @username";
            TaiKhoan new_tk = null;
            DataTable kq = DataProvider.Instance.ExecuteQuery(query, new object[] { _username });
            if (kq.Rows.Count > 0)
                new_tk = new TaiKhoan(kq.Rows[0]);
            return new_tk;

        }
    }
}
