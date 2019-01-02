namespace GUI
{
    partial class FrmMain
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnThongKeNam = new System.Windows.Forms.Button();
            this.btnThongKeThang = new System.Windows.Forms.Button();
            this.btnTraCuuCB = new System.Windows.Forms.Button();
            this.panel = new System.Windows.Forms.Panel();
            this.btnThoat = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
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
            this.panel1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(344, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(201, 29);
            this.label1.TabIndex = 2;
            this.label1.Text = "QUẢN TRỊ VIÊN";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnThongKeNam);
            this.panel2.Controls.Add(this.btnThongKeThang);
            this.panel2.Controls.Add(this.btnTraCuuCB);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(0, 63);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(222, 547);
            this.panel2.TabIndex = 1;
            // 
            // btnThongKeNam
            // 
            this.btnThongKeNam.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnThongKeNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongKeNam.Location = new System.Drawing.Point(0, 362);
            this.btnThongKeNam.Name = "btnThongKeNam";
            this.btnThongKeNam.Size = new System.Drawing.Size(222, 182);
            this.btnThongKeNam.TabIndex = 30;
            this.btnThongKeNam.Text = "Thống kê theo năm";
            this.btnThongKeNam.UseVisualStyleBackColor = false;
            // 
            // btnThongKeThang
            // 
            this.btnThongKeThang.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnThongKeThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongKeThang.Location = new System.Drawing.Point(0, 182);
            this.btnThongKeThang.Name = "btnThongKeThang";
            this.btnThongKeThang.Size = new System.Drawing.Size(222, 182);
            this.btnThongKeThang.TabIndex = 29;
            this.btnThongKeThang.Text = "Thống kê theo tháng";
            this.btnThongKeThang.UseVisualStyleBackColor = false;
            // 
            // btnTraCuuCB
            // 
            this.btnTraCuuCB.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnTraCuuCB.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTraCuuCB.Location = new System.Drawing.Point(0, 3);
            this.btnTraCuuCB.Name = "btnTraCuuCB";
            this.btnTraCuuCB.Size = new System.Drawing.Size(222, 182);
            this.btnTraCuuCB.TabIndex = 28;
            this.btnTraCuuCB.Text = "Tra cứu chuyến bay";
            this.btnTraCuuCB.UseVisualStyleBackColor = false;
            // 
            // panel
            // 
            this.panel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel.Location = new System.Drawing.Point(222, 63);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(702, 547);
            this.panel.TabIndex = 2;
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
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(924, 610);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.MaximumSize = new System.Drawing.Size(940, 649);
            this.MinimumSize = new System.Drawing.Size(940, 649);
            this.Name = "FrmMain";
            this.Text = "Form1";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnThongKeNam;
        private System.Windows.Forms.Button btnThongKeThang;
        private System.Windows.Forms.Button btnTraCuuCB;
        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnThoat;
    }
}

