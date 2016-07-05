using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface
{
    public interface INumberOfNewClientsRepository : IDisposable
    {
        List<GetNumberOfNewClients_Result> GetNumberOfNewClients(DateTime start, DateTime end, int branchRef, int TimeType);

    }
}
