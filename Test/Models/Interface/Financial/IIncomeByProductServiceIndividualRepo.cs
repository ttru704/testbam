using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeByProductServiceIndividualRepo:IDisposable
    {
        List<usp_IncomeByProductServiceIndividual_Result> usp_IncomeByProductServiceIndividual(DateTime? start, DateTime? end, int? companyRef, long? productNumnber, string productClass, int? timeType);
    }
}
