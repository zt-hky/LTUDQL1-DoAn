using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
=======
>>>>>>> b6f5dd0be2d521c337c073c24c3bc10b99b97dee
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
<<<<<<< HEAD

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
=======
using System.Configuration;


namespace DAO
{
    class DataProvider 
    {
        private static DataProvider instance;

        private string connectionString;

        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return DataProvider.instance;
            }
          
        }

        private DataProvider()
        {
            this.connectionString = @"Data Source=HONGKY-G505\SQLEXPRESS;Initial Catalog=DoAnUDQL;User ID=sa;Password=123456";


        }

        // Dùng cho select
        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }

            return data;
        }

        // Dùng cho Insert, update, delete
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        // Lấy về dòng đầu tiên và cột đầu tiên: dùng cho count()
        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                data = command.ExecuteScalar();

                connection.Close();
            }

            return data;
        }

    }
}
>>>>>>> b6f5dd0be2d521c337c073c24c3bc10b99b97dee
