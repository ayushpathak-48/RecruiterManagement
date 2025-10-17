using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruiterManagement.Models
{
    public class Job
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Status { get; set; }

        public string Required_Skills { get; set; }

        public string Preferred_Skills { get; set; }

    }
}