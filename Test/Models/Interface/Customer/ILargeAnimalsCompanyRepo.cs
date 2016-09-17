using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ILargeAnimalsCompanyRepo: IDisposable
    {
        List<usp_LargeAnimalsCompany_Result> usp_LargeAnimalsCompany(DateTime start, DateTime end, long companyRef, int timeType);
    }
}
