using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerCompanyRepo: IDisposable
    {
        List<usp_AvgDollarPerCustomerCompany_Result> usp_AvgDollarPerCustomerCompany(DateTime start, DateTime end, long companyRef, int timeType);
    }
}
