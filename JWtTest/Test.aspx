<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="JWtTest.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script src="https://songbirdstag.cardinalcommerce.com/cardinalcruise/v1/songbird.js"></script>
  
     <!--JQuery-->
        <script  type="text/javascript" src="js/jquery.min.js"></script>
        <script  type="text/javascript" src="js/jquery-ui.min.js"></script>       
        <link rel="stylesheet" type="text/css" href="js/jquery-ui.min.css"/>
       
        <!-- Bootstrap-->
        <script type="text/javascript" src="https://tcmagnum.blob.core.windows.net/cdn/bootstrap.min.js" integrity="sha384-QAIs1woD/aMG57FSRKNkwfFJJxc0nRFEcQD55sY30YuGIvb6TPf3v4DCa4ZJKMH7" crossorigin="anonymous"></script>
        <script  type="text/javascript" src="js/bootbox.min.js"></script>
          <script type="text/javascript" src="js/wysihtml5-0.3.0_rc2.js"></script>
          <script type="text/javascript" src="js/bootstrap-wysihtml5-0.0.2.js"></script>
          <link type="text/css" rel="stylesheet" href="js/bootstrap-wysihtml5-0.0.2.css"/>

    <script >

        Cardinal.configure({
            logging: {
                level: "on"
            }
        });


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="JWTContainer" value="[Insert your JWT here]" runat="server"/>
    <div>
      <div id="ccPanel" name = "ccPanel" runat="server">
			                    <div>
			                        <asp:Label id="CardNumberLabel" for="cardNumber" cssclass="label" runat="server" translate="true">Card Number</asp:Label>
			                        <span class="form-inline">
			                            <asp:TextBox runat="server" data-cardinal-field="AccountNumber" id="cardNumber" autocomplete="off" cssclass="form-control" required="required">4709500741200609</asp:TextBox>
			                        </span>
			                    </div>
			                    <div>
			                        <asp:Label id="ExpirationDateLabel" for="expirationDate" cssclass="label" runat="server" translate="true" >Expiration Date</asp:Label>
			                        <span class="form-inline">
			                            <asp:dropdownlist id="expirationDateMonth" groupname="expirationDate" runat="server" width="65px" cssclass="form-control">
								            <asp:listitem value="01">01</asp:listitem>
								            <asp:listitem value="02">02</asp:listitem>
								            <asp:listitem value="03" Selected>03</asp:listitem>
								            <asp:listitem value="04">04</asp:listitem>
								            <asp:listitem value="05">05</asp:listitem>
								            <asp:listitem value="06">06</asp:listitem>
								            <asp:listitem value="07">07</asp:listitem>
								            <asp:listitem value="08">08</asp:listitem>
								            <asp:listitem value="09">09</asp:listitem>
								            <asp:listitem value="10">10</asp:listitem>
								            <asp:listitem value="11">11</asp:listitem>
								            <asp:listitem value="12">12</asp:listitem>
							            </asp:dropdownlist> / <asp:dropdownlist id="expirationDateYear" groupname="expirationDate" runat="server" width="80" cssclass="form-control">								            
								            <asp:listitem value="2018">2018</asp:listitem>
                                            <asp:listitem value="2019">2019</asp:listitem>
								            <asp:listitem value="2020">2020</asp:listitem>
                                            <asp:listitem value="2021">2021</asp:listitem>
                                            <asp:listitem value="2022">2022</asp:listitem>
                                            <asp:listitem value="2023">2023</asp:listitem>
                                            <asp:listitem value="2024">2024</asp:listitem>
                                            <asp:listitem value="2025">2025</asp:listitem>
                                            <asp:listitem value="2026">2026</asp:listitem>
								            <asp:listitem value="2027">2027</asp:listitem>
                                            <asp:listitem value="2028">2028</asp:listitem>
								            <asp:listitem value="2029">2029</asp:listitem>
                                            <asp:listitem value="2030" Selected>2030</asp:listitem>
                                            <asp:listitem value="2031">2031</asp:listitem>
                                            <asp:listitem value="2032">2032</asp:listitem>
                                            <asp:listitem value="2033">2033</asp:listitem>
                                            <asp:listitem value="2034">2034</asp:listitem>
                                            <asp:listitem value="2035">2035</asp:listitem>
							            </asp:dropdownlist>
			                        </span>
			                    </div>
			                    <div>
			                        <asp:Label id="cvv2Label" for="cvv2" cssclass="label" runat="server" translate="true">Card Verification Value (CVV2)</asp:Label>
			                        <span class="form-inline">
			                            <asp:textbox id="cvv2" runat="server" Width="60px" autocomplete="off" cssclass="form-control" required="required">123</asp:textbox>
			                        </span>
			                    </div>
                            </div>

         <div class="button_container text-right">  
             <input type="submit" id="purchase" name="purchase" disable="true"   onclick="doPurchase();" />                 
             <%-- <asp:button id="Buy" runat="server" text="Continue" onclientclick="doPurchase();" onclick="Buy_Click" translate="true"  class="active button btn btn-default captcha"></asp:button>--%>
          </div>
    </div>
    </form>
</body>

    <script>


        var requestValidateToken = function (token) {
         
            console.log('---------------------requestValidateToken start');
            var requestValidateTokenXhr = $.ajax({
                url: baseurl + '/TokenHandler.ashx',
                dataType: "json",
                async: true,
                data: { op: 'validate', token: token},
                error: function (jqxhr) { alert(jqxhr.responseText); },
            }).done(function (data) {
                if (data.result == 'valid') {
                    alert("validated, what next");//next I guess...validate other fields required(metadata)or those should be validated before

                    //show the please wait as in LMS
                    //if (valid === 0) {
                    //    bootbox.dialog(
                    //        { message: '<span><img src="' + baseUrl + '/images/ajax-loader.gif" role="presentation" aria-hidden="true" /></span><span>Processing your purchase, please wait...<br/>Please do not use the browser Back button !</span>', onEscape: false, closeButton: false }
                    //    );
                    //}

                    //do here the actual purchase as before
                   // __doPostBack('Buy', '');
                }
                else {
                    alert("NOT validated," + data.result);
                }
            });
        }

    </script>

    <script >

        //initialize cardinal, pass the jwtoken created server side that contains the credentials
        //I call this on page load, not post back, documentation states should be only called once per page
        //Cardinal.setup("init", {
        //    jwt: document.getElementById("JWTContainer").value
        //});


        //This event will not trigger if an error occurred during Cardinal.setup() call (failed jwt authentication)
        //If it gets executed, Songbird is available to run transactions. This function will receive 2 arguments that describe the loaded state of Songbird and the current session identifier.
        //do not enable purchase button maybe if we cannot communicate with Cardinal ?
        Cardinal.on('payments.setupComplete', function (setupCompleteData) {
            console.log('------------------payments.setupComplete start, enabling Buy button');
            // For example, you may have your Submit button disabled on page load. Once you are setup 
            // for CCA, you may then enable it. This will prevent users from submitting their order 
            // before CCA is ready.
            document.getElementById('purchase').disabled = false;
        });


        //this happens on  'Submit Order' button
        var doPurchase = function () {
            console.log('-----------------doPurchase start,starting cardinal');
            //CCA is initiated by the merchant, typically when the customer clicks 'Place Order" or 'Submit Order' button. 
            //Instead of getting a card authorization, you need to initiate the Cardinal.start() before authorization.
            
            var orderObject = {
                "Authorization": {
                    "AuthorizeAccount": true
                },
                "Cart": [
                  {
                      "Name": "test course",
                      "SKU": "111111",
                      "Quantity": "1",
                      "Description": "a course"
                  }
                ],
                "Consumer": {
                    "Email1": "test@mail.com",
                    "Email2": "test1@mail.com",
                    "ShippingAddress": {
                        "FullName": "John Smith",
                        "FirstName": "John",
                        "MiddleName": "",
                        "LastName": "Smith",
                        "Address1": "250 the esplanade..",
                        "Address2": "",
                        "Address3": "",
                        "City": "Mentor",
                        "State": "Ohio",
                        "PostalCode": "44060",
                        "CountryCode": "US",
                        "Phone1": "",
                        "Phone2": ""
                    },
                    "BillingAddress": {
                        "FullName": "John Smith",
                        "FirstName": "John",
                        "MiddleName": "",
                        "LastName": "Smith",
                        "Address1": "250 the esplanade.",
                        "Address2": "",
                        "Address3": "",
                        "City": "Mentor",
                        "State": "Ohio",
                        "PostalCode": "44060",
                        "CountryCode": "US",
                        "Phone1": "",
                        "Phone2": ""
                    },
                    "Account": {
                        "AccountNumber": 340000000003961,
                        "ExpirationMonth": 01,
                        "ExpirationYear": 2022,
                        "CardCode": 0775,
                        "NameOnAccount": "John Smith"
                    }
                },
                "Options": {
                    "EnableCCA": true
                },
                "OrderDetails": {
                    "OrderNumber": Math.random(0, 1000000) + "-shzs",
                    "Amount": 25.00,
                    "CurrencyCode": "840",
                    "OrderDescription": "nothg",
                    "OrderChannel": "S",
                    "TransactionId": "2fDSaySnCmDGCjPglzqX"
                },
                "Token": {
                    "Token": "",
                    "CardCode": 0775,
                    "ExpirationMonth": 01,
                    "ExpirationYear": 2022
                }
            };


           
            Cardinal.start("cca", orderObject);
            //The next step in the integration is to add logic to payements.validated event to handle specific return values for CCA
        }

        //This event is triggered when the transaction from  Cardinal.start() has been finished, we need to handle it's response
        //Here Songbird hands back control to the merchant's webpage. This event will include data on how the transaction attempt ended and should be where you place logic for reviewing the results of the transaction and making decisions regarding next steps. 
        //The ActionCode field gets the overall state of the transaction. Additional information can be found in the fields ErrorNumber and ErrorDescription if the ActionCode indicates an issue was encountered.
        //On first pass, we recommend that on an ActionCode of 'SUCCESS' you send the response JWT to your backend to be verified. 
        //When you add CCA or an Alternative Payment brand, additional details will be provided on how to handle the specific response values for each.
        //Each additional payment brand you add may return some values that are specific to that payment brand, and may require special handling logic.
        Cardinal.on("payments.validated", function (data, jwt) {
            console.log('------------------payments.validated,starting '+data.ActionCode);
            switch (data.ActionCode) {
                case "SUCCESS":
                    // Handle successful transaction, send JWT to backend to verify
                    //validate data that comes from cardinal, after the order was sent to them
                    //data parsed serverside, and validated. If all fine, do the purchase
                    requestValidateToken(jwt);
                    break;
                case "NOACTION":
                    // Handle no actionable outcome
                    alert("payments.validated - NOACTION");
                    break;
                case "FAILURE":
                    // Handle failed transaction attempt
                    alert("payments.validated - FAILURE");
                    break;
                case "ERROR":
                    // Handle service level error
                    alert("payments.validated - ERROR");
                    break;
            }
        });

       

        
       


    </script>
</html>
