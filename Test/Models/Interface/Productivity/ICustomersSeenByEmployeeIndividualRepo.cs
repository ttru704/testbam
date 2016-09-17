using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface ICustomersSeenByEmployeeIndividualRepo : IDisposable
    {
        List<usp_CustomersSeenByEmployeeIndividual_Result> usp_CustomersSeenByEmployeeIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? staffNumber, int? timeType);
    }
}
