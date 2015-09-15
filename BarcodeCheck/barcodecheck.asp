<script language="JavaScript">
//Tested in IE8 IE11 Chrome 
//Mitchell Engelage 
//15-09-2015

var barcodeLength = 14;

function focusInput(focus)
{
	document.getElementById(focus).focus();
}

function checkBarcode1()
{
	//Wait for complete barcode to arrive
	setTimeout( function() {
		if (document.getElementById("barcode1").value.length == barcodeLength)
		{
			focusInput("barcode2");
		}
		else{
			document.getElementById("barcode1").value = "";}
	}, 500);
}

function checkBarcode2()
{
	//Wait for complete barcode to arrive
	setTimeout( function() {
		if(document.getElementById("barcode1").value.length < barcodeLength)
		{
			document.getElementById("barcode1").value = "";
			document.getElementById("barcode2").value = "";
			focusInput("barcode1");
		}
		if (document.getElementById("barcode2").value.length == barcodeLength)
		{
			focusInput("barcode1");
		}
		}, 500);
}


function checkValues()
{
	if(document.getElementById("barcode1").value == document.getElementById("barcode2").value)
	{
		//Reload page to reset timers
		location.reload();
	}
	else
	{
		//Set wrong number and picture
		document.getElementById("img1").src = "red.png";
		document.getElementById("waarde2").style.color = "red";
		document.getElementById("waarde1").innerHTML =  document.getElementById("barcode1").value;
		document.getElementById("waarde2").innerHTML =  document.getElementById("barcode2").value;
		document.getElementById("barcode2").value = "";
		focusInput("barcode2");
	}
}
</script>
<body onload="focusInput('barcode1')" align="center">
<table id="content" >
	<tr>
		<td >Nummer NIPED brief:</td>
		<td> <input type="text" name="barcode1" id="barcode1" onpropertychange="checkBarcode1()" oninput="checkBarcode1()" value=""></td>
		<td width="45%"><p id="waarde1"></p></td>
	</tr>
	<tr>
		<td >Nummer orderbrief:</td>
		<td><input type="text" name="barcode2" id="barcode2" onpropertychange="checkBarcode2()" oninput="checkBarcode2()" onblur="checkValues()"></td>
		<td width="45%"><p id="waarde2"></p></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3" ><img src="green.png" name="img1" id="img1" ></td>
	</tr>
</td>
</tr>
</table>
</body>

<style>
#content {
	width: 700px;
	height: 300px;
	position: absolute;
	margin-left: -350px;
	margin-top: -150px;
	top: 50%;
	left: 60%;
	font-family: verdana;
}
</style>