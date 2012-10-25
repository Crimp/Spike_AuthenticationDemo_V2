using System;
using System.Configuration;
using System.Windows.Forms;

using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Security;
using DevExpress.ExpressApp.Win;
using DevExpress.Persistent.Base;
using DevExpress.Persistent.BaseImpl;
using DevExpress.ExpressApp.Security.ClientServer;
using DevExpress.ExpressApp.Security.ClientServer.Remoting;
using DevExpress.ExpressApp.Security.ClientServer.Wcf;
using System.ServiceModel;

namespace XafWinClient.Win {
    static class Program {
        [STAThread]
        static void Main() {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            EditModelPermission.AlwaysGranted = System.Diagnostics.Debugger.IsAttached;
            XafWinClientWindowsFormsApplication winApplication = new XafWinClientWindowsFormsApplication();

#if Azure
            SetupForWCFServer(winApplication);
#else
            SetupForRemotingServer(winApplication);
#endif
        }
#if Azure
        private static void SetupForWCFServer(WinApplication winApplication) {
#if AzureRelease
            string connectionString = "http://CustomWcfSecuredDataServer.cloudapp.net/CustomWcfSecuredDataServer.svc";
#else
#if AzureDebug
            //string connectionString = "http://127.0.0.1:81/CustomWcfSecuredDataServer.svc";
#endif
#endif
            string connectionString = "http://localhost:63829/CustomWcfSecuredDataServer.svc";
            //


            try {
                EndpointAddress endpointAddress = new EndpointAddress(connectionString);
                WcfSecuredDataServerClient clientDataServer = new WcfSecuredDataServerClient(
                    WcfDataServerHelper.CreateDefaultBinding(), endpointAddress);

                ServerSecurityClient securityClient = new ServerSecurityClient(clientDataServer, new ClientInfoFactory());
                winApplication.ApplicationName = "ClientServer_CustomAuth";
                winApplication.Security = securityClient;
                winApplication.CreateCustomObjectSpaceProvider += delegate(object sender, CreateCustomObjectSpaceProviderEventArgs e) {
                    e.ObjectSpaceProvider = new DataServerObjectSpaceProvider(clientDataServer, securityClient);
                };
                winApplication.CreateCustomLogonWindowObjectSpace += delegate(object sender, CreateCustomLogonWindowObjectSpaceEventArgs e) {
                    e.ObjectSpace = ((XafApplication)sender).CreateObjectSpace();
                };

                winApplication.Setup();
                winApplication.Start();

                clientDataServer.Close();
            } catch(Exception e) {
                winApplication.HandleException(e);
            }
        }
#else
        private static void SetupForRemotingServer(WinApplication application) {
            string connectionString = "tcp://localhost:1423/DataServer";
            try {
                IDataServer clientDataServer = (IDataServer)Activator.GetObject(typeof(RemoteSecuredDataServer), connectionString);

                ServerSecurityClient securityClient = new ServerSecurityClient(clientDataServer, new ClientInfoFactory());
                application.ApplicationName = "ClientServer_CustomAuth";
                application.Security = securityClient;
                application.CreateCustomObjectSpaceProvider += delegate(object sender, CreateCustomObjectSpaceProviderEventArgs e) {
                    e.ObjectSpaceProvider = new DataServerObjectSpaceProvider(clientDataServer, securityClient);
                };

                application.Setup();
                application.Start();
            } catch(Exception e) {
                application.HandleException(e);
            }
        }
#endif
    }
}
