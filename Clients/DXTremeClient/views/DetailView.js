DXTremeClient.DetailView = function (params) {
    var _oid;
    var model = {
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        handleBackClick: function (e) {
            DXTremeClient.app.navigate("_back");
        },
        handleEditClick: function (e) {
            //var test = DataManipulationRight("http://localhost:63829/CustomWcfSecuredDataServer.svc");
            //var clientInfo = ClientInfo(DXTremeClient.currentUser.UserName(), DXTremeClient.currentUser.Password(), "b2d97420-c6ca-4dfc-8c19-41a6ed7d3069");
            //var clientPermissionRequest = ClientPermissionRequest("Write", "BusinessObjectsLibrary.Contact", "BusinessObjectsLibrary.Contact(" + _oid + ")");
            //test.IsGrantedBatch(clientInfo, clientPermissionRequest);
            var uri = DXTremeClient.app.router.format({
                action: "ContactEditView",
                oid: _oid,
                index: _oid
            });
            DXTremeClient.app.navigate(uri);
        },
        viewShown: function () {
            DXTremeClient.db.Contact.load({
                filter: ["oid", new DevExpress.data.Guid(params.oid)]
            }).done(createDetailContent);
        }
    };

    var createDetailContent = function (list) {
        model.FirstName(list[0].FirstName);
        model.LastName(list[0].LastName);
        model.Email(list[0].Email);
        _oid = list[0].oid;
    };

    return model;
}