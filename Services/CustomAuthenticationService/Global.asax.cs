﻿using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Security;
using DevExpress.ExpressApp.Security.Strategy;
using DevExpress.Persistent.Base;
using ODataDemoServiceBase;
using System;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CustomAuthenticationService {
    public class Global : System.Web.HttpApplication {
        public static string ConnectionString;
        protected void Application_Start(object sender, EventArgs e) {
            ValueManager.ValueManagerType = typeof(ASPRequestValueManager<>).GetGenericTypeDefinition();
            ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        }
        protected void Session_Start(object sender, EventArgs e) { }
        protected void Application_AuthenticateRequest(object sender, EventArgs e) {
            SecurityStrategyComplex securityStrategy = new SecurityStrategyComplex(typeof(SecuritySystemUser), typeof(SecuritySystemRole), new AuthenticationStandard());
            SecuritySystem.SetInstance(securityStrategy);
            // Remember claims based security should be only be used over HTTPS
            //if(context.Request.IsSecureConnection){
            string userName = GetUserName(HttpContext.Current.Request);
                if(string.IsNullOrEmpty(userName)) {
                    HttpContext.Current.Response.Status = "401 Unauthorized";
                    HttpContext.Current.Response.StatusCode = 401;
                    HttpContext.Current.Response.End();
                    return;
                }
                ((AuthenticationStandardLogonParameters)SecuritySystem.LogonParameters).UserName = userName;
                ((AuthenticationStandardLogonParameters)SecuritySystem.LogonParameters).Password = GetPassword(HttpContext.Current.Request);
            //}

            CustomAuthenticationServiceHelper hellper = new CustomAuthenticationServiceHelper();
            try {
#if Azure
                //Calling Cross Domain WCF Service using Jquery
                HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
                if(HttpContext.Current.Request.HttpMethod == "OPTIONS") {
                    //These headers are handling the "pre-flight" OPTIONS call sent by the browser
                    HttpContext.Current.Response.AddHeader("Access-Control-Allow-Methods", "GET, POST, MERGE, PUT, PATCH, DELETE");
                    HttpContext.Current.Response.AddHeader("Access-Control-Allow-Headers", "Content-Type, Accept");
                    HttpContext.Current.Response.AddHeader("Access-Control-Max-Age", "1728000");
                    HttpContext.Current.Response.End();
                }            
#endif
                SecuritySystem.Instance.Logon(hellper.ObjectSpaceProvider.CreateObjectSpace());
            }
            catch(AuthenticationException) {
                HttpContext.Current.Response.Status = "401 Unauthorized";
                HttpContext.Current.Response.StatusCode = 401;
                HttpContext.Current.Response.End();
            }
        }
        protected void Application_Error(object sender, EventArgs e) { }
        protected void Session_End(object sender, EventArgs e) { }
        protected void Application_End(object sender, EventArgs e) { }
        private string GetUserName(HttpRequest request) {
            if(request.Params.AllKeys.Contains("UserName")) {
                return HttpContext.Current.Request.Params["UserName"];
            }
            if(request.Headers.AllKeys.Contains("UserName")) {
                return HttpContext.Current.Request.Headers["UserName"];
            }
            return null;
        }
        private string GetPassword(HttpRequest request) {
            if(request.Params.AllKeys.Contains("Password")) {
                return request.Params["Password"];
            }
            if(request.Headers.AllKeys.Contains("Password")) {
                return request.Headers["Password"];
            }
            return null;
        }
    }
}