using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;


namespace WinFormsApp9
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\ProjectModels;Initial Catalog=master;Integrated Security=True");
        public int bookid;
        private void Form1_Load(object sender, EventArgs e)
        {
            Getinfo();

        }

        private void Getinfo()
        {

            SqlCommand cmd = new SqlCommand("Select * from sin", conn);
            DataTable dt = new DataTable();
            conn.Open();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            dt.Load(sqlDataReader);
            conn.Close();
            stinfo.DataSource = dt;
        }

        private void addbtn_Click(object sender, EventArgs e)
        {
            if (Isvlid())
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO sin VALUES(@bookid,@bn,@ba,@nc,@cat)", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bookid", textBox1);
                cmd.Parameters.AddWithValue("@bn", textBox2);
                cmd.Parameters.AddWithValue("@ba", textBox3);
                cmd.Parameters.AddWithValue("@nc", textBox4);
                cmd.Parameters.AddWithValue("@cat", textBox5);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("book data saved succesfully", "sucess", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Resetform();
            }
        }

        private bool Isvlid()
        {

            if (textBox1.Text == string.Empty)
            {
                MessageBox.Show("bookname name is required", "Failed ", MessageBoxButtons.OKCancel, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }

        private void rebtn_Click(object sender, EventArgs e)
        {
            Resetform();

        }

        private void Resetform()
        {bookid = 0;
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();

        }

        private void stinfo_Click(object sender, EventArgs e)
        {
            bookid = Convert.ToInt32(stinfo.SelectedRows[0].Cells[0].Value);
            textBox1.Text = stinfo.SelectedRows[0].Cells[1].Value.ToString();
            textBox2.Text = stinfo.SelectedRows[0].Cells[2].Value.ToString();
            textBox3.Text = stinfo.SelectedRows[0].Cells[3].Value.ToString();
            textBox4.Text = stinfo.SelectedRows[0].Cells[4].Value.ToString();
            textBox5.Text = stinfo.SelectedRows[0].Cells[5].Value.ToString();
        }

        private void upbtn_Click(object sender, EventArgs e)
        {
            if (bookid > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE  sin SET(@bookid,@bn,@ba,@nc,@cat WHERE bookid=@bkid)", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bookid", textBox1);
                cmd.Parameters.AddWithValue("@bn", textBox2);
                cmd.Parameters.AddWithValue("@ba", textBox3);
                cmd.Parameters.AddWithValue("@nc", textBox4);
                cmd.Parameters.AddWithValue("@cat", textBox5);
                cmd.Parameters.AddWithValue("@bkid", this.bookid);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("book data update succesfully", "update", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Getinfo();
                Resetform();
            }
            else
            {
                MessageBox.Show("please select correct row ", "select", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (bookid>0)
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM sin WHERE bookid=@bkid ", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bkid", this.bookid);
                
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("book  is deleted", "deleted", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Resetform();
            }
            else
            {
                MessageBox.Show("please select book to delete ", "select", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        }
    }
