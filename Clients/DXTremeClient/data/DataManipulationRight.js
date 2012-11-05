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
var mycallback = function (data) { }
var DataManipulationRight = NewClass({
}, function (serviceUrl) {
    this.serviceUrl = serviceUrl;
}, {
    "IsGranted": function (objectType, memberName, oid, operation, callbackHandler) {
        var objectHandle = objectType + "(" + oid + ")";
        var _data = "objectType='" + objectType + "'&memberName='" + memberName + "'&objectHandle='" + objectHandle + "'&operation='" + operation + "'";
        this.ajaxRequest(_data, "IsGranted", callbackHandler);
    },
    "IsUserAllowed": function (callbackHandler) {
        this.ajaxRequest(null, "IsUserAllowed", callbackHandler);
    },
    "ajaxRequest": function (_data, serviceOperationName, callbackHandler) {
        var userCredentials = "&UserName=" + DXTremeClient.currentUser.UserName() + "&Password=" + DXTremeClient.currentUser.Password() + "";
        var _url = this.serviceUrl + "/" + serviceOperationName + "?$format=json&$callback=mycallback" + userCredentials;
        $.ajax({
            type: "GET",
            url: _url,
            data: _data,
            async: true,
            timeout: 10000,
            contentType: "application/json; charset=utf-8",
            jsonpCallback: "mycallback",
            dataType: "jsonp",
            success: function (data) {
                if (callbackHandler) {
                    callbackHandler(data.d[serviceOperationName]);
                }
            },
            error: function (xhr, status, error) {
                if (callbackHandler) {
                    callbackHandler(false);
                }
            }
        });
    },
    mycallback: function (data) {

    }
});