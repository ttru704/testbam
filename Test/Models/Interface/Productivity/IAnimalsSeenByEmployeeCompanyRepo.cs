﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAnimalsSeenByEmployeeCompanyRepo : IDisposable
    {
        List<usp_AnimalsSeenByEmployeeCompany_Result> usp_AnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType);

    }
}
