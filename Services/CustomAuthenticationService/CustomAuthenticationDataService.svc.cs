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
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Web;

namespace CustomAuthenticationService {
    [JSONPSupportBehaviorAttribute]
    public class CustomAuthenticationDataService : DataServiceBase {
        static CustomAuthenticationDataService() {
            AddServiceOperation("IsGranted");
            AddServiceOperation("IsUserAllowed");
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
        [WebGet]
        public bool IsGranted(string objectType, string memberName, string objectHandle, string operation) {
            Type type = XafTypesInfo.Instance.FindTypeInfo(objectType).Type;
            return ((IRequestSecurity)SecuritySystem.Instance).IsGranted(new ClientPermissionRequest(type, memberName, objectHandle, operation));
        }
        [WebGet]
        public bool IsUserAllowed() {
            return true;
        }
    }
}
