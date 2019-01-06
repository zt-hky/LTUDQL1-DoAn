namespace GUI
{
    partial class FrmMainNhanVien
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnBanVe = new System.Windows.Forms.Button();
            this.btnDatCho = new System.Windows.Forms.Button();
            this.btnNhanLichChuyenBay = new System.Windows.Forms.Button();
            this.btnTraCuuKhachHang = new System.Windows.Forms.Button();
            this.btnTraCuuCB = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnThoat = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel
            // 
            this.panel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel.Location = new System.Drawing.Point(222, 63);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(702, 547);
            this.panel.TabIndex = 5;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnBanVe);
            this.panel2.Controls.Add(this.btnDatCho);
            this.panel2.Controls.Add(this.btnNhanLichChuyenBay);
            this.panel2.Controls.Add(this.btnTraCuuKhachHang);
            this.panel2.Controls.Add(this.btnTraCuuCB);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(0, 63);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(222, 547);
            this.panel2.TabIndex = 4;
            // 
            // btnBanVe
            // 
            this.btnBanVe.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnBanVe.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBanVe.Location = new System.Drawing.Point(0, 435);
            this.btnBanVe.Name = "btnBanVe";
            this.btnBanVe.Size = new System.Drawing.Size(222, 109);
            this.btnBanVe.TabIndex = 32;
            this.btnBanVe.Text = "Bán vé";
            this.btnBanVe.UseVisualStyleBackColor = false;
            this.btnBanVe.Click += new System.EventHandler(this.btnBanVe_Click);
            // 
            // btnDatCho
            // 
            this.btnDatCho.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnDatCho.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDatCho.Location = new System.Drawing.Point(1, 326);
            this.btnDatCho.Name = "btnDatCho";
            this.btnDatCho.Size = new System.Drawing.Size(222, 109);
            this.btnDatCho.TabIndex = 31;
            this.btnDatCho.Text = "Đặt chổ";
            this.btnDatCho.UseVisualStyleBackColor = false;
            this.btnDatCho.Click += new System.EventHandler(this.btnDatCho_Click);
            // 
            // btnNhanLichChuyenBay
            // 
            this.btnNhanLichChuyenBay.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnNhanLichChuyenBay.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNhanLichChuyenBay.Location = new System.Drawing.Point(0, 220);
            this.btnNhanLichChuyenBay.Name = "btnNhanLichChuyenBay";
            this.btnNhanLichChuyenBay.Size = new System.Drawing.Size(222, 109);
            this.btnNhanLichChuyenBay.TabIndex = 30;
            this.btnNhanLichChuyenBay.Text = "Nhận lịch chuyến bay";
            this.btnNhanLichChuyenBay.UseVisualStyleBackColor = false;
            this.btnNhanLichChuyenBay.Click += new System.EventHandler(this.btnNhanLichChuyenBay_Click);
            // 
            // btnTraCuuKhachHang
            // 
            this.btnTraCuuKhachHang.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnTraCuuKhachHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTraCuuKhachHang.Location = new System.Drawing.Point(0, 110);
            this.btnTraCuuKhachHang.Name = "btnTraCuuKhachHang";
            this.btnTraCuuKhachHang.Size = new System.Drawing.Size(222, 109);
            this.btnTraCuuKhachHang.TabIndex = 29;
            this.btnTraCuuKhachHang.Text = "Tra cứu khách hàng";
            this.btnTraCuuKhachHang.UseVisualStyleBackColor = false;
            this.btnTraCuuKhachHang.Click += new System.EventHandler(this.btnTraCuuKhachHang_Click);
            // 
            // btnTraCuuCB
            // 
            this.btnTraCuuCB.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnTraCuuCB.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTraCuuCB.Location = new System.Drawing.Point(-3, 0);
            this.btnTraCuuCB.Name = "btnTraCuuCB";
            this.btnTraCuuCB.Size = new System.Drawing.Size(222, 109);
            this.btnTraCuuCB.TabIndex = 28;
            this.btnTraCuuCB.Text = "Tra cứu chuyến bay";
            this.btnTraCuuCB.UseVisualStyleBackColor = false;
            this.btnTraCuuCB.Click += new System.EventHandler(this.btnTraCuuCB_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panel1.Controls.Add(this.btnThoat);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(924, 63);
            this.panel1.TabIndex = 3;
            // 
            // btnThoat
            // 
            this.btnThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.Location = new System.Drawing.Point(814, 12);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(107, 44);
            this.btnThoat.TabIndex = 3;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(344, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(158, 29);
            this.label1.TabIndex = 2;
            this.label1.Text = " NHÂN VIÊN";
            // 
            // FrmMainNhanVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(924, 610);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "FrmMainNhanVien";
            this.Text = "FrmMainNhanVien";
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnBanVe;
        private System.Windows.Forms.Button btnDatCho;
        private System.Windows.Forms.Button btnNhanLichChuyenBay;
        private System.Windows.Forms.Button btnTraCuuKhachHang;
        private System.Windows.Forms.Button btnTraCuuCB;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.Label label1;
    }
}