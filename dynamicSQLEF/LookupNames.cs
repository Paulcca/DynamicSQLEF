using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dynamicSQLEF
{
    public class LookupNames
    {        
        public int ID { get; set; }
        public String Name { get; set; }

        public virtual ICollection<ColumnNames> columnNames { get; set; }
    }
}

