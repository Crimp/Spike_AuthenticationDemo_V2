using DevExpress.ExpressApp.Security;
using DevExpress.ExpressApp.Security.ClientServer;
using DevExpress.ExpressApp.Security.ClientServer.Remoting;
using DevExpress.ExpressApp.Security.Strategy;
using DevExpress.ExpressApp.Xpo;
using DevExpress.Persistent.Base;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.ServiceProcess;
using System.Text;

namespace ClientServer_Remoting_StandardAuth.Server {
    static class Program {
        static void Main(string[] args) {
            try {
                string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

                ValueManager.ValueManagerType = typeof(MultiThreadValueManager<>).GetGenericTypeDefinition();

                Console.WriteLine("Starting...");
                ClientServer_Remoting_ServerApplication serverApplication = new ClientServer_Remoting_ServerApplication();
                serverApplication.ConnectionString = connectionString;

                Console.WriteLine("Setup...");
                serverApplication.Setup();
                Console.WriteLine("CheckCompatibility...");
                serverApplication.CheckCompatibility();
                serverApplication.Dispose();

                Console.WriteLine("Starting server...");
                QueryRequestSecurityStrategyHandler securityProviderHandler = delegate() {
                    return new SecurityStrategyComplex(typeof(SecuritySystemUser), typeof(SecuritySystemRole), new AuthenticationStandard());
                };

                SecuredDataServer dataServer = new SecuredDataServer(connectionString, XpoTypesInfoHelper.GetXpoTypeInfoSource().XPDictionary, securityProviderHandler);

                RemoteSecuredDataServer.Initialize(dataServer);
                TcpChannel channel = new TcpChannel(1423);
                ChannelServices.RegisterChannel(channel, false);
                RemotingConfiguration.RegisterWellKnownServiceType(typeof(RemoteSecuredDataServer), "DataServer", WellKnownObjectMode.Singleton);

                Console.WriteLine("Server is started. Press Enter to stop.");
                Console.ReadLine();
                Console.WriteLine("Stopping...");
                ChannelServices.UnregisterChannel(channel);
                Console.WriteLine("Server is stopped.");
            }
            catch(Exception e) {
                Console.WriteLine("Exception occurs: " + e.Message);
                Console.WriteLine("Press Enter to close.");
                Console.ReadLine();
            }
        }
    }
}
