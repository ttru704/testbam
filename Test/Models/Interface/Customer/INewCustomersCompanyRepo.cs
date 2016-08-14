using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewCustomersCompanyRepo: IDisposable
    {
        List<usp_NewCustomersCompany_Result> usp_NewCustomersCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
