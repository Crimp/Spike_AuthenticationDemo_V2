﻿using DevExpress.Persistent.Base;
using DevExpress.Persistent.BaseImpl;
using DevExpress.Xpo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObjectsLibrary {
    [DefaultClassOptions]
    //[NavigationItem]
    public class Contact : BaseObject {
        string firstName;
        string lastName;
        string email;
        Guid ownerId;

        public Contact(Session session)
            : base(session) {
        }
        public string FirstName {
            get {
                return firstName;
            }
            set {
                SetPropertyValue("FirstName", ref firstName, value);
            }
        }
        public string LastName {
            get {
                return lastName;
            }
            set {
                SetPropertyValue("LastName", ref lastName, value);
            }
        }
        public string Email {
            get {
                return email;
            }
            set {
                SetPropertyValue("Email", ref email, value);
            }
        }
        [Browsable(false)]
        public Guid OwnerId {
            get {
                return ownerId;
            }
            set {
                SetPropertyValue("OwnerId", ref ownerId, value);
            }
        }
    }
}
