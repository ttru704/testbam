using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IUniqueCustomersSeenCompanyRepo: IDisposable
    {
        List<usp_UniqueCustomersSeenCompany_Result> usp_UniqueCustomersSeenCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
