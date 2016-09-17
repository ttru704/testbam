﻿using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Test.Models;
using System.Linq;

namespace Test
{
    public partial class principal : System.Web.UI.MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;


        protected void Page_Init(object sender, EventArgs e)
        {
            //Session["IsAuthenticated"] = HttpContext.Current.User.Identity.IsAuthenticated;
            //Boolean? authentication = Session["IsAuthenticated"] as Boolean?;
            //if (authentication == true)
            //{
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Store current user's name
            string userEmail = HttpContext.Current.User.Identity.Name;
            KPIEntities db = new KPIEntities();
            string userName = (from User_Profile in db.User_Profile
                               where User_Profile.Email == userEmail
                               select User_Profile.Name).Single();

            //Set labels appear on the side bar and the top bar to be the current user's name
            userName1.Text = userName;
            userName2.Text = userName;
            if (HttpContext.Current.User.IsInRole("Admin"))
            {
                adminLink.Visible = true;
                adminLink1.Visible = false;
                adminLink2.Visible = false;
                adminLink3.Visible = false;
                adminLink4.Visible = false;
                adminLink5.Visible = false;
            }
            else if (HttpContext.Current.User.IsInRole("Employee"))
            {
                adminLink5.Visible = false;
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            //Destroy all the sessions
            Session.Abandon();
        }
    }
}