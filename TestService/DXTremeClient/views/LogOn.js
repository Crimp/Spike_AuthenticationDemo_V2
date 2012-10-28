DXTremeClient.LogOn = function (params) {
    var Type;
    var Url;
    var Data;
    var ContentType;
    var DataType;
    var ProcessData;
    //function to call WCF  Service       
    function CallService() {
        $.ajax({
            type: Type, //GET or POST or PUT or DELETE verb
            url: Url, // Location of the service
            data: Data, //Data sent to server
            contentType: ContentType, // content type sent to server
            dataType: DataType, //Expected data format from server
            processdata: ProcessData, //True or False
            success: function (msg) {//On Successfull service call
                //ServiceSucceeded(msg);
            },
            error: ServiceFailed// When Service call fails
        });
    };

    function ServiceFailed(result) {
        alert('Service call failed: ' + result.status + '' + result.statusText);
        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
    };
    var bhRequest = "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\">" +
            "<s:Body>" +
            "<GetData xmlns=\"http://tempuri.org/\">" +
            "<value>10</value>" +
            "</GetData>" +
            "</s:Body>" +
        "</s:Envelope>";
    var viewModel = {
        Password: ko.observable(""),
        UserName: ko.observable(""),
        handleLogOnClick: function (e) {
            //var userid = 1;
            //Type = "POST";
            //Url = "http://localhost:61340/Service1.svc/GetData";
            //Data = '{"value": "' + userid + '"}';
            //ContentType = "text/xml; charset=utf-8";
            //DataType = "xml";
            //varProcessData = true;
            //CallService();
            $.ajax({
                type: "POST",
                url: "http://crimp/test/Service1.svc/GetData",
                data: bhRequest,
                timeout: 10000,
                contentType: "text/xml",
                dataType: "xml",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("SOAPAction", "http://tempuri.org/IService/GetData");
                },
                success: function (data) {
                    $(data).find("GetDataResponse").each(function () {
                        alert($(this).find("GetDataResult").text());
                    });
                },
                error: function (xhr, status, error) {
                    alert(error);

                }
            });
        }
    };
    return viewModel;
    //http://localhost:61340/Service1.svc
};