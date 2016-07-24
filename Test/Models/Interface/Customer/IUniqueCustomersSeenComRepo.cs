using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IUniqueCustomersSeenComRepo: IDisposable
    {
        List<usp_UniqueCustomersSeenCom_Result> usp_UniqueCustomersSeenCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
