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

        public DataBaseContext() : base("BaseContext")
        {
            Database.SetInitializer(new EntityDBInitializer());
        }

        public DbSet<LookupNames> lNDbset { get; set; }
        public DbSet<ColumnNames> colNDbset { get; set; }



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

        }

        
    }
}
