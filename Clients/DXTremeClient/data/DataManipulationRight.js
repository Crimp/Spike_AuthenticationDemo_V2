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
var canReadMembersCallBack = function (data) { }
var mycallback = function (data) { }
var DataManipulationRight = NewClass({
}, function (serviceUrl) {
    this.serviceUrl = serviceUrl;
}, {
    "IsGranted": function (objectType, memberName, oid, operation, callbackHandler) {
        var objectHandle = objectType + "(" + oid + ")";
        var _data = "objectType='" + objectType + "'&memberName='" + memberName + "'&objectHandle='" + objectHandle + "'&operation='" + operation + "'";
        this.ajaxRequest(_data, "IsGranted", callbackHandler, "mycallback");
    },
    "IsUserAllowed": function (callbackHandler) {
        this.ajaxRequest(null, "IsUserAllowed", callbackHandler, "mycallback");
    },
    "CanReadMembers": function (objectType, membersName, oids, callbackHandler) { //membersName and oids is string[]
        for (var key in oids) {
            oids[key] = objectType + "(" + oids[key] + ")";
        }
        var _data = "objectType='" + objectType + "'&membersName='" + membersName.join(";") + "'&targetObjectsHandle='" + oids.join(";") + "'";
        this.ajaxRequest(_data, "CanReadMembers", callbackHandler, "canReadMembersCallBack");
    },
    "ajaxRequest": function (_data, serviceOperationName, callbackHandler, callbackMethodName) {
        var userCredentials = "&UserName=" + DXTremeClient.currentUser.UserName() + "&Password=" + DXTremeClient.currentUser.Password() + "";
        var _url = this.serviceUrl + "/" + serviceOperationName + "?$format=json&$callback=" + callbackMethodName + userCredentials;
        $.ajax({
            type: "GET",
            url: _url,
            data: _data,
            async: true,
            timeout: 10000,
            contentType: "application/json; charset=utf-8",
            jsonpCallback: callbackMethodName,
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
    }
});