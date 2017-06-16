using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace dynamicSQLEF
{
    public class EntityDBInitializer : CreateDatabaseIfNotExists<DataBaseContext>
    {
        protected override void Seed(DataBaseContext context)
        {
            var col1 = new ColumnNames();
            col1.ID = 1;
            col1.colName = "prop1";

            context.colNDbset.Add(col1);

            var col2 = new ColumnNames();
            col2.ID = 2;
            col2.colName = "prop2";

            context.colNDbset.Add(col2);


            var colList = new List<ColumnNames>();
            colList.Add(col1);
            colList.Add(col2);
                
           

            var ln = new LookupNames();
            ln.ID = 1;
            ln.Name = "name1";
            ln.columnNames = colList;
            context.lNDbset.Add(ln);
            context.SaveChanges();


         

            //var coln = new List<ColumnNames>()
            //{
            //    new ColumnNames() { ID = 1,  lookupName = ln, columnNames = colList }             

            //};

            //coln.ForEach(c => context.colNDbset.Add(c));
            //context.SaveChanges();

            base.Seed(context);



        }
    }
}