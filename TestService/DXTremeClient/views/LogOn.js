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
                alert(msg.GetDataResult);
                //ServiceSucceeded(msg);
            },
            error: ServiceFailed// When Service call fails
        });
    };

    function ServiceFailed(result) {
        alert('Service call failed: ' + result.status + '' + result.statusText);
        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
    };
    //<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body><GetData xmlns="http://tempuri.org/"><value>10</value></GetData></s:Body></s:Envelope>
    //var bhRequest = "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\">" +
    //        "<s:Body>" +
    //        "<GetData xmlns=\"http://tempuri.org/\">" +
    //        "<value>145455430</value>" +
    //        "</GetData>" +
    //        "</s:Body>" +
    //    "</s:Envelope>";
    var viewModel = {
        Password: ko.observable(""),
        UserName: ko.observable(""),
        handleLogOnClick: function (e) {
            var userid = viewModel.UserName();
            Type = "POST";
            Url = "http://localhost:49327/Service1.svc/GetData";
            Data = '{"value": "' + userid + '"}';
            ContentType = "application/json; charset=utf-8";
            DataType = "json";
            varProcessData = true;
            CallService();
            var test = DataManipulationRight();
            //test.test(viewModel.UserName());
        }
    };
    return viewModel;
    //http://localhost:61340/Service1.svc
};