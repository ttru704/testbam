using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IIncomeByEmployeeIndividualRepo: IDisposable
    {
        List<usp_IncomeByEmployeeIndividual_Result> usp_IncomeByEmployeeIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? staffNumber, int? timeType);
    }
}
