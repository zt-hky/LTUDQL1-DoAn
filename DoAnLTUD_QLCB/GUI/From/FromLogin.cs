using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.From
{
    public partial class FromLogin : Form
    {
        public FromLogin()
        {
            InitializeComponent();

            this.tbPassword._TextBox.PasswordChar = '*';
            this.tbUsername._TextBox.KeyDown += new KeyEventHandler(textBox_KeyDown);
            this.tbPassword._TextBox.KeyDown += new KeyEventHandler(textBox_KeyDown);
        }

        private void bunifuTextbox2_OnTextChange(object sender, EventArgs e)
        {

        }

        private void bunifuFlatButton1_Click(object sender, EventArgs e)
        {

        }

        private void EventLogin(object sender, EventArgs e)
        {
            string username = this.tbUsername.text;
            string password = this.tbPassword.text;

            int login = TaiKhoanBUS.Instance.Login(username, password);

            switch (login)
            {
                case -1:
                    MessageBox.Show("Sai tên tài khoản hoặc mật khẩu", "Thông báo");
                    this.tbPassword.text = "";
                    break;
                case 0:
                    FrmMainNhanVien frmNhanVien = new FrmMainNhanVien();
                    this.Hide();
                    frmNhanVien.ShowDialog();
                    break;
                case 1:
                    FrmMainAdmin frmAdmin = new FrmMainAdmin();
                    this.Hide();
                    frmAdmin.ShowDialog();
                    break;
            }

            

        }

        private void textBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                EventLogin(this, new EventArgs());
            }
        }


        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void tbUsername_KeyPress(object sender, EventArgs e)
        {

        }
    }
}
