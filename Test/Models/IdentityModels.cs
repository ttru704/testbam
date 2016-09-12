using System;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Test.Models;
using System.Data.Entity;

namespace Test.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
        public long Company_Ref { get; set; }

        

        public ClaimsIdentity GenerateUserIdentity(ApplicationUserManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder); // This needs to go before the other rules!

            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.Id).HasColumnName("Ref_Number");
            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.UserName).HasColumnName("User_Name");
            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.PasswordHash).HasColumnName("Password");
            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.Email).HasColumnName("Email");
            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.Name).HasColumnName("Name");
            modelBuilder.Entity<ApplicationUser>().ToTable("User_Profile").Property(p => p.Company_Ref).HasColumnName("Company_Ref");


            modelBuilder.Entity<IdentityRole>().ToTable("Roles").Property(p => p.Id).HasColumnName("Ref_Number");

            modelBuilder.Entity<IdentityUserRole>().ToTable("User_Roles").Property(p => p.UserId).HasColumnName("User_Id");
            modelBuilder.Entity<IdentityUserRole>().ToTable("User_Roles").Property(p => p.RoleId).HasColumnName("Role_Id");


            modelBuilder.Entity<IdentityUserClaim>().ToTable("User_Claims").Property(p => p.Id).HasColumnName("Ref_Number");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("User_Claims").Property(p => p.UserId).HasColumnName("User_Id");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("User_Claims").Property(p => p.ClaimType).HasColumnName("Claim_Type");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("User_Claims").Property(p => p.ClaimValue).HasColumnName("Claim_Value");


            modelBuilder.Entity<IdentityUserLogin>().ToTable("User_Logins").Property(p => p.UserId).HasColumnName("User_Id");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("User_Logins").Property(p => p.LoginProvider).HasColumnName("Login_Provider");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("User_Logins").Property(p => p.ProviderKey).HasColumnName("Provider_Key");

        }

        public static ApplicationDbContext Create()

        {
            return new ApplicationDbContext();
        }
    }
}

#region Helpers
namespace Test
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request.QueryString[ProviderNameKey];
        }

        public const string CodeKey = "code";
        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }

        public const string UserIdKey = "userId";
        public static string GetUserIdFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
        }

        public static string GetResetPasswordRedirectUrl(string code, HttpRequest request)
        {
            var absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
        {
            var absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
}
#endregion
