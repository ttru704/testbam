//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Test.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transaction_Summary
    {
        public long Ref_Number { get; set; }
        public long Company_Ref { get; set; }
        public long Branch_Ref { get; set; }
        public System.DateTime Trn_Date { get; set; }
        public long Trn_Number { get; set; }
        public long Cln_Number { get; set; }
        public long Sub_Number { get; set; }
        public bool Is_New_Client { get; set; }
        public bool Is_New_Animal { get; set; }
        public decimal Retail_Total { get; set; }
        public decimal Service_Total { get; set; }
        public System.DateTime Last_Updated { get; set; }
    }
}
