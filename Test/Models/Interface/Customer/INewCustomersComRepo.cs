using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewCustomersComRepo: IDisposable
    {
        List<usp_NewCustomersCom_Result> usp_NewCustomersCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
