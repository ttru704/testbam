using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeByProductIndividualRepo : IDisposable
    {
        List<usp_IncomeByProductIndividual_Result> usp_IncomeByProductIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? productNumnber, int? timeType);
    }
}
