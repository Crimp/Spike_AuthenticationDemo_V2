DXTremeClient.DetailView = function (params) {
    var model = {
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        CanEdit: CanEdit = ko.observable(false),
        handleBackClick: function (e) {
            DXTremeClient.app.navigate("_back");
        },
        canEdit: canEdit = function (callbackHandler) {
            DXTremeClient.DataManipulationRight.IsGranted(DXTremeClient.entities.Contact.className, "", params.oid, "Write", callbackHandler);
        },
        handleEditClick: function (e) {
            if (CanEdit()) {
                var uri = DXTremeClient.app.router.format({
                    action: "ContactEditView",
                    oid: params.oid,
                    index: params.oid
                });
                DXTremeClient.app.navigate(uri);
            }
        },
        viewShowing: function () {
            canEdit(CanEdit);
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
    };
    return model;
}