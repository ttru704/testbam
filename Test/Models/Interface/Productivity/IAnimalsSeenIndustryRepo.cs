using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAnimalsSeenIndustryRepo : IDisposable
    {
        List<usp_AnimalsSeenIndustry_Result> usp_AnimalsSeenIndustry(DateTime start, DateTime end, int companyRef, int size, int timeType);

    }
}