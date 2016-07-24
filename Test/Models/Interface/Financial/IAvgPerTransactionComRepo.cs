using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgPerTransactionComRepo: IDisposable
    {
        List<usp_AvgPerTransactionCom_Result> usp_AvgPerTransactionCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
