using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IRetailTotalRepository: IDisposable
    {
        List<RetailTotal_Result> RetailTotal(DateTime start, DateTime end, int companyRef, int timeType);    
    }
}
