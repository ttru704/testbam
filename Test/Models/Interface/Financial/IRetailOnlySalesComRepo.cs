using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IRetailOnlySalesComRepo: IDisposable
    {
        List<usp_RetailOnlySalesCom_Result> usp_RetailOnlySalesCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
