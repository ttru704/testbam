using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface ICustomersSeenByEmpComRepo : IDisposable
    {
        List<usp_CustomersSeenByEmpCom_Result> usp_CustomersSeenByEmpCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
