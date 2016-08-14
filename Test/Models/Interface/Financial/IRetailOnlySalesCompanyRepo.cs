using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IRetailOnlySalesCompanyRepo: IDisposable
    {
        List<usp_RetailOnlySalesCompany_Result> usp_RetailOnlySalesCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
