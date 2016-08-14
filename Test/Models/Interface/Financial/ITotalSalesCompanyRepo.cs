using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesCompanyRepo : IDisposable
    {
        List<usp_TotalSalesCompany_Result> usp_TotalSalesCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
