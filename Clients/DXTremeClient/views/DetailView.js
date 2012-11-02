DXTremeClient.DetailView = function (params) {
    var model = {
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        Photo: ko.observable("noimage"),
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
        model.Photo(getImageUrl(list[0].Photo));
        model.ObjectType(list[0].__metadata.type);
        model.canEdit(CanEdit);
    };
    var getImageUrl = function (base64Data) {
        return "data:image/jpg;base64," + base64Data;
    };
    return model;
}