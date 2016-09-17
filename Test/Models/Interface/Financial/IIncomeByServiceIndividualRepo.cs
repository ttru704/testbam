using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeByServiceIndividualRepo:IDisposable
    {
        List<usp_IncomeByServiceIndividual_Result> usp_IncomeByServiceIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? productNumnber, int? timeType);
    }
}
