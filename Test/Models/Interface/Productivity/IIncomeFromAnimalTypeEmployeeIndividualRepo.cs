using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IIncomeFromAnimalTypeEmployeeIndividualRepo: IDisposable
    {
        List<usp_IncomeFromAnimalTypeEmployeeIndividual_Result> usp_IncomeFromAnimalTypeEmployeeIndividual(DateTime? start, DateTime? end, int? companyRef, long? staffNumber, int? timeType);
    }
}
