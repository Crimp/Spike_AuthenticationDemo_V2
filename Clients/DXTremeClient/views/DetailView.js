DXTremeClient.DetailView = function (params) {
    var model = {
        //CanReadMembers
        FirstName: ko.observable(),
        LastName: ko.observable(),
        Email: ko.observable(),
        Photo: ko.observable("noimage"),
        CanEdit: CanEdit = ko.observable(false),
        ObjectType: ko.observable(),
        UILevelSecurity: UILevelSecurity = ko.observable(true),
        handleBackClick: function (e) {
            DXTremeClient.app.navigate("_back");
        },
        canEdit: function (callbackHandler) {
            var dataManipulationRight = DataManipulationRight(DXTremeClient.serviceUrl);
            dataManipulationRight.IsGranted(model.ObjectType(), "", params.oid, "Write", callbackHandler);
        },
        handleEditClick: function (e) {
            var uri = DXTremeClient.app.router.format({
                action: "ContactEditView",
                oid: params.oid,
                index: params.oid
            });
            DXTremeClient.app.navigate(uri);
        },
        viewShown: function () {
            DXTremeClient.db.Contact.load({
                filter: [DXTremeClient.db.Contact._key, new DevExpress.data.Guid(params.oid)]
            }).done(createDetailContent);
        }
    };
    var createDetailContent = function (list) {
        model.ObjectType(list[0].__metadata.type);

        var mambers = new Array("LastName", "Email");
        var oids = new Array(params.oid);
        var dataManipulationRight = DataManipulationRight(DXTremeClient.serviceUrl);
        dataManipulationRight.CanReadMembers(model.ObjectType(), mambers, oids, loadData);

        model.FirstName(list[0].FirstName);
        model.LastName(list[0].LastName);
        model.Email(list[0].Email);
        model.Photo(DXTremeClient.getImageUrl(list[0].Photo));
        model.canEdit(CanEdit);
    };
    var loadData = function(data){

    }
    return model;
}