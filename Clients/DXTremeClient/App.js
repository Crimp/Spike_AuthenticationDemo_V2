window.DXTremeClient = window.DXTremeClient || {};
$.support.cors = true;
$(function () {
    //Azure
    //var URL = "http://azureautxaftestsample.cloudapp.net/CustomAuthenticationDataService.svc"
    //Local Azure
    //var URL = "http://127.0.0.1:81/CustomAuthenticationDataService.svc"

    //Local IIS
    //var URL = "http://minakov-w8.corp.devexpress.com/CustomAuthenticationService/CustomAuthenticationDataService.svc"

    //Local webDev
    // Remember claims based security should be only be used over HTTPS  
    var URL = "http://localhost:54002/CustomAuthenticationDataService.svc"

    DXTremeClient.serviceUrl = URL;
    DXTremeClient.getImageUrl = function (base64Data) {
        if (!base64Data) {
            return "images/NoImage.jpg";
        }
        return "data:image/jpg;base64," + base64Data;
    };
    DXTremeClient.DataManipulationRight = DataManipulationRight(DXTremeClient.serviceUrl);
    app = DXTremeClient.app = new DevExpress.framework.html.HtmlApplication({
        ns: DXTremeClient,
        viewPortNode: document.getElementById("viewPort"),
        defaultLayout: "navbar",
        navigation: [
            new DevExpress.framework.Command({
                title: "About",
                uri: "about",
                icon: "about",
                location: "navigation"
            })
        ]
    });

    app.router.register("ContactEditView/:oid/:index", { view: "ContactEditView" });
    app.router.register("DetailView/:oid", { view: "DetailView" });
    app.router.register("LogOn/:oid", { view: "LogOn", oid: undefined });
    app.router.register(":view", { view: "index" });
});
