using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAnimalsSeenByEmployeeIndividualRepo : IDisposable
    {
        List<usp_AnimalsSeenByEmployeeIndividual_Result> usp_AnimalsSeenByEmployeeIndividual(DateTime? start, DateTime? end, int? companyRef, long? staffNumber, int? timeType);
    }
}
