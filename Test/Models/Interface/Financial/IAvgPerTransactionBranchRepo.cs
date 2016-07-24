﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgPerTransactionBranchRepo: IDisposable
    {
        List<usp_AvgPerTransactionBranch_Result> usp_AvgPerTransactionBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType);
    }
}
