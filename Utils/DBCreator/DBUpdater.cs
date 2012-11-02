using BusinessObjectsLibrary;
using DataProvider;
using DevExpress.Data.Filtering;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Security;
using DevExpress.ExpressApp.Security.Strategy;
using DevExpress.Xpo;
using DevExpress.Xpo.DB;
using DevExpress.Xpo.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Principal;
using System.Web;

namespace DBCreator {
    public class DBUpdater {
        IObjectSpace objectSpace;
        public DBUpdater(string connectionString, Assembly[] assemblies) {
            DataServiceHelper dataServiceHelper = new DataServiceHelper(connectionString, assemblies, "");
            objectSpace = dataServiceHelper.ObjectSpaceProvider.CreateUpdatingObjectSpace(true);
        }
        public DBUpdater(IObjectSpace objectSpace) {
            this.objectSpace = objectSpace;
        }
        public void CreateDB() {
            CreateTestData();
        }
        public void AddNewUser(string userName, string lastName, string email, string password) {
            string criteria = string.Format("UserName == '{0}'", userName);
            SecuritySystemUser newUser = objectSpace.FindObject<SecuritySystemUser>(CriteriaOperator.Parse(criteria));
            if(newUser == null) {
                newUser = objectSpace.CreateObject<SecuritySystemUser>();
                newUser.UserName = userName;
                newUser.SetPassword(password);

                SecuritySystemRole userRole = objectSpace.FindObject<SecuritySystemRole>(new BinaryOperator("Name", "Users"));
                newUser.Roles.Add(userRole);
                newUser.Save();
                objectSpace.CommitChanges();
            }
            AddContact(userName, lastName, email, newUser.Oid);
        }
        public void AddContact(string firstName, string lastName, string email, Guid ownerId) {
            string criteria = string.Format("FirstName == '{0}' && LastName == '{1}'", firstName, lastName);
            Contact newUserContact = objectSpace.FindObject<Contact>(CriteriaOperator.Parse(criteria));
            if(newUserContact == null) {
                newUserContact = objectSpace.CreateObject<Contact>();
                newUserContact.FirstName = firstName;
                newUserContact.LastName = lastName;
                newUserContact.Email = email;
                newUserContact.OwnerId = ownerId;
                objectSpace.CommitChanges();
            }
        }
        private void CreateTestData() {
            CreateAdminRole();
            CreateUserRole();
            objectSpace.CommitChanges();

            //AddNewUser("Mary", "Tellitson", "mary_tellitson@md.com", "mary");
            AddContact("Read-Only", "Read-Only", "Read-Only@md.com", Guid.NewGuid());
            AddNewUser("Sam", "Tellitson", "sam_tellitson@md.com", "");
            AddNewUser("John", "Nilsen", "john_nilsen@md.com", "");
            AddNewUser(WindowsIdentity.GetCurrent().Name, "", "", "");
            AddNewUser("Test2", "Test2", "Test2@md.com", "Test2");

            objectSpace.CommitChanges();
        }
        private void CreateAdminRole() {
            SecuritySystemUser userAdmin = objectSpace.FindObject<SecuritySystemUser>(new BinaryOperator("UserName", "Admin"));
            if(userAdmin == null) {
                userAdmin = objectSpace.CreateObject<SecuritySystemUser>();
                userAdmin.UserName = "Admin";
                userAdmin.SetPassword("");

                SecuritySystemRole adminRole = objectSpace.FindObject<SecuritySystemRole>(new BinaryOperator("Name", "Administrators"));
                if(adminRole == null) {
                    adminRole = objectSpace.CreateObject<SecuritySystemRole>();
                    adminRole.Name = "Administrators";
                }
                adminRole.IsAdministrative = true;
                userAdmin.Roles.Add(adminRole);
            }
        }
        private void CreateUserRole() {
            SecuritySystemRole userRole = objectSpace.FindObject<SecuritySystemRole>(new BinaryOperator("Name", "Users"));
            if(userRole == null) {
                userRole = objectSpace.CreateObject<SecuritySystemRole>();
                userRole.Name = "Users";

                SecuritySystemTypePermissionObject typePermissions = objectSpace.CreateObject<SecuritySystemTypePermissionObject>();
                typePermissions.TargetType = typeof(Contact);
                typePermissions.AllowNavigate = true;
                typePermissions.AllowRead = true;
                typePermissions.Save();
                userRole.TypePermissions.Add(typePermissions);

                SecuritySystemObjectPermissionsObject fullAccessObjectPermission = objectSpace.CreateObject<SecuritySystemObjectPermissionsObject>();
                fullAccessObjectPermission.Criteria = "[OwnerId] = CurrentUserId()";
                //fullAccessObjectPermission.AllowDelete = true;
                fullAccessObjectPermission.AllowNavigate = true;
                fullAccessObjectPermission.AllowRead = true;
                fullAccessObjectPermission.AllowWrite = true;
                fullAccessObjectPermission.Save();
                typePermissions.ObjectPermissions.Add(fullAccessObjectPermission);


                SecuritySystemObjectPermissionsObject readOnlyObjectPermission = objectSpace.CreateObject<SecuritySystemObjectPermissionsObject>();
                readOnlyObjectPermission.Criteria = "[FirstName] Like '%Read-Only%'";
                readOnlyObjectPermission.AllowNavigate = true;
                readOnlyObjectPermission.AllowRead = true;
                readOnlyObjectPermission.Save();
                typePermissions.ObjectPermissions.Add(readOnlyObjectPermission);
            }
        }
    }
}