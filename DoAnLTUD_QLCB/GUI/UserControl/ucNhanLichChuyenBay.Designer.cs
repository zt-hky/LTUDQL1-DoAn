namespace GUI
{
    partial class ucNhanLichChuyenBay
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label9 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dgwSBTrungGian = new System.Windows.Forms.DataGridView();
            this.STT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SBTrungGian = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.TGDung = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GhiChu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dtpTime = new System.Windows.Forms.DateTimePicker();
            this.cbSBDen = new System.Windows.Forms.ComboBox();
            this.cbSBDi = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.tbSLGhe2 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.tbSLGhe1 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.tbTGBay = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txMaCB = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgwChuyenBay = new System.Windows.Forms.DataGridView();
            this.MaCB = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ThoiGian = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TGBay = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SBDi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SBDen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SLGhe1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SLGhe2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.panel1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwSBTrungGian)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgwChuyenBay)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(206, 8);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(320, 29);
            this.label9.TabIndex = 3;
            this.label9.Text = "NHẬN LỊCH CHUYẾN BAY";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panel1.Controls.Add(this.label9);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(702, 42);
            this.panel1.TabIndex = 22;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dgwSBTrungGian);
            this.groupBox1.Controls.Add(this.dtpTime);
            this.groupBox1.Controls.Add(this.cbSBDen);
            this.groupBox1.Controls.Add(this.cbSBDi);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.tbSLGhe2);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.tbSLGhe1);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.tbTGBay);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txMaCB);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(13, 53);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(676, 224);
            this.groupBox1.TabIndex = 23;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin Chuyến bay";
            // 
            // dgwSBTrungGian
            // 
            this.dgwSBTrungGian.AllowUserToAddRows = false;
            this.dgwSBTrungGian.AllowUserToDeleteRows = false;
            this.dgwSBTrungGian.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgwSBTrungGian.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgwSBTrungGian.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STT,
            this.SBTrungGian,
            this.TGDung,
            this.GhiChu});
            this.dgwSBTrungGian.Location = new System.Drawing.Point(267, 52);
            this.dgwSBTrungGian.Name = "dgwSBTrungGian";
            this.dgwSBTrungGian.Size = new System.Drawing.Size(390, 153);
            this.dgwSBTrungGian.TabIndex = 4;
            // 
            // STT
            // 
            this.STT.HeaderText = "STT";
            this.STT.Name = "STT";
            this.STT.ReadOnly = true;
            // 
            // SBTrungGian
            // 
            this.SBTrungGian.HeaderText = "Sân bay trung gian";
            this.SBTrungGian.Name = "SBTrungGian";
            // 
            // TGDung
            // 
            this.TGDung.HeaderText = "TG Dừng";
            this.TGDung.Name = "TGDung";
            // 
            // GhiChu
            // 
            this.GhiChu.HeaderText = "Ghi Chú";
            this.GhiChu.Name = "GhiChu";
            // 
            // dtpTime
            // 
            this.dtpTime.CustomFormat = "HH:mm   dd/MM/yyyy";
            this.dtpTime.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpTime.Location = new System.Drawing.Point(19, 96);
            this.dtpTime.Name = "dtpTime";
            this.dtpTime.Size = new System.Drawing.Size(135, 20);
            this.dtpTime.TabIndex = 3;
            // 
            // cbSBDen
            // 
            this.cbSBDen.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbSBDen.FormattingEnabled = true;
            this.cbSBDen.Location = new System.Drawing.Point(19, 184);
            this.cbSBDen.Name = "cbSBDen";
            this.cbSBDen.Size = new System.Drawing.Size(135, 21);
            this.cbSBDen.TabIndex = 2;
            // 
            // cbSBDi
            // 
            this.cbSBDi.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbSBDi.FormattingEnabled = true;
            this.cbSBDi.Location = new System.Drawing.Point(19, 140);
            this.cbSBDi.Name = "cbSBDi";
            this.cbSBDi.Size = new System.Drawing.Size(135, 21);
            this.cbSBDi.TabIndex = 2;
            this.cbSBDi.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 168);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Sân bay đến";
            this.label3.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 124);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Sân bay đi";
            this.label2.Click += new System.EventHandler(this.label1_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(171, 168);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Số ghế hạng 2";
            this.label7.Click += new System.EventHandler(this.label1_Click);
            // 
            // tbSLGhe2
            // 
            this.tbSLGhe2.Location = new System.Drawing.Point(174, 186);
            this.tbSLGhe2.Name = "tbSLGhe2";
            this.tbSLGhe2.Size = new System.Drawing.Size(74, 20);
            this.tbSLGhe2.TabIndex = 0;
            this.tbSLGhe2.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(171, 124);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(77, 13);
            this.label6.TabIndex = 1;
            this.label6.Text = "Số ghế hạng 1";
            this.label6.Click += new System.EventHandler(this.label1_Click);
            // 
            // tbSLGhe1
            // 
            this.tbSLGhe1.Location = new System.Drawing.Point(174, 142);
            this.tbSLGhe1.Name = "tbSLGhe1";
            this.tbSLGhe1.Size = new System.Drawing.Size(74, 20);
            this.tbSLGhe1.TabIndex = 0;
            this.tbSLGhe1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(171, 78);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 13);
            this.label5.TabIndex = 1;
            this.label5.Text = "Thời gian bay";
            this.label5.Click += new System.EventHandler(this.label1_Click);
            // 
            // tbTGBay
            // 
            this.tbTGBay.Location = new System.Drawing.Point(174, 96);
            this.tbTGBay.Name = "tbTGBay";
            this.tbTGBay.Size = new System.Drawing.Size(74, 20);
            this.tbTGBay.TabIndex = 0;
            this.tbTGBay.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(264, 34);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(149, 13);
            this.label8.TabIndex = 1;
            this.label8.Text = "Danh sách sân bay trung gian";
            this.label8.Click += new System.EventHandler(this.label1_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 34);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(80, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Mã chuyến bay";
            this.label4.Click += new System.EventHandler(this.label1_Click);
            // 
            // txMaCB
            // 
            this.txMaCB.Location = new System.Drawing.Point(19, 52);
            this.txMaCB.Name = "txMaCB";
            this.txMaCB.Size = new System.Drawing.Size(229, 20);
            this.txMaCB.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Thời gian";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // dgwChuyenBay
            // 
            this.dgwChuyenBay.AllowUserToAddRows = false;
            this.dgwChuyenBay.AllowUserToDeleteRows = false;
            this.dgwChuyenBay.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgwChuyenBay.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaCB,
            this.ThoiGian,
            this.TGBay,
            this.SBDi,
            this.SBDen,
            this.SLGhe1,
            this.SLGhe2});
            this.dgwChuyenBay.Location = new System.Drawing.Point(19, 19);
            this.dgwChuyenBay.Name = "dgwChuyenBay";
            this.dgwChuyenBay.ReadOnly = true;
            this.dgwChuyenBay.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgwChuyenBay.Size = new System.Drawing.Size(638, 206);
            this.dgwChuyenBay.TabIndex = 24;
            this.dgwChuyenBay.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgwChuyenBay_CellContentClick);
            // 
            // MaCB
            // 
            this.MaCB.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.MaCB.FillWeight = 1F;
            this.MaCB.HeaderText = "Mã CB";
            this.MaCB.Name = "MaCB";
            this.MaCB.ReadOnly = true;
            this.MaCB.Width = 64;
            // 
            // ThoiGian
            // 
            this.ThoiGian.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.ThoiGian.HeaderText = "Thời gian";
            this.ThoiGian.Name = "ThoiGian";
            this.ThoiGian.ReadOnly = true;
            this.ThoiGian.Width = 76;
            // 
            // TGBay
            // 
            this.TGBay.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.TGBay.HeaderText = "TG Bay";
            this.TGBay.Name = "TGBay";
            this.TGBay.ReadOnly = true;
            this.TGBay.Width = 67;
            // 
            // SBDi
            // 
            this.SBDi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.SBDi.HeaderText = "SB Đi";
            this.SBDi.Name = "SBDi";
            this.SBDi.ReadOnly = true;
            this.SBDi.Width = 59;
            // 
            // SBDen
            // 
            this.SBDen.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.SBDen.HeaderText = "SB Đến";
            this.SBDen.Name = "SBDen";
            this.SBDen.ReadOnly = true;
            this.SBDen.Width = 69;
            // 
            // SLGhe1
            // 
            this.SLGhe1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.SLGhe1.HeaderText = "SL Ghế 1";
            this.SLGhe1.Name = "SLGhe1";
            this.SLGhe1.ReadOnly = true;
            this.SLGhe1.Width = 77;
            // 
            // SLGhe2
            // 
            this.SLGhe2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.SLGhe2.HeaderText = "SL Ghế 2";
            this.SLGhe2.Name = "SLGhe2";
            this.SLGhe2.ReadOnly = true;
            this.SLGhe2.Width = 77;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgwChuyenBay);
            this.groupBox2.Location = new System.Drawing.Point(13, 293);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(676, 242);
            this.groupBox2.TabIndex = 25;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Danh sách chuyến bay";
            // 
            // ucNhanLichChuyenBay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.panel1);
            this.Name = "ucNhanLichChuyenBay";
            this.Size = new System.Drawing.Size(702, 547);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwSBTrungGian)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgwChuyenBay)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbSBDi;
        private System.Windows.Forms.DateTimePicker dtpTime;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txMaCB;
        private System.Windows.Forms.DataGridView dgwChuyenBay;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox tbTGBay;
        private System.Windows.Forms.ComboBox cbSBDen;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox tbSLGhe2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox tbSLGhe1;
        private System.Windows.Forms.DataGridView dgwSBTrungGian;
        private System.Windows.Forms.DataGridViewTextBoxColumn STT;
        private System.Windows.Forms.DataGridViewComboBoxColumn SBTrungGian;
        private System.Windows.Forms.DataGridViewTextBoxColumn TGDung;
        private System.Windows.Forms.DataGridViewTextBoxColumn GhiChu;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaCB;
        private System.Windows.Forms.DataGridViewTextBoxColumn ThoiGian;
        private System.Windows.Forms.DataGridViewTextBoxColumn TGBay;
        private System.Windows.Forms.DataGridViewTextBoxColumn SBDi;
        private System.Windows.Forms.DataGridViewTextBoxColumn SBDen;
        private System.Windows.Forms.DataGridViewTextBoxColumn SLGhe1;
        private System.Windows.Forms.DataGridViewTextBoxColumn SLGhe2;
    }
}
