﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class KPIEntities : DbContext
    {
        public KPIEntities()
            : base("name=KPIEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Audit_Log> Audit_Log { get; set; }
        public virtual DbSet<Branch_Profile> Branch_Profile { get; set; }
        public virtual DbSet<Branch_Types> Branch_Types { get; set; }
        public virtual DbSet<Business_Types> Business_Types { get; set; }
        public virtual DbSet<Category_Types> Category_Types { get; set; }
        public virtual DbSet<Client_Profile> Client_Profile { get; set; }
        public virtual DbSet<Company_Profile> Company_Profile { get; set; }
        public virtual DbSet<Configuration> Configurations { get; set; }
        public virtual DbSet<Gender_Types> Gender_Types { get; set; }
        public virtual DbSet<Key_Performance_Indexes> Key_Performance_Indexes { get; set; }
        public virtual DbSet<KPI_For_Business> KPI_For_Business { get; set; }
        public virtual DbSet<KPI_For_Company> KPI_For_Company { get; set; }
        public virtual DbSet<KPI_For_User> KPI_For_User { get; set; }
        public virtual DbSet<KPI_Types> KPI_Types { get; set; }
        public virtual DbSet<Param> Params { get; set; }
        public virtual DbSet<Product_Profile> Product_Profile { get; set; }
        public virtual DbSet<Staff_Profile> Staff_Profile { get; set; }
        public virtual DbSet<Staff_Types> Staff_Types { get; set; }
        public virtual DbSet<Subject_Profile> Subject_Profile { get; set; }
        public virtual DbSet<Subject_Types> Subject_Types { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Transaction_Items> Transaction_Items { get; set; }
        public virtual DbSet<Transaction_Summary> Transaction_Summary { get; set; }
        public virtual DbSet<User_Profile> User_Profile { get; set; }
    
        public virtual ObjectResult<GetProduct_Result> GetProduct()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetProduct_Result>("GetProduct");
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<GetNumberofAnimalSeen_Result> GetNumberofAnimalSeen(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetNumberofAnimalSeen_Result>("GetNumberofAnimalSeen", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<GetIncomeProductCategory_Result> GetIncomeProductCategory(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetIncomeProductCategory_Result>("GetIncomeProductCategory", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<GetTotalSalesMonth_Result> GetTotalSalesMonth(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetTotalSalesMonth_Result>("GetTotalSalesMonth", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<UniqueCustomersSeen_Result> UniqueCustomersSeen(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UniqueCustomersSeen_Result>("UniqueCustomersSeen", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<NewClientsBComparison_Result> NewClientsBComparison(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<NewClientsBComparison_Result>("NewClientsBComparison", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<AnimalsSeenBComparison_Result> AnimalsSeenBComparison(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<AnimalsSeenBComparison_Result>("AnimalsSeenBComparison", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<TransExclude0TotalBComparison_Result> TransExclude0TotalBComparison(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TransExclude0TotalBComparison_Result>("TransExclude0TotalBComparison", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<AvgDollarPerTransaction_Result> AvgDollarPerTransaction(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<AvgDollarPerTransaction_Result>("AvgDollarPerTransaction", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<AvgDollarPerCustomer_Result> AvgDollarPerCustomer(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> timeType, Nullable<int> branchRef)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<AvgDollarPerCustomer_Result>("AvgDollarPerCustomer", startParameter, endParameter, timeTypeParameter, branchRefParameter);
        }
    
        public virtual ObjectResult<RetailTotal_Result> RetailTotal(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> companyRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var companyRefParameter = companyRef.HasValue ?
                new ObjectParameter("companyRef", companyRef) :
                new ObjectParameter("companyRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RetailTotal_Result>("RetailTotal", startParameter, endParameter, companyRefParameter, timeTypeParameter);
        }
    
        public virtual ObjectResult<ProductCategory_Result> ProductCategory(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ProductCategory_Result>("ProductCategory", startParameter, endParameter, branchRefParameter);
        }
    
        public virtual ObjectResult<TotalSalesBComparison_Result> TotalSalesBComparison(Nullable<System.DateTime> start, Nullable<System.DateTime> end, Nullable<int> branchRef, Nullable<int> timeType)
        {
            var startParameter = start.HasValue ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(System.DateTime));
    
            var endParameter = end.HasValue ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(System.DateTime));
    
            var branchRefParameter = branchRef.HasValue ?
                new ObjectParameter("branchRef", branchRef) :
                new ObjectParameter("branchRef", typeof(int));
    
            var timeTypeParameter = timeType.HasValue ?
                new ObjectParameter("TimeType", timeType) :
                new ObjectParameter("TimeType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TotalSalesBComparison_Result>("TotalSalesBComparison", startParameter, endParameter, branchRefParameter, timeTypeParameter);
        }
    }
}
