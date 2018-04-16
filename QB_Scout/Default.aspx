<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QB_Scout.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Index</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; user-scalable=no" />

    <link href="css/bootoast.min.css" rel="stylesheet" />
    <%--<link rel="stylesheet" type="text/css" href="css/themes.css" />--%>
    <link href="Barcode_Scanner/base_folder/css/themes.css" rel="stylesheet" />

    <link href="Barcode_Scanner/base_folder/css/styles.css" rel="stylesheet" />

    <%--<link rel="stylesheet" type="text/css" href="css/styles.css" />--%>

     <% if (dictionary.ContainsKey("accessToken") && dictionary["callMadeBy"]!="OpenId")
         {
             Response.Write("<script> window.opener.location.reload();window.close(); </script>");
           
         }

    %> 

</head>



<body>
    <form id="form1" runat="server">
    <div>
       <%-- <h3>QB Scout</h3>--%>
   <%--      
  Before using this app, please make sure you do the following:
  <ul>
      <li>Note:This sample app is just for reference and works great for Chrome and Firefox. IE throws up some javascript errors so it is advisable to test for the specific browser you are working with and make desired changes.</li>
    <li>
      Update your Client ID, Client Secret, Redirect Url (found on <a href="https://developer.intuit.com">developer.intuit.com</a>)
        in web.config</li>
      <li>
          Update your Log file Path in web.config</li>
      <li>
          Each button click flow should be tested by stopping the application and running it again.
           </li>
      <li>
          QBO API call can be made for only for C2QB or OpenId(Get App Now) flows. You will not see any output for QBO call on the screen.You need to debug the call. 
      </li>
      <li>
          In actual app you will have only one of these button click implementations. Testing them all at once will result in exceptions.</li>
  </ul>--%>

  

 
    
         

  </div>


 <div id="connect" runat="server" visible ="false">
    
  <!-- Sign In With Intuit Button -->
<%--  <b>Sign In With Intuit</b><br />
   <asp:ImageButton id="btnSIWI" runat="server" AlternateText="Sign In With Intuit"
           ImageAlign="left"
           ImageUrl="Images/IntuitSignIn-lg-white@2x.jpg"
           OnClick="ImgSIWI_Click" Height="40px" Width="200px"/>

    

     <br /><br />--%>

    <!-- Connect To QuickBooks Button -->
 <br />
    <asp:ImageButton id="btnC2QB" runat="server" AlternateText="Connect to Quickbooks"
           ImageAlign="left"
           ImageUrl="Images/C2QB_white_btn_lg_default.png"
           OnClick="ImgC2QB_Click" Height="40px" Width="200px" />
     <br /><br /><br />

   <!-- Get App Now -->
   <%--<b>Get App Now</b><br />
   <asp:ImageButton id="btnOpenId" runat="server" AlternateText="Get App Now"
           ImageAlign="left"
           ImageUrl="Images/Get_App.png"
           OnClick="ImgOpenId_Click" CssClass="font-size:14px; border: 1px solid grey; padding: 10px; color: red" Height="40px" Width="200px"/>
     <br /><br /><br />--%>
 
    
    </div>

 <div id="revoke" runat="server" visible ="false">
    <p>
    <asp:label runat="server" id="lblConnected" visible="false">"Your application is connected!"</asp:label>
    </p>  
 <%--    <asp:ImageButton id="btnQBOAPICall" runat="server" AlternateText="Call QBO API"
           ImageAlign="left"
       
           OnClick="ImgQBOAPICall_Click" CssClass="font-size:14px; border: 1px solid grey; padding: 10px; color: red" Height="40px" Width="200px"/>
     <br /><br />
     <p>--%>
    <asp:label runat="server" id="lblQBOCall" visible="false"></asp:label>
     <%--
    </p>
     <br />

       <br /><br /><br />
     <asp:ImageButton id="btnRevoke" runat="server" AlternateText="Revoke Tokens"
           ImageAlign="left"
           
           OnClick="ImgRevoke_Click" CssClass="font-size:14px; border: 1px solid grey; padding: 10px; color: red" Height="40px" Width="200px"/>
       <br /><br /><br />--%>
   
</div>





    





    <%--///////////////// BARCODE SCANNER //////////////////////////////////////////////--%>




    <style>


    h4 {
        color: white;
        font-size: 40px;
    }
    </style>



    <header style="background-color: #108c5e;">
        <hr/>
        <div class="headline">
            <center>
                <img src="Barcode_Scanner/base_folder/qb_scout_banner.png" style="width:60%" alt="JB's Furniture"><img  />
            </center>
        </div>
        <hr/>
    </header>

    <section id="container" class="container">
        <div id="interactive" class="viewport"></div>
    </section>
  <!--   <br>
    <br> -->
    <center>


        <div class="entry_box" action="">
            <input runat="server" class="entry_text" id="location_text" type="text" placeholder=""/>
            <input class="entry_button" id="location_button" type="button" value="Location" onclick="highlight_location()"/>
        </div>

        <div class="entry_box" action="">
            <input runat="server" class="entry_text" id="item_text" type="text" placeholder=""/>
            <input class="entry_button" id="item_button" type="button" value="Item SKU" onclick="highlight_item()"/>
        </div>

        <div class="update_box" action="">
            <asp:Button runat="server" CssClass="update_button" ID="btnUpdateItem" Text="Update" OnClick="btnUpdateItem_Click" />
            <%--<input runat="server" class="update_button" id="item_button" type="button" value="Update" onclick="datasubmit()" />--%>
        </div>
        <%--<script src="jquery-3.1.1.min.js"></script>--%>

<%--
    $("#btnUpdateItem").click(function() {
        bootoast.toast({
            message: 'Successfully updated item!',
            type: 'info',
            position: 'bottom-center',
            icon: null,
            timeout: null,
            animationDuration: 300,
            dismissible: true
        });
    });
--%>


    </center>
    
    <!--     <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-2" style="padding-right:0px;">
                <button style="padding-right: 10px; text-align: left; font-size: 20px">Location: </button>
            </div>
            <div class="col-md-2" style="background-color: white;">
                <h5 style="text-align: left; background-color: white; " id="location ">Scan for Location</h5>
            </div>
            <div class="col-md-1 " style="padding-right:0px; ">
                <h5 style="text-align: right; padding-right:0px; margin-right: 0px; ">SKU:</h5>
            </div>
            <div class="col-md-2 ">
                <h5 style="text-align: left; background-color: white;" id="sku">Scan for SKU</h5>
            </div>
            <div class="col-md-2 "></div>
        </div>
    </div> -->
    <section id="container " class="container ">
        <div id="result_strip ">
            <ul class="thumbnails "></ul>
            <ul class="collector "></ul>
        </div>
        <center>
            <div class="controls container" >
                <div class="row">
                     <fieldset class="input-group " style="display: none " >
                    <button class="stop ">Stop</button>
                    </fieldset>
                    <center>
                        <fieldset class="reader-config-group ">
                            <label>
                                <span>Barcode-Type</span>
                                <select name="decoder_readers ">
                                    <option value="code_128 " selected="selected ">Code 128</option>
                                    <option value="code_39 ">Code 39</option>
                                    <option value="code_39_vin ">Code 39 VIN</option>
                                    <option value="ean ">EAN</option>
                                    <option value="ean_extended ">EAN-extended</option>
                                    <option value="ean_8 ">EAN-8</option>
                                    <option value="upc ">UPC</option>
                                    <option value="upc_e ">UPC-E</option>
                                    <option value="codabar ">Codabar</option>
                                    <option value="i2of5 ">Interleaved 2 of 5</option>
                                    <option value="2of5 ">Standard 2 of 5</option>
                                    <option value="code_93 ">Code 93</option>
                                </select>
                            </label>
                            <label style="display: none ">
                                <span>Resolution (width) </span>
                                <select name="input-stream_constraints ">
                                    <option value="320x240 ">320px</option>
                                    <option value="640x480 ">640px</option>
                                    <option value="800x600 ">800px</option>
                                    <option value="1280x720 ">1280px</option>
                                    <option value="1600x960 ">1600px</option>
                                    <option selected="selected " value="1920x1080 ">1920px</option>
                                </select>
                            </label>
                            <label style="display: none ">
                                <span>Patch-Size</span>
                                <select name="locator_patch-size ">
                                    <option value="x-small ">x-small</option>
                                    <option value="small ">small</option>
                                    <option selected="selected " value="medium ">medium</option>
                                    <option value="large ">large</option>
                                    <option value="x-large ">x-large</option>
                                </select>
                            </label>
                            <label style="display: none ">
                                <span>Half-Sample</span>
                                <input type="checkbox " checked="checked " name="locator_half-sample " />
                            </label>
                            <label style="display: none ">
                                <span>Workers</span>
                                <select name="numOfWorkers ">
                                    <option value="0 ">0</option>
                                    <option value="1 ">1</option>
                                    <option value="2 ">2</option>
                                    <option selected="selected " value="4 ">4</option>
                                    <option value="8 ">8</option>
                                </select>
                            </label>
                            <label style="display: none ">
                                <span>Camera</span>
                                <select name="input-stream_constraints " id="deviceSelection ">
                                </select>
                            </label>
                            <label style="display: none ">
                                <span>Zoom</span>
                                <select name="settings_zoom "></select>
                            </label>
                            <!--  style="display: none " -->
                            <label>
                                <span style="display: none ">Flashlight</span>
                                <input type="checkbox " name="settings_torch " />
                            </label>
                        </fieldset>
                    </center>
                </div>
                </div>
        </center>
    </section>
  <br/>
    <!-- <button onclick="refresh()">Refesh</button> -->
    <footer>
    </footer>

    <%--<script src="jquery-3.1.1.min.js"></script>--%>

    <%--<script src="vendor/jquery-1.9.0.min.js " type="text/javascript "></script>--%>
    <script src="Barcode_Scanner/base_folder/vendor/jquery-1.9.0.min.js"></script>
    <script src="js/bootoast.min.js"></script>

    <script src="//webrtc.github.io/adapter/adapter-latest.js " type="text/javascript "></script>

    <%--<script src="../dist/quagga.js " type="text/javascript "></script>--%>
    <script src="Barcode_Scanner/dist/quagga.js"></script>

    <%--<script src="live_w_locator.js " type="text/javascript "></script>--%>
    <script src="Barcode_Scanner/base_folder/live_w_locator.js"></script>

    <script type="text/javascript " src="https://cdn.emailjs.com/dist/email.min.js "></script>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>

    <%--<script src="js/bootstrap.min.js"></script>--%>
    <script src="Barcode_Scanner/base_folder/js/bootstrap.min.js"></script>

    <script type="text/javascript ">

    (function() {
        emailjs.init("user_oy3aSgyssQVURnWQA0Jl8");
    })();



    function datasubmit() {


        var send_location = document.getElementById("location_text").value;
        var send_sku = document.getElementById("item_text").value;

        alert("SUCCESS: " + send_sku + ", " + send_location);

        emailjs.send("XMAIL", "qb_scout_update", { message_html: "SKU: " + send_sku + "<br><br><br>Location: " + send_location + "<br><br>" }).then(function(response) {
            console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
        }, function(err) {
            console.log("FAILED. error=", err);
        });
    }
    </script>






    <script type="text/javascript">


    highlight_location();



    function highlight_location() {

        try {
            $("#item_text").removeClass("highlight");
        } 
        catch(e){
        }

        $("#location_text").addClass("highlight");

        target_input(document.getElementById("location_text"));

    }

    function highlight_item() {

        try {
            $("#location_text").removeClass("highlight");
        }
        catch(e){

        }
        $("#item_text").addClass("highlight");

        target_input(document.getElementById("item_text"));

    }
    </script>



















<!-- 

<form onsubmit="return false;">
                    <label for="locinput" style="margin-top: 20px;"">Location</label>
                    <input type="text" id="locinput" name="locinput" placeholder="Tap to scan for location." onfocus="highlight_input(this)">
                    <br>
                    <br>
                    <label for="skuinput" style="margin-top: 45px;">SKU</label>
                    <input type="text" id="skuinput" name="skuinput" placeholder="Tap to scan for SKU." style="margin-bottom: 30px;" onfocus="highlight_input(this)"> -->
<!-- <label for="country">Country</label>
            <select id="country" name="country">
                <option value="australia">Australia</option>
                <option value="canada">Canada</option>
                <option value="usa">USA</option> -->
<!--  </select>
                    <button class="sub" onclick="datasubmit()">Submit</button>
                </form> -->
<!-- 

                 input[type=text],
        select {
            width: 90%;
            height: 70px;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 90%;
            background-color: #24745B;
            color: white;
            padding: 14px 20px;
            border-width: 7px;
            border-color: #c5cfe2;
            border-style: solid;
            border-radius: 7px;
            cursor: pointer;
            font-size: 30px;
            margin-top: 40px;
            margin-bottom: 30px;
            box-shadow: 0px 0px 35px #565656;
            font-weight: bold;

            /*#24745B*/
        }
 -->
<!-- 



        input[type=submit]:hover {
            background-color: #45a049;
        }

        label {
            font-size: 36px;
            color: white;
        } -->







    
    </form>

</body>
</html>