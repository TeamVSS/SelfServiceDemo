using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SelfServiceDemo.Utilities;
namespace SelfServiceDemo.Models
{
    public class Report
    {


        public Report()
        {

        }
        public string reportIssue(string cust_id, string rep_name, string rep_desc)
        {
            return DataAccessHelper.reportIssue(cust_id, rep_name, rep_desc);
        }

        

        public string retStatus(string custId, string repId)
        {
            return DataAccessHelper.retStatus(custId, repId);
        }

        public DateTime retProvisionDate(string custId, string repId)
        {
            return DataAccessHelper.retProvisionDate(custId, repId);

        }


        public void setStatus(string custId, string repId)
        {

            DataAccessHelper.setStatus(custId, repId);
        }

        public List<string> retPendingIssues(string custId)
        {
            return DataAccessHelper.retPendingIssues(custId);

        }

        public List<string> retEscalatedIssues(string custId)
        {
            return DataAccessHelper.retEscalatedIssues(custId);

        }

    }
}