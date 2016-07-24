using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerComRepo: IDisposable
    {
        List<usp_AvgDollarPerCustomerCom_Result> usp_AvgDollarPerCustomerCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
