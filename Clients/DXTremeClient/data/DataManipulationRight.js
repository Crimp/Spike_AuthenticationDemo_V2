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
    "IsGrantedBatch": function (clientInfo, clientPermissionRequest) {
        $.ajax({
            type: "POST",
            url: this.serviceUrl,
            data: "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\">" +
                    "<s:Body>" +
                    "<IsGrantedBatch xmlns=\"http://tempuri.org/\">" +
                    clientInfo.data() +
                    clientPermissionRequest.data() +
                    "</IsGrantedBatch>" +
                    "</s:Body>" +
                "</s:Envelope>",
            timeout: 10000,
            contentType: "text/xml",
            dataType: "xml",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("SOAPAction", '"http://tempuri.org/IWcfSecuredDataServer/IsGrantedBatch"');
            },
            success: function (data) {
                $(data).find("IsGrantedBatchResponse").each(function () {
                    alert($(this).find("IsGrantedBatchResult").text());
                });
            },
            error: function (xhr, status, error) {
                alert(error);
            }
        });
    }
});
var ClientInfo = NewClass({
}, function (userName, password, clientId) {
    this.userName = userName;
    this.password = password;
    this.clientId = clientId;
    //TODO Minakov
    this.workSpaceId = "f9585f8e-2494-46aa-b01b-3b00f3f8346b";
}, {
    "data": function () {
        var result = "<clientInfo i:type=\"a:ClientInfo\" xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:a=\"http://schemas.datacontract.org/2004/07/DevExpress.ExpressApp.Security.ClientServer\">" +
            "<a:_x003C_ClientId_x003E_k__BackingField i:type=\"b:guid\" xmlns:b=\"http://schemas.microsoft.com/2003/10/Serialization/\">" +
            this.clientId +
            "</a:_x003C_ClientId_x003E_k__BackingField>" +
            "<a:_x003C_LogonParameters_x003E_k__BackingField i:type=\"b:AuthenticationStandardLogonParameters\" xmlns:b=\"http://schemas.datacontract.org/2004/07/DevExpress.ExpressApp.Security\">" +
            "<userName i:type=\"c:string\" xmlns=\"\" xmlns:c=\"http://www.w3.org/2001/XMLSchema\">" +
            this.userName +
            "</userName>" +
            "<password i:type=\"c:string\" xmlns=\"\" xmlns:c=\"http://www.w3.org/2001/XMLSchema\">" +
            this.password +
            "</password>" +
            "</a:_x003C_LogonParameters_x003E_k__BackingField>" +
            "<a:_x003C_WorkspaceId_x003E_k__BackingField i:type=\"b:guid\" xmlns:b=\"http://schemas.microsoft.com/2003/10/Serialization/\">" +
            this.workSpaceId +
            "</a:_x003C_WorkspaceId_x003E_k__BackingField></clientInfo>";
        return result;
    }
});
var ClientPermissionRequest = NewClass({
}, function (operation, objectType, targetObjectHandle) {
    this.operation = operation;
    this.objectType = objectType;
    this.targetObjectHandle = targetObjectHandle;
}, {
    "data": function () {
        var result = "<permissionRequest i:type=\"a:ClientPermissionRequest\" xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:x=\"http://www.w3.org/2001/XMLSchema\" xmlns:a=\"http://schemas.datacontract.org/2004/07/DevExpress.ExpressApp.Security\">" +
            "<Operation i:type=\"x:string\" xmlns=\"\">" +
            this.operation +
            "</Operation>" +
            "<MemberName i:nil=\"true\" xmlns=\"\"/>" +
            "<ObjectType i:type=\"x:string\" xmlns=\"\">" +
            this.objectType +
            "</ObjectType>" +
            "<TargetObjectHandle i:type=\"x:string\" xmlns=\"\">" +
            this.targetObjectHandle +
            "</TargetObjectHandle></permissionRequest>";
        return result;
    }
});