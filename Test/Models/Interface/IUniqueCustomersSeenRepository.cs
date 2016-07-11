using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Test.Models;

namespace Test.Models.Interface
{
    public interface IUniqueCustomersSeenRepository : IDisposable
    {
        List<UniqueCustomersSeen_Result> UniqueCustomersSeen(DateTime start, DateTime end, int branchRef, int timeType);

    }
}