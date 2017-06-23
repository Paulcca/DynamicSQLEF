using System;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace dynamicSQLEF
{
   public class DB_ConnectionDets
    {
        // private field which holds string 
        //private static string conString = @"Data source = VOSSDEV002 ; initial catalog=Cost Guide 2015;user id=sa;";
         private static string conString = ConfigurationManager.ConnectionStrings["ConnectToDB"].ToString();
       // private static string conString = "Data source =VOAITDEVPC27; initial catalog=ATestDyanicEF;Integrated Security=True; ";

        //  database connection object 
        public static SqlConnection connect()
        {
            SqlConnection sqlConnect = new SqlConnection(conString);
            return sqlConnect;
        }
    }
}
