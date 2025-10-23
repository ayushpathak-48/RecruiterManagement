﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruiterManagement.Candidates
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (String.IsNullOrEmpty(id))
            {
                Response.Redirect("/Candidates?action=delete&success=false");
            }
            using (MySqlConnection conn = DBConn.GetConnection())
            {


                MySqlCommand getUserId = new MySqlCommand("SELECT user_id FROM candidates where id=@Id", conn);
                getUserId.Parameters.AddWithValue("@Id", id);
                MySqlDataReader reader = getUserId.ExecuteReader();
                int user_id = 0;
                if (reader.Read())
                {
                    user_id = Convert.ToInt32(reader["user_id"]);
                }

                if (user_id == 0) Response.Redirect("/Candidates?action=delete&success=false");

                MySqlCommand deleteCandidate = new MySqlCommand("DELETE FROM candidates where id=@Id", conn);
                deleteCandidate.Parameters.AddWithValue("@Id", id);
                int isDeleted = deleteCandidate.ExecuteNonQuery();
                if (isDeleted > 0)
                {
                    MySqlCommand deleteJobSkillsCMD = new MySqlCommand("DELETE FROM candidate_skills where candidate_id=@Id", conn);
                    deleteJobSkillsCMD.Parameters.AddWithValue("@Id", id);
                    deleteJobSkillsCMD.ExecuteNonQuery();

                    MySqlCommand deleteUser = new MySqlCommand("DELETE FROM users where id=@Id", conn);
                    deleteJobSkillsCMD.Parameters.AddWithValue("@Id", user_id);
                    deleteJobSkillsCMD.ExecuteNonQuery();


                    Response.Redirect("/Candidates?action=delete&success=true");
                }
                else
                {
                    Response.Redirect("/Candidates?action=delete&success=false");
                }
            }
        }
    }
}