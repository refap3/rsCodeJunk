using System;
using System.Text;
using System.Windows.Forms;
using TwoFactor;



namespace TwoFactorForm
{
    public partial class Form1 : Form
    {
        Base32Encoder enc = new Base32Encoder();
        public Form1()
        {
            InitializeComponent();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // will convert presecret string and back 
            // note that you cannot reverse the encoding for a known LP secret !! 
            // dunno if the use UTF7 (?)

            // you would use the secret string to set up GA 
            if (tbPreSecret.Text == "")
            {
                tbPreSecret.Text = Encoding.UTF8.GetString(enc.Decode(tbSecret.Text));
            }
            if (tbSecret.Text == "")
            {
                tbSecret.Text = enc.Encode(Encoding.ASCII.GetBytes(tbPreSecret.Text));

            }

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            //dumps valid One Time Passwords for preSecret ... 

            if (tbPreSecret.Text != "")
            {
                lbOTP.Text = TimeBasedOneTimePassword.GetPassword(tbPreSecret.Text);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (TimeBasedOneTimePassword.IsValid(tbPreSecret.Text, tbTestOTP.Text))
                    tbTestOTP.ForeColor = System.Drawing.Color.Green;
                else tbTestOTP.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception x)
            {
                MessageBox.Show(x.ToString(), "Exception", MessageBoxButtons.OK);
                
            }

        }

        private void tbTestOTP_TextChanged(object sender, EventArgs e)
        {
            tbTestOTP.ForeColor = System.Drawing.Color.DarkGray;
        }
    }
}
