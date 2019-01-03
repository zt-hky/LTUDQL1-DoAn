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

            string query = "select * from users";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                ChuyenBay newChuyenBay = new ChuyenBay(item);

                chuyenBays.Add(newChuyenBay);
            }
            return chuyenBays;
        }
    }
}
