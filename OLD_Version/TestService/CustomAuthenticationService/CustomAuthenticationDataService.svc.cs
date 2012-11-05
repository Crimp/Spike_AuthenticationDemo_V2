using BusinessObjectsLibrary;
using DataProvider;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Security;
using System;
using System.Collections.Generic;
using System.Data.Services;
using System.Data.Services.Common;
using System.Linq;
using System.Reflection;
using System.ServiceModel.Web;
using System.Web;

namespace CustomAuthenticationService {
    public class CustomAuthenticationDataService : DataServiceBase {
        static CustomAuthenticationDataService() {
            AddServiceOperation("IsGranted");
        }
        public CustomAuthenticationDataService()
            : this(new HttpContextWrapper(HttpContext.Current)) {
        }
        public CustomAuthenticationDataService(HttpContextBase httpContext)
            : this(httpContext, new CustomAuthenticationServiceHelper(), "CustomAuthenticationService") {
        }
        public CustomAuthenticationDataService(HttpContextBase httpContext, DataServiceHelper dataServiceHelper, string containerName)
            : base(httpContext, dataServiceHelper, containerName) {
        }
        [WebInvoke(Method = "POST")]
        public bool IsGranted(string objectType, string memberName, string objectHandle, string operation) {
            return ((IRequestSecurity)SecuritySystem.Instance).IsGranted(new ClientPermissionRequest(Type.GetType(objectType), memberName, objectHandle, operation));
        }
    }
}
