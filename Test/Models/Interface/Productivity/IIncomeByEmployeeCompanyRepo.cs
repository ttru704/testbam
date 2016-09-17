﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IIncomeByEmployeeCompanyRepo: IDisposable
    {
        List<usp_IncomeByEmployeeCompany_Result> usp_IncomeByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType);
    }
}
