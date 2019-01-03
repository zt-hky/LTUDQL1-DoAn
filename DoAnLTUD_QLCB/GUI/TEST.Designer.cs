namespace GUI
{
    partial class TEST
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
            this.ucTraCuuChuyenBay1 = new GUI.ucTraCuuChuyenBay();
            this.SuspendLayout();
            // 
            // ucTraCuuChuyenBay1
            // 
            this.ucTraCuuChuyenBay1.Location = new System.Drawing.Point(66, 73);
            this.ucTraCuuChuyenBay1.Name = "ucTraCuuChuyenBay1";
            this.ucTraCuuChuyenBay1.Size = new System.Drawing.Size(702, 547);
            this.ucTraCuuChuyenBay1.TabIndex = 0;
            // 
            // TEST
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 608);
            this.Controls.Add(this.ucTraCuuChuyenBay1);
            this.Name = "TEST";
            this.Text = "TEST";
            this.ResumeLayout(false);

        }

        #endregion

        private ucTraCuuChuyenBay ucTraCuuChuyenBay1;
    }
}