DXTremeClient.index = function (params) {
    var contacts = ko.observableArray();
    var handleContactListItemClick = function (e) {
        var uri = DXTremeClient.app.router.format({
            action: "DetailView",
            oid: e.itemData.oid
        });
        DXTremeClient.app.navigate(uri);
    };
    var handleLogOffClick = function (e) {
        DXTremeClient.currentUser.UserName("");
        DXTremeClient.currentUser.Password("");
        DXTremeClient.app.navigate("LogOn/null");
    };
    var getImageUrl = function (base64Data) {
        if (!base64Data) {
            return "images/NoImage.jpg";
        }
        return "data:image/jpg;base64," + base64Data;
    };
    DXTremeClient.db.Contact.load({
        sort: [{ field: "FirstName", desc: false }],
        //select: ["oid", "FirstName", "LastName", "Photo"]
    }).done(function (response) {
        contacts($.map(response, function (contact, index) {
                return {
                    oid: contact.oid,
                    FirstName: contact.FirstName,
                    LastName: contact.LastName,
                    Photo: getImageUrl(contact.Photo)
                }          
        }));
    });
    return {
        contacts: contacts,
        handleContactListItemClick: handleContactListItemClick,
        handleLogOffClick: handleLogOffClick
    };
};