var MakeClass = function () {
    return function (args) {
        if (this instanceof arguments.callee) {
            if (typeof this.__construct == "function") this.__construct.apply(this, args);
        } else return new arguments.callee(arguments);
    };
}
var NewClass = function (variables, constructor, functions) {
    var retn = MakeClass();
    for (var key in variables) {
        retn.prototype[key] = variables[key];
    }
    for (var key in functions) {
        retn.prototype[key] = functions[key];
    }
    retn.prototype.__construct = constructor;
    return retn;
}

var DataManipulationRight = NewClass({
}, function (serviceUrl) {
    this.serviceUrl = serviceUrl;
}, {
    "IsGranted": function (objectType, memberName, objectHandle, operation, callbackHandler) {
        var _data = "objectType='" + objectType + "'&memberName='" + memberName + "'&objectHandle='" + objectHandle + "'&operation='" + operation + "'";
        $.ajax({
            type: "GET",
            url: this.serviceUrl + "/IsGranted",
            data: _data,
            async: true,
            timeout: 10000,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function (sender) {
                sender.setRequestHeader("UserName", DXTremeClient.currentUser.UserName());
                sender.setRequestHeader("Password", DXTremeClient.currentUser.Password());
            },
            success: function (data) {
                if (callbackHandler) {
                    callbackHandler(data.d.IsGranted);
                }
            },
            error: function (xhr, status, error) {
                alert(error);
                if (callbackHandler) {
                    callbackHandler(false);
                }
            }
        });
    }
});