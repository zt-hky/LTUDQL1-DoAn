using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    class DataProvider
    {
        //static string connectString;
        //static string nameCS = "sqlQLNX";
        static SqlConnection connect;

        //May vuong
        //string strConnect = @"Data Source=DESKTOP-ULBGH56\SQLEXPRESS;Initial Catalog=QuanLyChuyenDe;Integrated Security=True";
        //May trang
        string strConnect = string.Format("Server= {0}; Database={1};User Id={2};Password={3};", @"WINDEV1802EVAL", "QuanLyChuyenBay", "sa", "123456");
        public void Connect()
        {
            //connectString = ConfigurationManager.ConnectionStrings[nameCS].ConnectionString;
            try
            {
                if (connect == null)
                {
                    connect = new SqlConnection(strConnect);
                }
                if (connect.State != ConnectionState.Closed)
                {
                    connect.Close();
                }
                connect.Open();
            }
            catch (Exception e)
            {

                throw e;
            }
        }
        public SqlCommand CreateCommad()
        {
            if (connect.State == ConnectionState.Closed)
            {
                connect.Open();
            }
            var command = new SqlCommand();
            command.Connection = connect;
            return command;
        }

        public void Disconnect()
        {
            if (connect != null && connect.State == ConnectionState.Open)
            {
                connect.Close();
            }
        }

        // Dùng cho thêm xóa, sửa
        public int ExecuteNonQuery(CommandType cmdType, string strSQL, params SqlParameter[] paramater)
        {
            try
            {
                SqlCommand cmd = connect.CreateCommand();
                cmd.CommandText = strSQL;
                cmd.CommandType = cmdType;
                if (paramater != null && paramater.Length > 0)
                {
                    cmd.Parameters.AddRange(paramater);
                }
                int nRow = cmd.ExecuteNonQuery();

                return nRow;
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        // Dùng cho xem thôn tin
        public DataTable Select(CommandType cmdType, string strSQL, params SqlParameter[] paramater)
        {
            try
            {
                SqlCommand cmd = connect.CreateCommand();
                cmd.CommandText = strSQL;
                cmd.CommandType = cmdType;
                if (paramater != null && paramater.Length > 0)
                {
                    cmd.Parameters.AddRange(paramater);
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {

                throw e;
            }
        }
    }
}