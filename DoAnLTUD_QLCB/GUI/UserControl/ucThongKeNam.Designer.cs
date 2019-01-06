namespace GUI
{
    partial class ucThongKeNam
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
            this.label1 = new System.Windows.Forms.Label();
            this.dgvBaoCao = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpThang = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dtpNam = new System.Windows.Forms.DateTimePicker();
            this.btnBaoCaoThang = new System.Windows.Forms.Button();
            this.btnBaoCaoNam = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBaoCao)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(214, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(225, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Báo Cáo Doanh Thu Bán Vé Các Chuyến Bay";
            // 
            // dgvBaoCao
            // 
            this.dgvBaoCao.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBaoCao.Location = new System.Drawing.Point(0, 194);
            this.dgvBaoCao.Name = "dgvBaoCao";
            this.dgvBaoCao.Size = new System.Drawing.Size(702, 350);
            this.dgvBaoCao.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(138, 61);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Tháng:";
            // 
            // dtpThang
            // 
            this.dtpThang.CustomFormat = "MM";
            this.dtpThang.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpThang.Location = new System.Drawing.Point(195, 57);
            this.dtpThang.Name = "dtpThang";
            this.dtpThang.Size = new System.Drawing.Size(77, 20);
            this.dtpThang.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(349, 61);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Năm:";
            // 
            // dtpNam
            // 
            this.dtpNam.CustomFormat = "yyyy";
            this.dtpNam.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpNam.Location = new System.Drawing.Point(407, 57);
            this.dtpNam.Name = "dtpNam";
            this.dtpNam.Size = new System.Drawing.Size(77, 20);
            this.dtpNam.TabIndex = 4;
            // 
            // btnBaoCaoThang
            // 
            this.btnBaoCaoThang.Location = new System.Drawing.Point(182, 105);
            this.btnBaoCaoThang.Name = "btnBaoCaoThang";
            this.btnBaoCaoThang.Size = new System.Drawing.Size(117, 40);
            this.btnBaoCaoThang.TabIndex = 6;
            this.btnBaoCaoThang.Text = "Báo Cáo Tháng";
            this.btnBaoCaoThang.UseVisualStyleBackColor = true;
            this.btnBaoCaoThang.Click += new System.EventHandler(this.btnBaoCaoThang_Click);
            // 
            // btnBaoCaoNam
            // 
            this.btnBaoCaoNam.Location = new System.Drawing.Point(367, 105);
            this.btnBaoCaoNam.Name = "btnBaoCaoNam";
            this.btnBaoCaoNam.Size = new System.Drawing.Size(117, 40);
            this.btnBaoCaoNam.TabIndex = 6;
            this.btnBaoCaoNam.Text = "Báo Cáo Năm";
            this.btnBaoCaoNam.UseVisualStyleBackColor = true;
            this.btnBaoCaoNam.Click += new System.EventHandler(this.btnBaoCaoNam_Click);
            // 
            // ucThongKeNam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnBaoCaoNam);
            this.Controls.Add(this.btnBaoCaoThang);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dtpNam);
            this.Controls.Add(this.dtpThang);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dgvBaoCao);
            this.Controls.Add(this.label1);
            this.Name = "ucThongKeNam";
            this.Size = new System.Drawing.Size(702, 547);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBaoCao)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvBaoCao;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpThang;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dtpNam;
        private System.Windows.Forms.Button btnBaoCaoThang;
        private System.Windows.Forms.Button btnBaoCaoNam;
    }
}
