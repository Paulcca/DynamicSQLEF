using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Dynamic;

namespace dynamicSQLEF
{
    public class DataBaseContext  : DbContext
    {

        public DataBaseContext() : base("ConnectToDB")
        {
            Database.SetInitializer(new EntityDBInitializer());
        }

        public DbSet<LookupNames> lookUps { get; set; }
        public DbSet<ColumnNames> colNDbset { get; set; }

       // public DbSet<ExpandoObject> ex1 { get; set; }



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

        }

        
    }
}
