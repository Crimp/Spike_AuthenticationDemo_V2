using ConsoleHelper.DataService;
using System;
using System.Collections.Generic;
using System.Data.Services.Client;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Xml;
using System.Xml.Linq;

namespace ConsoleClient {
    class Program {
        //Azure
        public static string customAuthenticationRootDataUrl = "http://customauthenticationservice.cloudapp.net/CustomAuthenticationDataService.svc";
        //Local Azure
        //public static string customAuthenticationRootDataUrl = "http://127.0.0.1:81/CustomAuthenticationDataService.svc";

        //Local IIS
        //public static string customAuthenticationRootDataUrl = "http://localhost/CustomAuthenticationService/CustomAuthenticationDataService.svc";

        //Local webDev
        // Remember claims based security should be only be used over HTTPS  
        //public static string customAuthenticationRootDataUrl = "http://localhost:54002/CustomAuthenticationDataService.svc";
        static void Main(string[] args) {
            Console.WriteLine("CustomAuthentication for user 'Sam'");
            DataServiceContext customAuthenticationDataContext = new DataServiceContext(new Uri(customAuthenticationRootDataUrl));
            customAuthenticationDataContext = new DataServiceContext(new Uri(customAuthenticationRootDataUrl));
            customAuthenticationDataContext.SendingRequest += new EventHandler<SendingRequestEventArgs>(delegate(object sender, SendingRequestEventArgs e) {
                e.RequestHeaders.Add("UserName", "Sam");
                e.RequestHeaders.Add("Password", "");
            });
            ShowData(customAuthenticationDataContext);

            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }
        private static void ShowData(DataServiceContext dataContext) {
            try {
                var contactQuery = (from p in dataContext.CreateQuery<Contact>("Contact") select p);
                ConsoleHelper consoleHelper = new ConsoleHelper();
                consoleHelper.PrintData(contactQuery);
            }
            catch(Exception e) {
                ShowException(e);
            }
        }
        private static void ShowException(Exception ex) {
            Exception exception = ex.InnerException != null ? ex.InnerException : ex;
            if(exception is DataServiceClientException) {
                if(((DataServiceClientException)exception).StatusCode == 403) {
                    Console.WriteLine("Validation error:");
                }
                var exceptionMessage = new StringReader(exception.Message);
                try {
                    XElement root = XElement.Load(exceptionMessage);
                    IEnumerable<XElement> message =
                      from el in root.Elements()
                      where el.Name.LocalName == "message"
                      select el;
                    foreach(XElement el in message)
                        Console.WriteLine(el.Value);
                }
                catch(XmlException) {
                    Console.WriteLine("Error: " + exception.Message);
                }
            }
            else {
                Console.WriteLine("Error: " + exception.Message);
            }
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("-------------------------------------------");
        }
    }
}
