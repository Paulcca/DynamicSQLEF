using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Dynamic;
using System.IO;
using System.Data.SqlClient;

namespace dynamicSQLEF
{
    class Program
    {
        static void Main(string[] args)
        {

            

            dynamic t = DB_Access.getRecbyId(1,"Table4");




            //dynamic ex = new ExpandoObject();
            //ex.ID = 1;
            //ex.Col1 = "";
            //ex.Col2 = "";
            //ex.Col3 = "";



            //using (DataBaseContext context = new DataBaseContext())
            //{

                

            //        var ox  = context.SqlQuery("CreateLookupTbl @TableName @col1 ", 
            //            new SqlParameter("@TableName", "Table4"),
            //            new SqlParameter("@col1" , "col1" ),
            //            new SqlParameter("col1Value", "'abc'")
            //            ).FirstOrDefault();

                   


               


            //}





            //string fileName = @"C:\Users\6100361\Documents\headerTest1.csv";

            //string lines = (File.ReadLines(fileName).First());

            //string[] columns = lines.Split(',');

            //// call sp here to create table

            //// call sp to bulk insert file to table










            //using (var db = new DataBaseContext())
            //{
            //    var bs = db.colNDbset.FirstOrDefault();

            //}






            //dynamic ex = new ExpandoObject();
            //ex.ID = 1;
            //ex.prop2 = "p2";






            //using (var db = new DataBaseContext())
            //{
            //    DbModelBuilder em = new DbModelBuilder();
            //   em.Entity<ExpandoObject>().ToTable("ex");

            //    var f =  db.Entry(em);

            //    var g = db.Set<ExpandoObject>();


            //    var myTable = "CREATE TABLE ex(ID INTEGER PRIMARY KEY, Prop2 nvarchar(max))";
            //    db.Database.CreateIfNotExists();
            //    db.Database.ExecuteSqlCommand(myTable);

            //    var h = g.Add(ex);


            //   // f.Entity(ex);

            //    //var f = db.f


            //    db.SaveChanges();

            //    //  BaseClass br = context.bClassDBSet.FirstOrDefault();





            //}









        }


      
    }
}
