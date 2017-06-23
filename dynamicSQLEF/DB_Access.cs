using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace dynamicSQLEF
{
    public class DB_Access  
    {
        
        public static LookupNames GetLookUp (string name)
        {
            LookupNames _lookupName = new LookupNames();

            using (var LookupContext = new DataBaseContext())

            {             

                return _lookupName = LookupContext.lookUps.Where(x => x.Name == name)
                                        .Include("columnNames")
                                       .FirstOrDefault();
                           

            }

           
        }


        public static dynamic getRecbyId(int ID, string lookName)
        {
            SqlConnection connection = DB_ConnectionDets.connect();
            SqlCommand command = new SqlCommand("[GetLookUpById]", connection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@TableName", lookName));
            command.Parameters.Add(new SqlParameter("@ID", ID ));

            var rec = new ExpandoObject() as IDictionary<string, Object>;
           


            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (!reader.Read())
                {
                    reader.Close();
                    return null;
                }

                LookupNames lk = GetLookUp(lookName);

               

                foreach (var col in lk.columnNames)
                {
                    rec.Add(col.colName.ToString(), string.Empty);
                    //  rec.col = string.Empty;
                    if (col.colName.ToString() == "ID")
                    {
                        int id = (int)reader.GetValue(reader.GetOrdinal(col.colName));
                        rec[col.colName] = id.ToString();
                    }
                    else
                    {
                        rec[col.colName] = (string)reader.GetValue(reader.GetOrdinal(col.colName));
                    }
                }


                //rec.col1 = (string)reader.GetValue(reader.GetOrdinal("col1"));
                //rec.col2 = (string)reader.GetValue(reader.GetOrdinal("col2"));
                //rec.col3 = (string)reader.GetValue(reader.GetOrdinal("col3"));
                //rec.ID = (int)reader.GetValue(reader.GetOrdinal("ID"));

                reader.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                connection.Close();
            }

            return rec;
        }
    }
}
