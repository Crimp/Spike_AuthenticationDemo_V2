using DevExpress.ExpressApp;
using DevExpress.ExpressApp.MiddleTier;
using DevExpress.ExpressApp.Xpo;
using DevExpress.Xpo;
using DevExpress.Xpo.DB;
using DevExpress.Xpo.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using XafWinClient.Module.Win;

namespace ClientServer_Remoting_StandardAuth.Server {
    public class ClientServer_Remoting_ServerApplication : ServerApplication {
        public ClientServer_Remoting_ServerApplication() {
            ApplicationName = "ClientServer_CustomAuth";

            Modules.Add(new XafWinClientWindowsFormsModule());

            DatabaseVersionMismatch += delegate(object sender, DatabaseVersionMismatchEventArgs e) {
                e.Updater.Update();

                Session session = new Session(XpoDefault.GetDataLayer(ConnectionString, XpoTypesInfoHelper.GetXpoTypeInfoSource().XPDictionary, AutoCreateOption.SchemaAlreadyExists));
                Console.WriteLine("Creating XPObjectType records...");
                List<XPClassInfo> list = new List<XPClassInfo>();
                foreach(XPClassInfo ci in XpoTypesInfoHelper.GetXpoTypeInfoSource().XPDictionary.Classes) {
                    if(ci.IsPersistent) {
                        list.Add(ci);
                    }
                }
                session.CreateObjectTypeRecords(list.ToArray());

                e.Handled = true;
            };
        }
        protected override void CreateDefaultObjectSpaceProvider(CreateCustomObjectSpaceProviderEventArgs args) {
            args.ObjectSpaceProvider = new XPObjectSpaceProvider(args.ConnectionString, args.Connection);
        }
    }
}
