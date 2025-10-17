﻿using MySql.Data.MySqlClient;
using RecruiterManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruiterManagement.Jobs
{
    public partial class Index : System.Web.UI.Page
    {
        public List<Job> JobsList = new List<Job>();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadJobs();

            string action = Request.Params.Get("action");
            string success = Request.Params.Get("success");
            if (!string.IsNullOrEmpty(action) && !string.IsNullOrEmpty(success))
            {
                if (action.Equals("delete") && success.Equals("true"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
        "Swal.fire({icon:'success',title:'Deleted!',text:'Job deleted successfully!',timer:1500,showConfirmButton:false});", true);
                }

                else if (action.Equals("delete") && success.Equals("false"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
        "Swal.fire({icon:'error',title:'Failed!',text:'Failed to delete the skill',timer:1500,showConfirmButton:false});", true);

                }

                else if (action.Equals("update") && success.Equals("false"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
        "Swal.fire({icon:'error',title:'Failed!',text:'Failed to update the skill',timer:1500,showConfirmButton:false});", true);
                }

                else if (action.Equals("update") && success.Equals("true"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
        "Swal.fire({icon:'success',title:'Updated!',text:'Job updated successfully',timer:1500,showConfirmButton:false});", true);
                }

                else if (action.Equals("addskill") && success.Equals("true"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
        "Swal.fire({icon:'success',title:'Added!',text:'Job added successfully',timer:1500,showConfirmButton:false});", true);
                }

                ScriptManager.RegisterStartupScript(this, GetType(),
                        "removeQuery",
                "if (window.location.search) { " +
                "   const newUrl = window.location.origin + window.location.pathname;" +
                "   window.history.replaceState({}, document.title, newUrl);" +
                "}", true);
            }
        }

        private void LoadJobs()
        {
            using (MySqlConnection conn = DBConn.GetConnection())
            {
                string query = "SELECT j.id,j.name,j.status, " +
                    "GROUP_CONCAT(CASE when js.type = 'REQUIRED' THEN s.name END ORDER BY s.name SEPARATOR ',') AS required_skills, " +
                    "GROUP_CONCAT(CASE when js.type = 'PREFERRED' THEN s.name END ORDER BY s.name SEPARATOR ',') AS preferred_skills " +
                    "FROM jobs j " +
                    "LEFT JOIN job_skills js ON j.id = js.job_id " +
                    "LEFT JOIN skills s ON js.skill_id = s.id GROUP BY " +
                    "j.id, j.name;";


                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Job skill = new Job
                    {
                        Id = Convert.ToInt32(reader["id"]),
                        Name = reader["name"].ToString(),
                        Preferred_Skills = reader["preferred_skills"].ToString(),
                        Required_Skills = reader["required_skills"].ToString(),
                        Status = reader["status"].ToString()
                    };

                    JobsList.Add(skill);
                }
            }
        }
    }
}