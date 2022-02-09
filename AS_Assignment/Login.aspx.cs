using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace AS_Assignment
{
    public class MyObject
    {
        public string success { get; set; }
        public List<string> ErrorMessage { get; set; }
    }


    public partial class Login : System.Web.UI.Page
    {
        string ASDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ASDBConnection"].ConnectionString;
        public bool ValidateCaptcha()
        {
            bool result = true;
            string CaptchaResponse = Request.Form["g-recaptcha-response"];
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create
                ("https://www.google.com/recaptcha/api/siteverify?secret=6LdgXGUeAAAAAPNos7-9XolVw96Q95U_U5Vh-Drn &response=" + CaptchaResponse);

            try
            {
                using (WebResponse wResponse = req.GetResponse())
                {
                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        string jsonResponse = readStream.ReadToEnd();
                        /*lbl_gscore.Text = jsonResponse.ToString();*/
                        JavaScriptSerializer js = new JavaScriptSerializer();

                        MyObject jsonObject = js.Deserialize<MyObject>(jsonResponse);
                        result = Convert.ToBoolean(jsonObject.success);
                    }
                }
                return result;
            }
            catch (WebException ex)
            {
                throw ex;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string getDBHash(string userid)
        {
            string h = null;

            SqlConnection connection = new SqlConnection(ASDBConnectionString);
            string sql = "select PasswordHash FROM SIT WHERE Email=@USERID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@USERID", userid);

            try
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["PasswordHash"] != null)
                        {
                            if (reader["PasswordHash"] != DBNull.Value)
                            {
                                h = reader["PasswordHash"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { connection.Close(); }
            return h;
        }

        protected string getDBSalt(string userid)
        {
            string s = null;

            SqlConnection connection = new SqlConnection(ASDBConnectionString);
            string sql = "select PASSWORDSALT FROM SIT WHERE EMAIL=@USERID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@USERID", userid);

            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["PASSWORDSALT"] != null)
                        {
                            if (reader["PASSWORDSALT"] != DBNull.Value)
                            {
                                s = reader["PASSWORDSALT"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { connection.Close(); }
            return s;
        }
        

        protected void LoginMe(object sender, EventArgs e)
        {
            string pwd = tb_pwd.Text.ToString().Trim();
            string userid = tb_userid.Text.ToString().Trim();

            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(userid);
            string dbSalt = getDBSalt(userid);


            if (ValidateCaptcha())
            {


                try
                {
                    if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                    {
                        string pwdWithSalt = pwd + dbSalt;
                        byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                        string userHash = Convert.ToBase64String(hashWithSalt);

                        if (userHash.Equals(dbHash))
                        {
                            Session["UserID"] = userid;
                            string guid = Guid.NewGuid().ToString();
                            Session["AuthToken"] = guid;
                            Response.Cookies.Add(new HttpCookie("AuthToken", guid));
                            Response.Redirect("Homepage.aspx", false);
                        }
                        else
                        {
                            lblMessage.Text = "Wrong username or password";
                            lblMessage.Visible = true;
                        }

                    }
                    else
                    {
                        lblMessage.Text = "Wrong username or password";
                        lblMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally { }
            }
        }

       /*     if (ValidateCaptcha())
            {
                if (tb_userid.Text.Trim().Equals("u") && tb_pwd.Text.Trim().Equals("p"))
                {
                    Session["LoggedIn"] = tb_userid.Text.Trim();
                    string guid = Guid.NewGuid().ToString();
                    Session["AuthToken"] = guid;
                    Response.Cookies.Add(new HttpCookie("AuthToken", guid));
                    Response.Redirect("Homepage.aspx", false);
                }
                else
                {
                    lblMessage.Text = "Wrong username or password";
                    lblMessage.Visible = true;
                }
            }*/
         
        }
    }
