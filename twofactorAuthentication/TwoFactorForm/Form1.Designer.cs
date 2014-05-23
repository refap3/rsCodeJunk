namespace TwoFactorForm
{
    partial class Form1
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
            this.tbPreSecret = new System.Windows.Forms.TextBox();
            this.tbSecret = new System.Windows.Forms.TextBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.lbOTP = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.tbTestOTP = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // tbPreSecret
            // 
            this.tbPreSecret.Location = new System.Drawing.Point(0, 0);
            this.tbPreSecret.Name = "tbPreSecret";
            this.tbPreSecret.Size = new System.Drawing.Size(100, 20);
            this.tbPreSecret.TabIndex = 0;
            this.tbPreSecret.Text = "1234567890";
            // 
            // tbSecret
            // 
            this.tbSecret.Location = new System.Drawing.Point(0, 26);
            this.tbSecret.Name = "tbSecret";
            this.tbSecret.Size = new System.Drawing.Size(100, 20);
            this.tbSecret.TabIndex = 1;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // lbOTP
            // 
            this.lbOTP.AutoSize = true;
            this.lbOTP.Location = new System.Drawing.Point(-3, 70);
            this.lbOTP.Name = "lbOTP";
            this.lbOTP.Size = new System.Drawing.Size(19, 13);
            this.lbOTP.TabIndex = 2;
            this.lbOTP.Text = "... ";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(136, 0);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 46);
            this.button1.TabIndex = 3;
            this.button1.Text = "<>";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tbTestOTP
            // 
            this.tbTestOTP.ForeColor = System.Drawing.Color.DarkGray;
            this.tbTestOTP.Location = new System.Drawing.Point(227, 0);
            this.tbTestOTP.Name = "tbTestOTP";
            this.tbTestOTP.Size = new System.Drawing.Size(100, 20);
            this.tbTestOTP.TabIndex = 4;
            this.tbTestOTP.TextChanged += new System.EventHandler(this.tbTestOTP_TextChanged);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(350, -3);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 5;
            this.button2.Text = "<-Test";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(437, 112);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.tbTestOTP);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.lbOTP);
            this.Controls.Add(this.tbSecret);
            this.Controls.Add(this.tbPreSecret);
            this.Name = "Form1";
            this.Text = "OTP Generator for Google Authenticator";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbPreSecret;
        private System.Windows.Forms.TextBox tbSecret;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label lbOTP;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox tbTestOTP;
        private System.Windows.Forms.Button button2;
    }
}

