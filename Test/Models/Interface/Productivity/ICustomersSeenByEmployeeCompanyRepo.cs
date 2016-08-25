using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface ICustomersSeenByEmployeeCompanyRepo : IDisposable
    {
        List<usp_CustomersSeenByEmployeeCompany_Result> usp_CustomersSeenByEmployeeCompany(DateTime? start, DateTime? end, int? companyRef, int? timeType);
    }
}
