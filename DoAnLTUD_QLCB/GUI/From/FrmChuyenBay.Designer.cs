namespace GUI.From
{
    partial class FrmChuyenBay
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmChuyenBay));
            this.bunifuElipse1 = new Bunifu.Framework.UI.BunifuElipse(this.components);
            this.btnExit = new Bunifu.Framework.UI.BunifuImageButton();
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
            this.tbMaCB = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.btn = new Bunifu.Framework.UI.BunifuFlatButton();
            this.LabeTrung = new System.Windows.Forms.Label();
            this.LabelHopLe = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.numSL = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.btnExit)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwSBTrungGian)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSL)).BeginInit();
            this.SuspendLayout();
            // 
            // bunifuElipse1
            // 
            this.bunifuElipse1.ElipseRadius = 5;
            this.bunifuElipse1.TargetControl = this;
            // 
            // btnExit
            // 
            this.btnExit.BackColor = System.Drawing.Color.Transparent;
            this.btnExit.Image = global::GUI.Properties.Resources.out01;
            this.btnExit.ImageActive = global::GUI.Properties.Resources.out02;
            this.btnExit.Location = new System.Drawing.Point(658, 12);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(35, 27);
            this.btnExit.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.btnExit.TabIndex = 5;
            this.btnExit.TabStop = false;
            this.btnExit.Zoom = 10;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.numSL);
            this.groupBox1.Controls.Add(this.LabelHopLe);
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
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.LabeTrung);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.tbMaCB);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 83);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(676, 205);
            this.groupBox1.TabIndex = 24;
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
            this.dgwSBTrungGian.Location = new System.Drawing.Point(267, 36);
            this.dgwSBTrungGian.Name = "dgwSBTrungGian";
            this.dgwSBTrungGian.Size = new System.Drawing.Size(390, 153);
            this.dgwSBTrungGian.TabIndex = 4;
            // 
            // STT
            // 
            this.STT.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.STT.FillWeight = 101.5228F;
            this.STT.HeaderText = "STT";
            this.STT.Name = "STT";
            this.STT.ReadOnly = true;
            this.STT.Width = 53;
            // 
            // SBTrungGian
            // 
            this.SBTrungGian.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.SBTrungGian.FillWeight = 237.3304F;
            this.SBTrungGian.HeaderText = "Sân bay trung gian";
            this.SBTrungGian.Name = "SBTrungGian";
            this.SBTrungGian.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.SBTrungGian.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.SBTrungGian.Width = 93;
            // 
            // TGDung
            // 
            this.TGDung.FillWeight = 12.77933F;
            this.TGDung.HeaderText = "TG Dừng";
            this.TGDung.Name = "TGDung";
            // 
            // GhiChu
            // 
            this.GhiChu.FillWeight = 12.77933F;
            this.GhiChu.HeaderText = "Ghi Chú";
            this.GhiChu.Name = "GhiChu";
            // 
            // dtpTime
            // 
            this.dtpTime.CustomFormat = "HH:mm   dd/MM/yyyy";
            this.dtpTime.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpTime.Location = new System.Drawing.Point(19, 80);
            this.dtpTime.Name = "dtpTime";
            this.dtpTime.Size = new System.Drawing.Size(135, 20);
            this.dtpTime.TabIndex = 3;
            // 
            // cbSBDen
            // 
            this.cbSBDen.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbSBDen.FormattingEnabled = true;
            this.cbSBDen.Location = new System.Drawing.Point(19, 168);
            this.cbSBDen.Name = "cbSBDen";
            this.cbSBDen.Size = new System.Drawing.Size(135, 21);
            this.cbSBDen.TabIndex = 2;
            // 
            // cbSBDi
            // 
            this.cbSBDi.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbSBDi.FormattingEnabled = true;
            this.cbSBDi.Location = new System.Drawing.Point(19, 124);
            this.cbSBDi.Name = "cbSBDi";
            this.cbSBDi.Size = new System.Drawing.Size(135, 21);
            this.cbSBDi.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 152);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Sân bay đến";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 108);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Sân bay đi";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(171, 152);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Số ghế hạng 2";
            // 
            // tbSLGhe2
            // 
            this.tbSLGhe2.Location = new System.Drawing.Point(174, 170);
            this.tbSLGhe2.Name = "tbSLGhe2";
            this.tbSLGhe2.Size = new System.Drawing.Size(74, 20);
            this.tbSLGhe2.TabIndex = 0;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(171, 108);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(77, 13);
            this.label6.TabIndex = 1;
            this.label6.Text = "Số ghế hạng 1";
            // 
            // tbSLGhe1
            // 
            this.tbSLGhe1.Location = new System.Drawing.Point(174, 126);
            this.tbSLGhe1.Name = "tbSLGhe1";
            this.tbSLGhe1.Size = new System.Drawing.Size(74, 20);
            this.tbSLGhe1.TabIndex = 0;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(171, 62);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 13);
            this.label5.TabIndex = 1;
            this.label5.Text = "Thời gian bay";
            // 
            // tbTGBay
            // 
            this.tbTGBay.Location = new System.Drawing.Point(174, 80);
            this.tbTGBay.Name = "tbTGBay";
            this.tbTGBay.Size = new System.Drawing.Size(74, 20);
            this.tbTGBay.TabIndex = 0;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(264, 18);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(149, 13);
            this.label8.TabIndex = 1;
            this.label8.Text = "Danh sách sân bay trung gian";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 18);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(80, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Mã chuyến bay";
            // 
            // tbMaCB
            // 
            this.tbMaCB.Location = new System.Drawing.Point(19, 36);
            this.tbMaCB.Name = "tbMaCB";
            this.tbMaCB.Size = new System.Drawing.Size(229, 20);
            this.tbMaCB.TabIndex = 0;
            this.tbMaCB.KeyUp += new System.Windows.Forms.KeyEventHandler(this.tbMaCB_KeyUp);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 64);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Thời gian";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(77)))), ((int)(((byte)(64)))));
            this.label9.Location = new System.Drawing.Point(180, 30);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(365, 31);
            this.label9.TabIndex = 25;
            this.label9.Text = "Thêm/Thay đổi chuyến bay";
            // 
            // btn
            // 
            this.btn.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.btn.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.btn.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btn.BorderRadius = 0;
            this.btn.ButtonText = "Thêm";
            this.btn.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn.DisabledColor = System.Drawing.Color.Gray;
            this.btn.Iconcolor = System.Drawing.Color.Transparent;
            this.btn.Iconimage = ((System.Drawing.Image)(resources.GetObject("btn.Iconimage")));
            this.btn.Iconimage_right = null;
            this.btn.Iconimage_right_Selected = null;
            this.btn.Iconimage_Selected = null;
            this.btn.IconMarginLeft = 0;
            this.btn.IconMarginRight = 0;
            this.btn.IconRightVisible = true;
            this.btn.IconRightZoom = 0D;
            this.btn.IconVisible = true;
            this.btn.IconZoom = 90D;
            this.btn.IsTab = false;
            this.btn.Location = new System.Drawing.Point(279, 305);
            this.btn.Name = "btn";
            this.btn.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.btn.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(36)))), ((int)(((byte)(129)))), ((int)(((byte)(77)))));
            this.btn.OnHoverTextColor = System.Drawing.Color.White;
            this.btn.selected = false;
            this.btn.Size = new System.Drawing.Size(159, 55);
            this.btn.TabIndex = 28;
            this.btn.Text = "Thêm";
            this.btn.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn.Textcolor = System.Drawing.Color.White;
            this.btn.TextFont = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn.Click += new System.EventHandler(this.btn_Click);
            // 
            // LabeTrung
            // 
            this.LabeTrung.AutoSize = true;
            this.LabeTrung.ForeColor = System.Drawing.Color.Red;
            this.LabeTrung.Location = new System.Drawing.Point(165, 20);
            this.LabeTrung.Name = "LabeTrung";
            this.LabeTrung.Size = new System.Drawing.Size(77, 13);
            this.LabeTrung.TabIndex = 1;
            this.LabeTrung.Text = "Mã CB bị trùng";
            this.LabeTrung.Visible = false;
            // 
            // LabelHopLe
            // 
            this.LabelHopLe.AutoSize = true;
            this.LabelHopLe.ForeColor = System.Drawing.Color.DarkGreen;
            this.LabelHopLe.Location = new System.Drawing.Point(171, 20);
            this.LabelHopLe.Name = "LabelHopLe";
            this.LabelHopLe.Size = new System.Drawing.Size(71, 13);
            this.LabelHopLe.TabIndex = 5;
            this.LabelHopLe.Text = "Mã CB hợp lệ";
            this.LabelHopLe.Visible = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(592, 18);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(20, 13);
            this.label10.TabIndex = 1;
            this.label10.Text = "SL";
            // 
            // numSL
            // 
            this.numSL.Location = new System.Drawing.Point(618, 16);
            this.numSL.Maximum = new decimal(new int[] {
            3,
            0,
            0,
            0});
            this.numSL.Name = "numSL";
            this.numSL.Size = new System.Drawing.Size(38, 20);
            this.numSL.TabIndex = 6;
            this.numSL.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);
            // 
            // FrmChuyenBay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(705, 397);
            this.Controls.Add(this.btn);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnExit);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FrmChuyenBay";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmChuyenBay";
            ((System.ComponentModel.ISupportInitialize)(this.btnExit)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwSBTrungGian)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSL)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Bunifu.Framework.UI.BunifuElipse bunifuElipse1;
        private Bunifu.Framework.UI.BunifuImageButton btnExit;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dgwSBTrungGian;
        private System.Windows.Forms.DataGridViewTextBoxColumn STT;
        private System.Windows.Forms.DataGridViewComboBoxColumn SBTrungGian;
        private System.Windows.Forms.DataGridViewTextBoxColumn TGDung;
        private System.Windows.Forms.DataGridViewTextBoxColumn GhiChu;
        private System.Windows.Forms.DateTimePicker dtpTime;
        private System.Windows.Forms.ComboBox cbSBDen;
        private System.Windows.Forms.ComboBox cbSBDi;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox tbSLGhe2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox tbSLGhe1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox tbTGBay;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tbMaCB;
        private System.Windows.Forms.Label label1;
        private Bunifu.Framework.UI.BunifuFlatButton btn;
        private System.Windows.Forms.Label LabelHopLe;
        private System.Windows.Forms.Label LabeTrung;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.NumericUpDown numSL;
    }
}