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
        public static string windowAuthenticationRootDataUrl = "http://localhost:50731/WindowAuthenticationDataService.svc";
        public static string unSecuredRootDataUrl = "http://localhost:62445/UnSecuredDataService.svc";
        // Remember claims based security should be only be used over HTTPS
        public static string customAuthenticationRootDataUrl = "http://localhost:54002/CustomAuthenticationDataService.svc";
        static void Main(string[] args) {
            Thread.Sleep(1000); //Wait created DB and start services.
            Console.WriteLine("UnSecured");
            DataServiceContext unSecuredDataContext = new DataServiceContext(new Uri(unSecuredRootDataUrl));
            ShowData(unSecuredDataContext);


            Console.WriteLine("WindowAuthentication");
            DataServiceContext windowAuthenticationDataContext = new DataServiceContext(new Uri(windowAuthenticationRootDataUrl));
            ShowData(windowAuthenticationDataContext);

            Console.WriteLine("CustomAuthentication for does not exist user 'NotExistUser'");
            DataServiceContext customAuthenticationDataContext = new DataServiceContext(new Uri(customAuthenticationRootDataUrl));
            //customAuthenticationDataContext.Credentials = new NetworkCredential("NotExistUser", "", ""); 
            customAuthenticationDataContext.SendingRequest += new EventHandler<SendingRequestEventArgs>(delegate(object sender, SendingRequestEventArgs e) {
                // Remember claims based security should be only be used over HTTPS
                e.RequestHeaders.Add("UserName", "NotExistUser");
                e.RequestHeaders.Add("Password", "");
            });
            ShowData(customAuthenticationDataContext);

            Console.WriteLine("CustomAuthentication for user 'Sam'");
            customAuthenticationDataContext = new DataServiceContext(new Uri(customAuthenticationRootDataUrl));
            customAuthenticationDataContext.SendingRequest += new EventHandler<SendingRequestEventArgs>(delegate(object sender, SendingRequestEventArgs e) {
                e.RequestHeaders.Add("UserName", "Sam");
                e.RequestHeaders.Add("Password", "");
            });
            ShowData(customAuthenticationDataContext);
            EditEmail(customAuthenticationDataContext, "Sam");
            ShowData(customAuthenticationDataContext);
            EditEmail(customAuthenticationDataContext, "Read-Only");

            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }
        private static void EditEmail(DataServiceContext dataContext, string firstName) {
            Console.WriteLine("Edit email for contact: " + firstName);
            var contactQuery = (from p in dataContext.CreateQuery<Contact>("Contact") where p.FirstName == firstName select p);
            foreach(Contact contact in contactQuery) {
                contact.Email = @"test@mail.test.com";
                dataContext.UpdateObject(contact);
            }
            Console.WriteLine("Saving changes...");
            try {
                dataContext.SaveChanges();
                Console.WriteLine("Save changes");
            }
            catch(Exception ex) {
                ShowException(ex);
            }
        }
        private static void ShowData(DataServiceContext dataContext) {
            try {
                var contactQuery = (from p in dataContext.CreateQuery<Contact>("Contact") select p);
                ConsoleHelper ConsoleHelper = new ConsoleHelper();
                ConsoleHelper.PrintData(contactQuery);
            }
            catch(Exception ex) {
                ShowException(ex);
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
