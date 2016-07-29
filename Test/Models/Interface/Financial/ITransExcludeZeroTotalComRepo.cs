using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITransExcludeZeroTotalComRepo : IDisposable
    {
        List<usp_TransExcludeZeroTotalCom_Result> usp_TransExcludeZeroTotalCom(DateTime start, DateTime end, int companyRef, int timeType);

    }
}
