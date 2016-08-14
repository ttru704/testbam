using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerTransactionCompanyRepo: IDisposable
    {
        List<usp_AvgDollarPerTransactionCompany_Result> usp_AvgDollarPerTransactionCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
