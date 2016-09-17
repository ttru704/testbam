using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ISmallAnimalsCompanyRepo: IDisposable
    {
        List<usp_SmallAnimalsCompany_Result> usp_SmallAnimalsCompany(DateTime start, DateTime end, long companyRef, int timeType);
    }
}
