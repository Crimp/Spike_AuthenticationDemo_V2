using DevExpress.ExpressApp.Security.ClientServer.Wcf;
//------------------------------------------------------------------------------
// <copyright file="WebDataService.svc.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Data.Services;
using System.Data.Services.Common;
using System.Diagnostics;
using System.Linq;
using System.ServiceModel.Web;
using System.Web;

namespace ClientServer_Wcf_StandartAuth.Server
{
    public class WcfDataService1 : DataService<DataModel>
    {
        // This method is called only once to initialize service-wide policies.
        public static void InitializeService(DataServiceConfiguration config)
        {
            // TODO: set rules to indicate which entity sets and service operations are visible, updatable, etc.
            // Examples:
            // config.SetEntitySetAccessRule("MyEntityset", EntitySetRights.AllRead);
            // config.SetServiceOperationAccessRule("MyServiceOperation", ServiceOperationRights.All);
            config.SetEntitySetAccessRule("Processes", EntitySetRights.AllRead);
            config.SetServiceOperationAccessRule("IsGranted", ServiceOperationRights.AllRead);
            config.DataServiceBehavior.MaxProtocolVersion = DataServiceProtocolVersion.V3;
        }
        [WebInvoke(Method = "POST")]
        public bool IsGranted(int employeeCount) {
            return false;
            //CustomWcfSecuredDataServer server = new CustomWcfSecuredDataServer();
            //server.IsGranted(
        }
    }
    [System.Data.Services.Common.DataServiceKeyAttribute("Name")]
    public class ProcessModel {
        public string Name { get; set; }
        public int ID { get; set; }
    }
    public class DataModel {
        public DataModel() {
            var processProjection = from p in Process.GetProcesses()
                                    select new ProcessModel {
                                        Name = p.ProcessName,
                                        ID = p.Id
                                    };

            Processes = processProjection.AsQueryable();
        }
        public IQueryable<ProcessModel> Processes { get; private set; }
    }
}
