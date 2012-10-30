DXTremeClient.DetailView = function (params) {
    var _oid;
    var model = {
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        handleBackClick: function (e) {
            DXTremeClient.app.navigate("_back");
        },
        canEdit: canEdit = function (e) {
            var test = DataManipulationRight("http://localhost:54002/CustomAuthenticationDataService.svc");
            return test.IsGranted("BusinessObjectsLibrary.Contact", "", "BusinessObjectsLibrary.Contact(" + params.oid + ")", "Write");
        },
        handleEditClick: function (e) {
            if (canEdit()) { //TODO Minakov
                var uri = DXTremeClient.app.router.format({
                    action: "ContactEditView",
                    oid: _oid,
                    index: _oid
                });
                DXTremeClient.app.navigate(uri);
            }
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