DXTremeClient.DetailView = function (params) {
    var model = {
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        CanEdit: CanEdit = ko.observable(false),
        ObjectType: ko.observable(),
        handleBackClick: function (e) {
            DXTremeClient.app.navigate("_back");
        },
        canEdit: function (callbackHandler) {
            DXTremeClient.DataManipulationRight.IsGranted(model.ObjectType(), "", params.oid, "Write", callbackHandler);
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
        viewShown: function () {
            DXTremeClient.db.Contact.load({
                filter: [DXTremeClient.db.Contact._key, new DevExpress.data.Guid(params.oid)]
            }).done(createDetailContent);
        }
    };
    var createDetailContent = function (list) {
        model.FirstName(list[0].FirstName);
        model.LastName(list[0].LastName);
        model.Email(list[0].Email);
        displayImage(list[0].Photo)
        model.ObjectType(list[0].__metadata.type);
        model.canEdit(CanEdit);
    };
    var displayImage = function (base64Data) {
        var imag = "<img "
                 + "src='" + "data:image/jpg;base64,"
                 + base64Data + "' style=\"width: 100%;\"/>";

        $("#divImageHolder").html(imag)
    };
    return model;
}