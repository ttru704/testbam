using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenRepository: IDisposable
    {
        List<AnimalsSeenBComparison_Result> AnimalsSeenBComparison(DateTime start, DateTime end, int branchRef, int timeType);

    }
}