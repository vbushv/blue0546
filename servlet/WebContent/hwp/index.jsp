<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script language="JavaScript" type="text/JavaScript">
var MinVersion = 0x0505010C;
var data;
var pHwpCtrl;
function OnStart()
{
    pHwpCtrl = document.HwpCtrl;
    document.HwpCtrl.SetClientName("DEBUG");
    URLOpen();
}
function URLOpen()
{
    var bRes = document.HwpCtrl.RegisterModule("FilePathCheckDLL", "FilePathChecker");
    document.HwpCtrl.Clear(1);
    document.HwpCtrl.Open("http://bush0630.cafe24.com/hwp/sample2.hwp", "", "code:acp;url:true")
    document.HwpCtrl.EditMode=1;
    document.HwpCtrl.MovePos(2);
}
function WriteEmbedHanPop(){
    document.write("<OBJECT id='HwpCtrl' style='LEFT: 0px; TOP: 0px;' height='600' width='1024' align='center' classid='CLSID:BD9C32DE-3155-4691-8972-097D53B10052'>");
    document.write("<PARAM NAME='TOOLBAR_MENU' VALUE='true'>");
    document.write("<PARAM NAME='TOOLBAR_STANDARD' VALUE='true'>");
    document.write("<PARAM NAME='TOOLBAR_FORMAT'   VALUE='true'>");
    document.write("<PARAM NAME='TOOLBAR_DRAW' VALUE='true'>");
    document.write("<PARAM NAME='TOOLBAR_TABLE' VALUE='FALSE'>");
    document.write("<PARAM NAME='TOOLBAR_IMAGE' VALUE='FALSE'>");
    document.write("<PARAM NAME='TOOLBAR_HEADERFOOTER' VALUE='FALSE'>");
    document.write("<PARAM NAME='SHOW_TOOLBAR' VALUE='true'>");
    document.write("</OBJECT>");
}

function field(){

	var name1 = HwpCtrl.GetFieldText("name1");
	var name2 = HwpCtrl.GetFieldText("name2");
	var name3 = HwpCtrl.GetFieldText("name3");
	var name4 = HwpCtrl.GetFieldText("name4");

	if(name1 == ""){
		alert("원고이름1 를 입력해주세요!!!!!");
		return false;
	}

	if(name2 == ""){
		alert("원고이름2 를 입력해주세요!!!!!");
		return false;
	}

	if(name3 == ""){
		alert("원고이름3 를 입력해주세요!!!!!");
		return false;
	}

	if(name4 == ""){
		alert("피고이름 를 입력해주세요!!!!!");
		return false;
	}

	var frm = document.sample2;
	frm.name1.value = name1;
	frm.name2.value = name2;
	frm.name3.value = name3;
	frm.name4.value = name4;

	frm.method = "post";
	frm.action = "indexAction.jsp";
	frm.submit();

}
function goInsert(){
	field();
}
$(document).ready(function(){
	$.ajax({
		type: "post",
		url: "indexList.jsp",
		success: function (data) {
			$("#listDiv").append(data);
		}
	});
});
</script>
</head>
<body onload="OnStart()">
<form name="sample2">
<input type="hidden" name="name1">
<input type="hidden" name="name2">
<input type="hidden" name="name3">
<input type="hidden" name="name4">
</form>
<table cellpadding="0" border=0 cellspacing="0" class="fr01">
    <tr>
        <td valign="top">
            <div style="width:1024px;height:600px;">
            <script language="javascript">WriteEmbedHanPop();</script>
        </td>
    </tr>
	<tr>
		<td>
			<div>
				<input type="button" style="width:200px;height:100px;" value="insert" onclick="javascript:goInsert();" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div id="listDiv">
			</div>
		</td>
	</tr>
</table>
</body>
</html>