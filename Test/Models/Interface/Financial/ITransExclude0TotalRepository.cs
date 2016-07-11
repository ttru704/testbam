using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITransExclude0TotalRepository : IDisposable
    {
        List<TransExclude0TotalBComparison_Result> TransExclude0TotalBComparison(DateTime start, DateTime end, int branchRef, int timeType);
    }
}