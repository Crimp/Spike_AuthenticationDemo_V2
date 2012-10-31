$(function () {
    //Azure
    
        
    //var URL = "http://customauthenticationservice.cloudapp.net/CustomAuthenticationDataService.svc"
    //Local Azure
    //var URL = "http://127.0.0.1:81/CustomAuthenticationDataService.svc"

    //Local IIS
    //var URL = "http://localhost/CustomAuthenticationService/CustomAuthenticationDataService.svc"

    //Local webDev
    // Remember claims based security should be only be used over HTTPS  
    var URL = "http://localhost:54002/CustomAuthenticationDataService.svc"

    DXTremeClient.serviceUrl = URL;
    DXTremeClient.currentUser = {
        Password: ko.observable(""),
        UserName: ko.observable("")
    };
    DXTremeClient.db = new DevExpress.data.EntityStoreContext({
        service: {
            url: URL,
            errorHandler: function (error) {
                if (error.httpStatus == 401) {
                    DXTremeClient.app.navigate("LogOn/null");
                    if (errorHandler) {
                        errorHandler(error);
                    }
                } else {
                    if (error.httpStatus == 403) {
                        if (errorHandler) {
                            errorHandler(error);
                        }
                    } else {
                        alert(error.message);
                    }
                }
            },
            beforeSend: function (sender) {
                sender.params.UserName = DXTremeClient.currentUser.UserName();
                sender.params.Password = DXTremeClient.currentUser.Password();
            }
        },
        entities: {
            Contact: { key: "oid" }
        }
    });
    DXTremeClient.db.addErrorHandler = function (handler) {
        errorHandler = handler;
    };
});