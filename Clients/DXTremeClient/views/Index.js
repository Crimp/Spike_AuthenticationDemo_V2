DXTremeClient.index = function (params) {
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
    var displayImage = function (base64Data) {
        var imag = "<img "
                 + "src='" + "data:image/jpg;base64,"
                 + base64Data + "' width=\"60\" height=\"60\"/>";

        $("#divImageHolder").html(imag)
    };
    return {
        todoLists: {
            store: DXTremeClient.db.Contact
        },
        handleContactListItemClick: handleContactListItemClick,
        handleLogOffClick: handleLogOffClick,
        displayImage: displayImage,
    };
};