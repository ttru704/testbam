using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAvgCustomersSeenByEmployeeCompanyRepo : IDisposable
    {
        List<usp_AvgCustomersSeenByEmployeeCompany_Result> usp_AvgCustomersSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType);
    }
}
