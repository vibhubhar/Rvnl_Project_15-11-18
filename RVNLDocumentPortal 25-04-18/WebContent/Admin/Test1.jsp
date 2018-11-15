


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java"%>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="UTF-8">
<title><s:property value="#session.menuTitle"/></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
 <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
<link rel="stylesheet" href="css/main-image-slider.css">
<link href="css/skin-blue.min.css" rel="stylesheet" type="text/css" />
<!-- DATA TABLES -->
<link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css">
<link rel="stylesheet" href="css/jquery.bootstrap-touchspin.css" type="text/css">
<link rel="stylesheet" href="css/kendo.common.min.css" />
<link rel="stylesheet" href="css/kendo.default.min.css" />
<link rel="stylesheet" type="text/css" href="css/dashboardDropDownStyle.css" />


		<style type="text/css">
		
		th.header {
			background-image: url(scripts/bg.gif);;
			cursor: pointer;
			font-weight: bold;
			background-repeat: no-repeat;
			background-position: center left;
			padding-left: 20px;
			border-right: 1px solid #dad9c7;
			margin-left: -1px;
			background-position: center right;
		}
		
		th.headerSortUp {
			background-image: url(scripts/asc.gif);
			background-color: #3C8DBC;
			color: #fff;
			background-position: center right;
		}
		
		th.headerSortDown {
			background-image: url(scripts/desc.gif);
			background-color: #3C8DBC;
			color: #fff;
			background-position: center right;
		}
		
		body {
		color:#6B6B6B;
		}
		
		.spinner {
		  width: 100px;
		}
		.spinner input {
		  text-align: right;
		}
		.input-group-btn-vertical {
		  position: relative;
		  white-space: nowrap;
		  width: 1%;
		  vertical-align: middle;
		  display: table-cell;
		}
		.input-group-btn-vertical > .btn {
		  display: block;
		  padding: 0.44em;
		  margin-left: -1px;
		  position: relative;
		  border-radius: 0;
		}
		.input-group-btn-vertical > .btn:first-child {
		  border-top-right-radius: 3px;
		}
		.input-group-btn-vertical > .btn:last-child {
		  margin-top: -4px;
		  border-bottom-right-radius: 3px;
		}
		.input-group-btn-vertical i{
		  position: absolute;
		  top: -2px;
		  left: 2px;
		}
		select[multiple],
		select[size] {
		   height: 1.7em !important;
		}
		.form-group {
			margin-bottom: 15px !important;
		    padding-left: 6px !important;
		    padding-bottom: 6px !important;
		}
		.form-control {
			padding: 2px 10px !important;
		}
		.multiselect {
		    height: 2.1em !important;
		    border-radius : 1px !important;
		    margin-left: 2px !important;
		}
		
		label {
			  float: left !important; 
			  color: black  !important;
		}
		
		.open{
			    z-index: 3 !important;
		}
		</style>


</head><body class="skin-blue sidebar-collapse" style="">

	
 	

	<div class="content-wrapper"
		style="margin-left: 48px; margin-top: -3px; margin-bottom: -15px;">
		<section class="content" id="bodyOverlay"
			style="padding-bottom: 0px; min-height: 0px;">
			<span class="error" style="display: none; width: 350px;"
				id="messageId"></span>
			
			
			
		<form action="fmsSubUnitMeterSearch" method="post" id="fmsSubUnitMeterSearch" name="fmsSubUnitMeterSearch">
		 <s:hidden name="sFor" id="sFor"/>
          <div class="box" style="border-top-color: #3C8DBC;">
					<div class="box-header with-border">
						<h3 class="box-title">Search Parameter</h3>
						<%-- <input type="hidden" id="menuId" value="${sessionScope.menuId}"/> --%>
						
						<input type="hidden" id="usreSessnId" value="${sessionScope.usreSessnId}"/>
						
						<input type="hidden" id="userName" value="${sessionScope.userName}"/>
						<input type="hidden" id="sLEName" value="${sessionScope.LE_NAME}"/>
						
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse"
								data-toggle="tooltip" title="Collapse" style="color: #3C8DBC;">
								<i class="fa fa-minus"></i>
							</button>
							<button class="btn btn-box-tool" data-widget="remove"
								data-toggle="tooltip" title="Remove" style="color: #3C8DBC;">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<table id="fieldlist" >
					
                    <tr>
                        <td  class="form-group" style="width: 195px;" id="sCompGrouId">
                        <label for="fullname" class="required">Component Group</label>
                        
                     	<s:select list="sCompGroupList" id="sCompGroupVset" name="sCompGroupVsetSer" multiple="false" size="2" tabindex="1" theme="simple" cssClass="form-control" ></s:select> 
                     	</td >
                     	<td class="form-group" style="width: 195px;">
                        <label for="fullname" class="required">Meter Number</label>
                        <input type="text" id="sMeterNum" name="sMeterNumSer" placeholder="Enter..." tabindex="2" value="<s:property value="sMeterNumSer" />" style="width: 190px; height: 28px;"  class="k-textbox form-control"/>
                    	</td>
                    
                      <td id="projectId" class="form-group" >
                        			<div class="input-group" style="width: 200px;">
                        			<label for="fullname" class="required">FMS Project</label>
                    		     <s:select list="sFMSProjectList" id="sProjectHidden" name="sProjectHidden" multiple="false" size="2" tabindex="1" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    </td>
                    	 
                    
                    <td  id="towerId" class="form-group">
                      <div id="towerDiv" class="input-group" style="width: 200px;">
                      <label for="fullname" class="required">FMS Tower</label>
										
                    	<s:select list="sTowerList" id="sTowerHidden" name="sTowerHidden" multiple="false" size="2" tabindex="4" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    </td>	
                   		 <td  id="floorId" class="form-group">
                        <div id="floorDiv" class="input-group" style="width: 200px;">
							<label for="fullname" class="required">FMS Floor</label>			
                    	<s:select list="sFloorList" id="sFloorHidden" name="sFloorHidden" multiple="false" size="2" tabindex="5" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    	</td >
                    	 <td  id="unitId" class="form-group">
						<div id="unitDiv" class="input-group" style="width: 200px;">
								<label for="fullname" class="required">FMS Unit</label>		
                    	<s:select list="sUnitList" id="sUnitHidden" name="sUnitHidden" multiple="false" size="2" tabindex="6" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    	</td >
                    	 
                    </tr>
					<tr>
					<td  id="subUnitId" class="form-group">
						<div id="subUnitDiv" class="input-group" style="width: 200px;">
								<label for="fullname" class="required">FMS SubUnit</label>		
                    	<s:select list="sSubUnitList" id="sSubUnitHidden" name="sSubUnitHidden" multiple="false" size="2" tabindex="6" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    	</td >
                   <td  id="billingTdId" class="form-group">
						<div id="billingDiv" class="input-group" style="width: 200px;">
								<label for="fullname" class="required">Bill Cycle</label>		
                    	<s:select list="sBillingCycleList1" id="sBillingCycleId" name="sBillingCycleId" multiple="false" size="2" tabindex="6" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    	</td >
                   <%--  <td  id="billingPdId" class="form-group">
						<div id="billingPdDiv" class="input-group" style="width: 200px;">
								<label for="fullname" class="required">Period</label>		
                    	<s:select list="sBillingCyclePeriod" id="sBillingCyclePdId" name="sBillingCyclePdId" multiple="false" size="2" tabindex="6" theme="simple" cssClass="form-control" ></s:select>
                    	</div>
                    	</td > --%>	 	
					</tr>		
							
						</table>
					</div>
					<div class="box-footer">
                        <button type="button" id="btnSearch" class="btn btn-primary">Search</button>
						<button type="reset" onclick="clearBtn()" class="btn btn-primary">Clear</button>
					</div> 
        	    </div>  
            </form>	
			
			
			
			<div class="box" style="border-top-color: #3C8DBC;">

				<div class="box-header ">
					<h3 class="box-title">Search Result</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse"
							data-toggle="tooltip" title="Collapse" style="color: #3C8DBC;">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove"
							data-toggle="tooltip" title="Remove" style="color: #3C8DBC;">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<form action="saveMeterData" method="post" id="saveMeterData" name="saveMeterData">
                 <s:hidden name="sFor" id="sFor"/>
                <div class="box-body" style="text-align:center;">
                
                  <div class="box-body table-outter" style="text-align:center;">
                   <div class="top-panel">
                                                <div class="btn-group">
                                                  <button type="button" class="btn btn-box-tool  dropdown-toggle" style="color: #fff;background-color: #3c8dbc;" data-toggle="dropdown">Export to <span class="caret"></span></button>
                                                  <ul class="dropdown-menu" role="menu" id="pdfPrint">
                                                    
                                                  </ul>
                                                </div>
                                                </div>
                  
             	<table id="example1" class="table table-bordered table-striped" style="border-collapse:collapse; table-layout:fixed;">
                     <thead>
                     <tr  id="tableHdrRow" style="background-color: #9FBFF4;">
                     <th style="text-align: center; cursor: pointer;width:64px;"><span>Select All </span>
		                <input type="checkbox" value="" name="sAll" id="sAll" style="margin-right: 25px;" /></th>
		                <th style="text-align: center; cursor: pointer;width: 100px;display: none;" ><span>SubUnitComponentMeterId</span></th>
		               <th style="text-align: center; cursor: pointer;width: 100px;"><span>Component Group </span></th>
                       <th style="text-align: center; cursor: pointer;width: 100px;"><span>Meter Number </span></th>
                       <th style="text-align: center; cursor: pointer;width: 100px;"><span>Customer Name </span></th>
                       <th style="text-align: center; cursor: pointer;width: 100px;"><span>FMS Project </span></th>
                       <th style="text-align: center; cursor: pointer;width: 100px;"><span>FMS SubUnit </span></th>
                       <th style="text-align: center; cursor: pointer;width: 101px;"><span>Last Reading  Date</span></th>
                       <th style="text-align: center; cursor: pointer;width: 100px;"><span>Last Reading </span></th>
                       <th style="text-align: center; cursor: pointer;width: 101px;"><span>Current Reading</span></th>
                       <th style="text-align: center; cursor: pointer;width: 101px;"><span> Reading  Date</span></th>
                       <th style="text-align: center; cursor: pointer;width: 120px;"><span> Message</span></th>
                       <th style="text-align: center; cursor: pointer;width: 120px;"><span> Load Consume</span></th>
                    
                     </tr>
                   </thead>
                   
                   <tbody id="addRowId">

							<s:if test="%{sSubUnitMeterList.size()>0}">

								<s:iterator value="sSubUnitMeterList" var="sSubUnitMeterList"
									status="rowNum">
									<tr style="font-size: 14px;" class="gridRow" id="rowCountRole<s:property value="%{#rowNum.index}" />">
									<td style="font-size: 11px;">
									     <input type="checkbox" name="check" class="checkVal" value="<s:property value="%{#rowNum.index}"/>" id="check<s:property value="%{#rowNum.index}"/>"  >
									     <input type="hidden" name="sCustomerMeterReadingId"  id="sCustomerMeterReadingId<s:property value="%{#rowNum.index}"/>" value="<s:property value="%{#sSubUnitMeterList.sCustomerMeterReadingId}" />" >
									     
									      <input type="hidden" name="checkHidden" class="checkHi">
									</td>
									<td style="display: none; font-size: 11px;">
									      <input type="hidden" id="sSubUnitCompMeterId<s:property value="%{#rowNum.index}"/>" name="sSubUnitCompMeterId" class="form-control num"
											   placeholder="Enter..." style="" value="<s:property value="%{#sSubUnitMeterList.sSubUnitCompMeterId}" />" maxlength="100" />
									       <p> <s:property value="%{#sSubUnitMeterList.sSubUnitCompMeterId}" /></p>
									</td>
									 <td style="font-size: 11px;">
											   <s:property value="%{#sSubUnitMeterList.sCompGroupName}" />
											    <input type="hidden" id="sFMSCompGroupVset<s:property value="%{#rowNum.index}"/>" name="sFMSCompGroupVset" class="form-control num"
											   placeholder="Enter..." style="" value="<s:property value="%{#sSubUnitMeterList.sFMSCompGroupVset}" />" maxlength="100" onkeyup="keyupFunction(<s:property value="%{#rowNum.index}"/>);"/>
									</td>
									  <td style="font-size: 11px;">
									     <input type="hidden" id="sFMSSubUnitId<s:property value="%{#rowNum.index}"/>"
											name="sFMSSubUnitId" class="form-control" value="<s:property value="%{#sSubUnitMeterList.sFMSSubUnitId}" />"
											    placeholder="Enter..." />
										
									      <s:property value="%{#sSubUnitMeterList.sMeterNum}" />
										    <input type="hidden" id="sMeterNum<s:property value="%{#rowNum.index}"/>" name="sMeterNum" class="form-control num"
											   placeholder="Enter..." style="" value="<s:property value="%{#sSubUnitMeterList.sMeterNum}" />" readonly="true" maxlength="100" onkeyup="keyupFunction(<s:property value="%{#rowNum.index}"/>);"/>
										</td>
										<td style="font-size: 11px;">
										<input type="hidden" id="sCustomerName<s:property value="%{#rowNum.index}"/>" name="sCustomerName" maxlength="100" value="<s:property value="%{#sSubUnitMeterList.sCustomerName}" />" class="form-control  num"
											   placeholder="Enter..." readonly="true" style="" />
											   <s:property value="%{#sSubUnitMeterList.sCustomerName}" />
										</td>
										<td style="font-size: 11px;">
										    <input type="hidden" id="sFMSProjectName<s:property value="%{#rowNum.index}"/>" name="sFMSProjectName" value="<s:property value="%{#sSubUnitMeterList.sFMSProjectName}" />" readonly="true" class="form-control "
											   placeholder="Enter..." style=""  />
											 <input type="hidden" id="sFMSPrjId<s:property value="%{#rowNum.index}"/>" name="sFMSPrjId" value="<s:property value="%{#sSubUnitMeterList.sFMSPrjId}" />" readonly="true" class="form-control "
											   placeholder="Enter..." style="" />
											   <s:property value="%{#sSubUnitMeterList.sFMSProjectName}" />  
											   
										</td >
										<td style="font-size: 11px;">
										    <input type="hidden" id="sSubUnitName<s:property value="%{#rowNum.index}"/>" name="sSubUnitName" value="<s:property value="%{#sSubUnitMeterList.sSubUnitName}" />" readonly="true" class="form-control "
											   placeholder="Enter..." style=""  />
											   <s:property value="%{#sSubUnitMeterList.sSubUnitName}" />
											   
										</td>
										<td style="font-size: 11px;">
										    <input type="hidden" id="sReadingDate<s:property value="%{#rowNum.index}"/>" name="sReadingDate" value="<s:property value="%{#sSubUnitMeterList.sReadingDate}" />" readonly="true" class="form-control from"
											   placeholder="Enter..." style="" />
											   <s:property value="%{#sSubUnitMeterList.sReadingDate}" />
										</td>
										
										<td style="font-size: 11px;">
										    <input type="hidden" id="sLastReading<s:property value="%{#rowNum.index}"/>" name="sLastReading" value="<s:property value="%{#sSubUnitMeterList.sLastReading}" />" readonly="true" class="form-control "
											   placeholder="Enter..." style=""  />
											   <s:property value="%{#sSubUnitMeterList.sLastReading}" />
										</td>
										<td style="font-size: 11px;">
										    <input type="text" id="sCurrentReading<s:property value="%{#rowNum.index}"/>" name="sCurrentReading" value="<s:property value="%{#sSubUnitMeterList.sCurrentReading}" />" class="form-control "
											   placeholder="Enter..." style="" />
										</td>
										<td style="font-size: 11px;">
										
										    <input type="text" id="sCurrentReadingDate<s:property value="%{#rowNum.index}"/>" name="sCurrentReadingDate" value="<s:property value="%{#sSubUnitMeterList.sReadingdateTemp}" />" class="form-control to"
											   placeholder="Enter..." style="" readonly="true" />
										</td>
										<%-- <s:if test="%{sSubUnitMeterList.size()>0}">
										  
										
										     </s:if>
							                 <s:else>
								
								             </s:else> 
								          --%>
										
										<td style="font-size: 11px;">
										
										    <input type="text" id="sErrorMessage<s:property value="%{#rowNum.index}"/>" name="sErrorMessage" value="<s:property value="%{#sSubUnitMeterList.sErrormsg}" />" class="form-control" readonly="true"  placeholder="Enter..." style="width: 110px;" />
										</td>
										<td style="font-size: 11px;">
										
										    <input type="text" id="sLoadConsume<s:property value="%{#rowNum.index}"/>" name="sLoadConsume" value="<s:property value="%{#sSubUnitMeterList.sLoadConsume}" />" class="form-control"   placeholder="Enter..." style="width: 110px;" />
										</td>
										
										<%-- <td>
										<input type="text" id="sErrorMessage<s:property value="%{#rowNum.index}"/>" name="sErrorMessage" value="" readonly="true" class="form-control"
											    style="" />
										</td>
										
										<td style="width: 34px; cursor: pointer; text-align: center;">
											 <img class="btnAdd12" style="width: 23px;"
											src="scripts/plus.png" onclick="javascript: addRow123(this);" />
										</td>
										<td style="width: 34px; cursor: pointer; text-align: center;">
											<img class="btn" title="This row can not be deleted!"
											style="width: 41px; padding-bottom: 0px; padding-top: 0px; border-top-width: 0px; border-bottom-width: 0px;"
											src="scripts/minus.png" />
										</td> --%>
														
										
								</tr>
										
								</s:iterator>
								
							</s:if>
							<s:else>
								
								</s:else>
						</tbody>
                
                 </table>
                 </div>
           </div>
           </form>  
		            <div class="box-footer">
				<table>
					<tr>
					    <td> <button type="button" class="btn btn-primary" id="saveBtn" >Save</button> </td>
						<td> 
						   <a href="javascript:void(0);"  onclick="popUpImportExcel('encodeData("menuId="+(request.getSession().getAttribute("menuId"))+"&subMenuId=0&sRecordId="+request.getAttribute("sCompGroupVset")+"&sSessionId=0")%>')"> <button type="button" class="btn btn-primary" style="    margin-left: 5px;" >Import Excel</button></a>
						</td>
						<td ><a href="home"><button type="button" class="btn btn-primary" style="margin-left: 4px;" >Close</button></a></td>
						
					</tr>
				</table>
			</div>
		 </div> 
		          
		
		</section>
		</div>
		
		<div id="shortModal2" class="modal modal-wide fade">
					<div class="modal-dialog" style="width: 600px; margin-top: 60px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<span class="error"
								style="display: none; width: 100px; margin-left: 155px; padding: 10px 68px 8px 40px;"
								id="messageAddressId"> <s:textfield name="message"
									id="message" />
							</span>
							<section class="content"
								style="padding-bottom: 0px; min-height: 0px;">
								<%--  <s:hidden name="sFor" id="sFor" /> --%>
								<s:hidden name="sAddressId" id="sAddressId" />
								<!-- Your Page Content Here -->
								<!-- Chat box -->

								<div class="box" style="border-top-color: #3C8DBC;">
									<div class="box-header with-border">
										<h3 class="box-title">Component Group</h3>
									</div>
									<div class="box-body" style="text-align: center;">
									<form action="fmsSubUnitMeterSearch" method="post" id="fmsSubUnitMeterSearch2" name="fmsSubUnitMeterSearch2">
										<table style="text-align: center; margin-left: 165px;">
											<tr>
												<td class="form-group" >
													 <label for="fullname" class="required" style="margin-right: 105px;">Component Group</label>
														 <s:select list="sCompGroupList" id="sCompGroupVsetExel" name="sCompGroupVsetSer" multiple="false" 
														 size="2" tabindex="1" theme="simple" cssClass="form-control" ></s:select>
													
												</td>

											</tr>
											
											

										</table>
										</form> 

									</div>
									<!-- /.box-body -->

								</div>



							</section>
							<!-- /.content -->

							<div class="modal-footer">
								<button type="button" class="btn btn-primary "   style="float: left;" data-dismiss="modal" id="clsAdBun">OK</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
		
		
		
<!-- Main Footer -->
<footer class="main-footer" style=" text-align: right;">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
        </div>
        <!-- Default to the left -->
        <strong style=" margin-left: 50px; ">Copyright &copy; 2015 <a href="#">Connaissant</a>.</strong> All rights reserved.
 </footer>

  <div class='control-sidebar-bg'></div>
		<script src="js/jquery-ui.js"></script>
		<script src="scripts/commonJs.js"></script>
		<script src="scripts/ajax.js"></script>
	    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	    <script type="text/javascript" src="js/jquery.bootstrap-touchspin.js"></script>
		<script src="js/jszip.min.js"></script> 
		<script type="text/javascript">
		var myObject={
				 updateMe: function(sDtlId,sSessionId){
					 document.getElementById("sFor").value ="search";
					 var sCompGroupVset = document.getElementById("sCompGroupVset").value;
					 var menuId = $("#menuId").val();
					 var subMenuId = $("#subMenuId").val();
					 newwin=window.open('fmsSubUnitMeterSearch?sFor=search&menuId='+menuId+'&subMenuId='+subMenuId+'&sSessionId='+sSessionId+'&sCompGroupVset='+sCompGroupVset+'',"_self");
					//  document.fmsSubUnitMeterSearch.submit();
				}
		};
		var count = 0;
		
      $("#clsAdBun").click(function(){
    	     var sCompGroupVsetExel = document.getElementById("sCompGroupVsetExel").value;
    	      newwin=window.open('fmsSubUnitMeterSearch?sFor=search&sCompGroupVset='+sCompGroupVsetExel+'',"_self");	
    	    
		});
		
		$("#btnSearch").click(function(){
			
			var sCompGroupVset = document.getElementById("sCompGroupVset").value;
			var sSubUnitHidden = document.getElementById("sSubUnitHidden").value;
			var sUnitHidden = document.getElementById("sUnitHidden").value;
			
			if(sCompGroupVset =="" ){
				 showMessage("Please Select Component Group!");
				
			return false;	
			}
			if (sSubUnitHidden != '' && sUnitHidden =='') {
					 showMessage("Please select the FMS Unit ");
				    return false;
		    }
			
			document.getElementById("sFor").value ="search";
			document.fmsSubUnitMeterSearch.submit();
			
		});
        $("#excelUpload").click(function(){
        	var selectTag = document.getElementById("sCompGroupVset").value;
        	
			if(selectTag =="" ){
				 showMessage("Please Select Component Group!");
				
			return false;	
			}
			document.getElementById("sFor").value ="search";
			document.fmsSubUnitMeterSearch.submit();
			
		});
		
		function keyupFunction(rowId) {
			  if(this.value!=""){
			        $("#check"+rowId).prop("checked", "checked");
			  }else{
			        $("#check"+rowId).prop('checked', ""); 
			  }
		}

		
		function getUnitFloorMSOption(currId,currVal,prjId,valId,valTdId,param){
			var sMstrPrjValHidden  =$("#sMstrPrjValHidden").val();
			var sLegalEntityHidden = $("#sLegalEntityHidden").val();
			//  alert("sLEId---"+sLEId);
        	if(currVal=='tower'){
        		var twrId  =currId;
      			var floorId = null;
      			var unitId= null;
      			var pocketId=null;
        	}
        	else if(currVal=='floor'){
        		var twrId  =$("#sTowerHidden").val();
      			var floorId = currId;
      			var unitId= null;
      			var pocketId=null;
        	}
        	 else if(currVal=='sector'){
        		var twrId  =null;
      			var floorId = null; 
      			var unitId= null;
      			var pocketId =currId;//sector id
        	} 
        	 else if(currVal=='unit'){
          		    var twrId  =null;
        			var floorId = null;
        			var unitId= currId;
        			var pocketId=null;
          	}
        	$(valId).find('option').remove();
	    	if($(valTdId).find('div').find('div').hasClass("btn-group")==true && $(valTdId).find('select').hasClass("form-control")==true){
	    		$(valTdId).find('div').find('div').remove();
				$(valTdId).find('div').find('select').remove();
				$(valTdId).find('select').remove();
			}
			else{
	    		if($(valTdId).find('div').find('div').hasClass("btn-group")==true){
	    			$(valTdId).find('div').find('div').remove();
	    			$(valTdId).find('div').find('select').remove();
	    			$(valTdId).find('select').remove();
	    		}
	    		if($(valTdId).find('div').find('select').hasClass("form-control")==true){
	    			$(valTdId).find('div').find('select').remove();
	    			$(valTdId).find('select').remove();
	    		}
			}
	    	 if(param=='floor')
		    	{
		    		$("#floorDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2' class='form-control'></select>");
		    	}
	    	 else if(param=='unit'){
	    		$("#unitDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2' class='form-control'></select>");
	    	} else if(param=='subUnit'){
	    		$("#subUnitDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2' class='form-control'></select>");
	    	}/* else if(param=='pocket'){
	    		$("#pocketDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2' class='form-control'></select>");
			} */
	    	
	    	 $.get("getFMSPrjTwrFlrUnitLov", {
	    		sMstrPrjValHidden:sMstrPrjValHidden,
	    		sLegalEntityHidden : sLegalEntityHidden,
				prjId : prjId,
      			param : param,
      			twrId : twrId,
      			floorId: floorId,
      			unitId: unitId,
      			pocketId :pocketId 
      		}, function(result) {
      			
      			if(result!=""){
      				var data=JSON.parse(result);
          			if(data.length>0){
          				for(var i=0;i<data.length;i++){
          					$(valId).append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
          				}
          			}
      			}
      			  if(param=='unit'){
      			 $(valId).multiselect({
                     enableFiltering: true,
                     enableCaseInsensitiveFiltering:true,
                     numberDisplayed: 2,
                     nonSelectedText: '-- Please Select --',
                     filterPlaceholder: 'Search...',
                     includeSelectAllOption: true ,
                     selectAllText: true ,
                     onChange : function(option, checked) {
                    	 getUnitFloorMSOption(option.val(),'unit',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit');
                     }
      			 });

      		   }
      	    	else if(param=='floor'){
      				$(valId).multiselect({
                        enableFiltering: true,
                        enableCaseInsensitiveFiltering:true,
                        numberDisplayed: 2,
                        nonSelectedText: '-- Please Select --',
                        filterPlaceholder: 'Search...',
                        includeSelectAllOption: true ,
                        selectAllText: true ,
                        onChange : function(option, checked) {
                        	getUnitFloorMSOption(option.val(),'floor',$("#sProjectHidden").val(),'#sUnitHidden',"#unitId",'unit');
                        	setTimeout(function(){getUnitFloorMSOption(option.val(),'floor',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit'); },1000 ) ;
                        }
                      
          			});
      			 }else if(param=='subUnit'){
      				$(valId).multiselect({
                        enableFiltering: true,
                        enableCaseInsensitiveFiltering:true,
                        numberDisplayed: 2,
                        nonSelectedText: '-- Please Select --',
                        filterPlaceholder: 'Search...',
                        includeSelectAllOption: true ,
                        selectAllText: true ,
                        onChange : function(option, checked) {
                          }
                        });	
      			}
      	    	/* else if(param=='pocket'){
      				$(valId).multiselect({
                        enableFiltering: true,
                        enableCaseInsensitiveFiltering:true,
                        numberDisplayed: 2,
                        nonSelectedText: '-- Please Select --',
                        filterPlaceholder: 'Search...',
                        includeSelectAllOption: true ,
                        selectAllText: true ,
                        onChange : function(option, checked) {
                        	//getUnitFloorMSOption(option.val(),'pocket',$("#crmProject").val(),'#crmUnit',"#unitId",'unit');
                        }
                      });	
      			} */
      		}); 
        }
    function getDependentOption(prjId,valId,valTdId,param){
	//alert("prjId=>"+prjId+",param=>"+param)	;	
	      $(valId).find('option').remove();
	    	if($(valTdId).find('div').find('div').hasClass("btn-group")==true && $(valTdId).find('select').hasClass("form-control")==true){
	    		$(valTdId).find('div').find('div').remove();
				$(valTdId).find('div').find('select').remove();
				$(valTdId).find('select').remove();
			}
			else{
	    		if($(valTdId).find('div').find('div').hasClass("btn-group")==true){
	    			$(valTdId).find('div').find('div').remove();
	    			$(valTdId).find('div').find('select').remove();
	    			$(valTdId).find('select').remove();
	    		}
	    		if($(valTdId).find('div').find('select').hasClass("form-control")==true){
	    			$(valTdId).find('div').find('select').remove();
	    			$(valTdId).find('select').remove();
	    		}
			}
	    	
	    	 /* if(param=='sector'){
	    		$("#sectorDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2' class='form-control'></select>");	
	    	
	    	}
	    	else  */if(param=='tower'){
	    		$("#towerDiv").append("<select id="+valId.replace(/^#/, "")+" name="+valId.replace(/^#/, "")+" size='2'  class='form-control'></select>");
			}
	    	 $.get("getFMSPrjTwrFlrUnitLov", {
					prjId : prjId,
      			    param : param
      		}, function(result) {
      			//alert("result=>"+result);
      			if(result!=""){
      				var data=JSON.parse(result);
          			if(data.length>0){
          				for(var i=0;i<data.length;i++){
          					$(valId).append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
          				}
          			}
      			}
      			/*  if(param=='sector'){
      			$(valId).multiselect({
                    enableFiltering: true,
                    enableCaseInsensitiveFiltering:true,
                    numberDisplayed: 2,
                    nonSelectedText: '-- Please Select --',
                    filterPlaceholder: 'Search...',
                    includeSelectAllOption: true ,
                    selectAllText: true ,
                    onChange : function(option, checked) {
                    	  
                    	getUnitFloorMSOption(option.val(),'sector',$("#sMstrPrjValHidden").val(),'#sPocketValHidden',"#pocketId",'pocket'); 
                    	
                    }
                  });
      			} 
      			
      			else  */if(param=='tower'){
      				$(valId).multiselect({
                        enableFiltering: true,
                        enableCaseInsensitiveFiltering:true,
                        numberDisplayed: 2,
                        nonSelectedText: '-- Please Select --',
                        filterPlaceholder: 'Search...',
                        includeSelectAllOption: true ,
                        selectAllText: true ,
                        onChange : function(option, checked) {
                            getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sFloorHidden',"#floorId",'floor'); 
      						setTimeout(function(){getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sUnitHidden',"#unitId",'unit'); },8000 ) ; 
      						setTimeout(function(){getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit'); },1000 ) ;
                          }
                        });	
      			}
      			if(param=='subUnit'){
      				$(valId).multiselect({
                        enableFiltering: true,
                        enableCaseInsensitiveFiltering:true,
                        numberDisplayed: 2,
                        nonSelectedText: '-- Please Select --',
                        filterPlaceholder: 'Search...',
                        includeSelectAllOption: true ,
                        selectAllText: true ,
                        onChange : function(option, checked) {
                          }
                        });	
      			}
		});	 
    	}
		
	    $('#sAll').click( function(){
			
			var status = $(this).is(':checked');
			var activeBox=document.getElementsByName("check");
			if(status){
				document.getElementById("check0").checked=true;
				for(var i=0;i<activeBox.length;i++){
					document.getElementById("check"+i).checked=true;
					}
			}
			else{
				for(var i=0;i<activeBox.length;i++){
					document.getElementById("check"+i).checked=false;
					}
			}
			}); 
		
		
		
		function popUpImportExcel(urls){
            alert("urls>>"+urls);
			var selectTag = document.getElementById("sCompGroupVset").value;
        	
			if(selectTag =="" ){
				 $('#shortModal2').modal('toggle');
				 showMessageAddress("Please Select Component Group!");
			return false;	
			}
			showMessage("");
			var url="importExcel?"+urls;
			window.open(url,'View','height=600,width=1200');
			
		}
		function removeRow(removeNum) {
			jQuery('#rowCountRole' + removeNum).remove();
		}
		var ID = 0;
		
		function highlight_row() {
			var table = document.getElementById('example1');
			var cells = table.getElementsByTagName('td');
			for (var i = 0; i < cells.length; i++) {
				var cell = cells[i];
				cell.onclick = function() {
					var rowId = this.parentNode.rowIndex;

					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 1; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
					var rowSelected = table.getElementsByTagName('tr')[rowId];
					rowSelected.style.backgroundColor = "#BCD4EC";
					rowSelected.className += " selected";

					msg = 'The ID of the company is: '
							+ rowSelected.cells[0].innerHTML;
					msg += '\nThe cell value is: ' + this.innerHTML;
					// alert(msg);

					document.getElementById("cellShowFlag").value = 1;
					document.getElementById("historyId").value = rowSelected.cells[0].innerHTML;
					document.getElementById("cellRoleName").value = rowSelected.cells[1].innerHTML;
					document.getElementById("cellStartDate").value = rowSelected.cells[3].innerHTML;
					document.getElementById("cellEndDate").value = rowSelected.cells[4].innerHTML;
					document.getElementById("cellActiveUser").value = rowSelected.cells[5].innerHTML;
				}
			}
		}
		window.onload = highlight_row;
	
		function clearBtn(){
			 $('#sCompGroupVset option').removeAttr("selected");
			 $('#sCompGroupVset').multiselect('rebuild');
			 
			 $('#sProjectHidden option').removeAttr("selected");
			 $('#sProjectHidden').multiselect('rebuild');
			 
			 $('#sTowerHidden option').removeAttr("selected");
			 $('#sTowerHidden').multiselect('rebuild');
			 
			 $('#sFloorHidden option').removeAttr("selected");
			 $('#sFloorHidden').multiselect('rebuild');
			 
			 $('#sUnitHidden option').removeAttr("selected");
			 $('#sUnitHidden').multiselect('rebuild');
			 
			 $('#sSubUnitHidden option').removeAttr("selected");
			 $('#sSubUnitHidden').multiselect('rebuild');
			 
			 document.getElementById("sMeterNum").value = "";
			 
		}
		 $('#saveBtn').click(function() {
			 showMessage("");
			 
			 
			 
			 var lengthMetgrid=$(".gridRow").length;
				var metgrid = 0;
				metgrid = lengthMetgrid;
				
					    for (var i = 0; i < metgrid; i++) {
						    if (!jQuery(".checkVal").is(":checked")) {
						    	 showMessage("Please Select at least One checkBox!");
						        return false;
						    }
						
						  if(document.getElementsByName("sCurrentReading")[i].value ==""){
							   showMessage("Please Enter Current Reading!");
							   return false;
						  } 
						  if(document.getElementsByName("sCurrentReading")[i].value < document.getElementsByName("sLastReading")[i].value ){
							    showMessage("Current Reading is greater than Last Reading !");
							    return false;
						  } 
						  
						  /* var from = $("#sReadingDate"+i).val();
						  var to = $("#sCurrentReadingDate"+i).val();

						  if(Date.parse(from) > Date.parse(to)){
							  showMessage("Invalid Date Range");
						     return false;
						  } */
					     					      
					}
				
				
				
				
				/* for (var i = 0; i < metgrid; i++) {
					 var sCompGroupVset = document.getElementById('sCompGroupVset'+i).value;
				       var sMeterNum = document.getElementById('sMeterNum'+i).value;
				       var result = sCompGroupVset+sMeterNum; 
				       
					for (var k = i + 1; k < metgrid; k++) {
						var sCompGroupVset1 = document.getElementById('sCompGroupVset'+k).value;
					       var sMeterNum1 = document.getElementById('sMeterNum'+k).value;
					       var result1 = sCompGroupVset1+sMeterNum1; 
						
					 if( result == result1){
					    showMessage("Meter Number Should be unique !");
					     return false;
					
			     	   } 
						
						 if(document.getElementsByName("sCustomerName")[i].value 
								== document.getElementsByName("sCustomerName")[k].value){
							   showMessage("Premise Number Should be unique !");
							 return false;
						} 
						
					}
				}  */
						
			 
			 
			
			 var value = 'sFor=Save';
			 var checkbox = document.getElementsByName("check");
				var len = checkbox.length;
				// alert(len);
				if(len==0){
					showMessage(" No row exists to save !");
					return false;
				}
				
				var flag=false;
				 for (var i = 0; i < len; i++) {
					 if(checkbox[i].checked){
						 flag=true;
						}
				}
				 if(!flag){
					 showMessage("Please Select checkbox to save row !");
					 return false;
				 }
				 
			 var check='';
			 var sCustomerMeterReadingId='';
			 var sSubUnitCompMeterId='';
			 var sFMSCompGroupVset='';
			 var sLastReading='';
			 var sReadingDate='';
			 var sCurrentReading='';
			 var sCurrentReadingDate='';
			 var menuId = $("#menuId").val();
			 var subMenuId = $("#subMenuId").val();
			 var sSessionId = $("#sSessionId").val();
			 var vali='';
			 for(var i=0;i<len ;i++){
					if(checkbox[i].checked){
						 sCustomerMeterReadingId =sCustomerMeterReadingId.concat(document.getElementsByName("sCustomerMeterReadingId")[i].value + "^");
						 sSubUnitCompMeterId =sSubUnitCompMeterId.concat(document.getElementsByName("sSubUnitCompMeterId")[i].value + "^");
						 sFMSCompGroupVset = sFMSCompGroupVset.concat(document.getElementsByName("sFMSCompGroupVset")[i].value+ "^");
						 sLastReading = sLastReading.concat(document.getElementsByName("sLastReading")[i].value+ "^");
						 sReadingDate = sReadingDate.concat(document.getElementsByName("sReadingDate")[i].value+ "^");
						 sCurrentReading = sCurrentReading.concat(document.getElementsByName("sCurrentReading")[i].value+ "^");
						 sCurrentReadingDate = sCurrentReadingDate.concat(document.getElementsByName("sCurrentReadingDate")[i].value+ "^");
						 if(document.getElementsByName("check")[i].checked){
							    check=check.concat("1"+ "^");
							}else{
								check=check.concat("0"+ "^");
						} 
						vali=vali.concat(i+"~~");
					}
				}
			 
	    value = value +'&sSubUnitCompMeterId='+ sSubUnitCompMeterId +'&vali=' + vali+'&sFMSCompGroupVset='+ sFMSCompGroupVset +'&sLastReading='+ sLastReading +'&sReadingDate='+ sReadingDate +'&sCurrentReading='+ sCurrentReading +'&sCurrentReadingDate='+ sCurrentReadingDate+'&check='+ check ;
		$('#sFor').val("Save");
	
		$.get("saveSubUnitMeterData", {
			menuId:menuId,
			subMenuId:subMenuId,
			sSessionId:sSessionId,
			sCustomerMeterReadingId:sCustomerMeterReadingId,
			sSubUnitCompMeterId:sSubUnitCompMeterId,
			check:check,
			sFMSCompGroupVset:sFMSCompGroupVset,
			sLastReading:sLastReading,
			sReadingDate:sReadingDate,
			sCurrentReading:sCurrentReading,
			sCurrentReadingDate:sCurrentReadingDate,
			vali:vali
		}, function(result) {
			var data=JSON.parse(result);
			 var status=data[0].status;
			 var errorCode=data[0].errorCode;
				
				/* if(data[0].message=="APP0013: Transaction completed."){
					if(data.length>0){
						var i;
						//$(":input[name='sMeterId']").val(data[0].sMeterId);
						for( i=0;i<data.length;i++){
							//document.getElementById("sMeterId"+i).value=data[i].sMeterId;
							$("#sMeterId"+i).val(data[i].sMeterId);
							 
						}
					}
	        	} */
				// showMessage(data[0].message)
				
				
				var errorCodeArr = new Array(); 
				 
				//  if (data[0].meterError != '') {
					 
					 errorCodeArr = errorCode.split("^");
					 // alert("-----"+errorCodeArr);
					 var j = 0;		 
						if (errorCodeArr.length != '' ) {
							for (var i = 0; i < len; i++) {
								if (checkbox[i].checked) {
									 document.getElementById("sErrorMessage"+ checkbox[i].value).value = errorCodeArr[j];
								       
									  if (errorCodeArr[j] == "APP0013: Transaction completed." ) {
										$("#rowCountRole"+ i).css("background-color","#4F8A10;");
										 } else {
										$("#rowCountRole"+ i).css("background-color","#F7DBDB");
									} 
									  j++;
								}
							}
						}
				// 	}  
	     
			
		});
					
	});
		
		 $('#sBillingCycleId').multiselect({
				enableFiltering : true,
				enableCaseInsensitiveFiltering : true,
				numberDisplayed : 2,
				nonSelectedText : '-- Please Select --',
				filterPlaceholder : 'Search...'
			});
		 $('#sBillingCyclePdId').multiselect({
				enableFiltering : true,
				enableCaseInsensitiveFiltering : true,
				numberDisplayed : 2,
				nonSelectedText : '-- Please Select --',
				filterPlaceholder : 'Search...'
			});

	$(document).ready(function() {
		  var sCompGroup = document.getElementById("sCompGroupVsetExel").value;
		  // var sCurrentReading = document.getElementById("sCurrentReading").value;
		  
		
		  
			 var lengthMetgrid=$(".gridRow").length;
				var metgrid = 0;
				metgrid = lengthMetgrid;
				// if(sCurrentReading!=null)
					for (var i = 0; i < metgrid; i++) {
						  if(document.getElementsByName("sCurrentReading")[i].value !=""){
							  $("#rowCountRole"+ i).css("background-color","#F7DBDB");
							 } else if(document.getElementsByName("sErrorMessage")[i].value=="APP0013: Transaction completed."){
							$("#rowCountRole"+ i).css("background-color","#4F8A10;");
							}				      
					 }
				/* for (var i = 0; i < metgrid; i++) {
						  if(document.getElementsByName("sCurrentReading")[i].value !=""){
							  $("#rowCountRole"+ i).css("background-color","#4F8A10;");
							 } else {
							$("#rowCountRole"+ i).css("background-color","#F7DBDB");
							}				      
					 } */
		  
		
	 	var str=null;
		
		var sCompGroupVset = $( "#sCompGroupVset option:selected" ).text();
		var sMstrPrjVal = $( "#sMstrPrjValHidden option:selected" ).text();
		var sSectorVal = $( "#sSectorValHidden option:selected" ).text();
		var sPocketVal = $( "#sPocketValHidden option:selected" ).text();
		var sProject = $( "#sProjectHidden option:selected" ).text();
		var sTower = $( "#sTowerHidden option:selected" ).text();
		var sFloor = $( "#sFloorHidden option:selected" ).text();
		var sUnit = $( "#sUnitHidden option:selected" ).text();
		var sSubUnit = $( "#sSubUnitHidden option:selected" ).text();
		var sLegalEntityHidden = $( "#sLegalEntityHidden option:selected" ).text();
       
		 if($("#sMeterNum").val()!="" ){
			 var sMeterNum = $("#sMeterNum").val();
	        }else{
	        	var sMeterNum="";
	        }
		 if($("#sLEName").val()!="" ){
			 var sLEName = $("#sLEName").val();
	        }else{
	        	var sLEName="";
	        }
		
	
    
       
    var sUserIdHidd = $( "#sUserIdHidd option:selected" ).text();
    var sApprovalStatus = $( "#sApprovalStatus option:selected" ).text();
    var sHead = $( "#sHead option:selected" ).text();
       
   
	   
    str="ComponentGroup:"+sCompGroupVset+",MeterNumber:"+sMeterNum+",Project:"+sProject+",Tower:"+sTower+",Floor:"+sFloor+",Unit:"+sUnit+",SubUnit:"+sSubUnit;
	var str1="href='javascript://'>CSV</a></li>";
	var str2="href='javascript://'>TXT</a></li>";
	var str3="href='javascript://'>XLS</a></li>";
	$('#pdfPrint').append("<li><a onclick=\"exportTo('csv','#example1','SubUnitMeter','2,3,4,5,6,7,8,9,10,11','"+str+"',3,'"+sLEName+"','SubUnitMeter');\" "+str1+"");
	$('#pdfPrint').append("<li><a onclick=\"exportTo('txt','#example1','SubUnitMeter','2,3,4,5,6,7,8,9,10,11','"+str+"',3,'"+sLEName+"','SubUnitMeter');\" "+str2+"");
	$('#pdfPrint').append("<li><a onclick=\"exportTo('xls','#example1','SubUnitMeter','2,3,4,5,6,7,8,9,10,11','"+str+"',3,'"+sLEName+"','SubUnitMeter');\" "+str3+"");
	 
		
		
		 $('#sCompGroupVset').multiselect({
	          enableFiltering: true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --', 
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	            	$(this).focus();
	          	}
	      });
		 
		 
		 
		 $('#sCompGroupVsetExel').multiselect({
	          enableFiltering: true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --', 
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	               $('#sCompGroupVset').multiselect('refresh');
	          	}
	      });
		 $("#sCompGrouId").find('div').find('button').css('background-color', '#d6e2b5');
		 var lengthMsAll=$(".gridRow").length;
		 for(var i=0;i<=lengthMsAll;i++){
			 $('#sCompGroupVset'+i).multiselect('destroy');
			 $('#sCompGroupVset'+i).multiselect({
		          enableFiltering: true,
		          numberDisplayed: 2,
		          maxHeight: 200,
		          enableCaseInsensitiveFiltering: true,
		          nonSelectedText: '-- Please Select --', 
		          filterPlaceholder: 'Search...',
		          onChange : function(option, checked) {
		          	$(this).focus();
		          	
		          }
			 
			 
		      });
		 }
		 if($("#frmDate").val()!=""){
          	var sStartDate = $("#frmDate").val();
          	
          }else{
	        	var sStartDate="";
	        }
          if($("#toDate").val()!=""){
            	var sEndDate = $("#toDate").val();
            	
            }else{
	        	var sEndDate="";
	        }
       
	     
	      
		
		$(".borderAdd").each(function() {
			$(this).removeClass("borderAdd");
		});
		$("#tabli0").addClass("active borderAdd");

		$(".nav li").click(function() {
			console.log("nav call");
			$(".borderAdd").each(function() {
				$(this).removeClass("borderAdd");
			});
			$(this).addClass("borderAdd");
		});
		$('#togglr').click(function() {
			$('#menu').show();
			
		});
		$('#bodyOverlay').click(function() {
			$('#menu').hide();
			
		});
		$('.main-header').click(function() {
			$('#menu').hide();
			
		});
		$('.main-menu').click(function() {
			$('#menu').hide();
			
		});
		$('h1').click(function() {
			$('#menu').hide();
			
		});
		$('.gridRow').click(function() {
			//alert("click---");
			// $('#sRecordId').val(document.getElementsByName("sFMSSubUnitId")[(this).rowIndex-1].value);
			
		});
		
		
		 /* $('#example1').dataTable({
			"iDisplayLength":100	
		     }); */  
		/* $('#example1').tablesorter(); 
		$("#vBody").html($("#vBody").val()); */
		
		$('#sProjectHidden').multiselect({
	        enableFiltering: true,
	        numberDisplayed: 2,
	        nonSelectedText: '-- Please Select --',
	        filterPlaceholder: 'Search...',
	        onChange : function(option, checked) {
		      	  getDependentOption(option.val(),'#sTowerHidden',"#towerId",'tower');
		      	  setTimeout(function(){ getUnitFloorMSOption(option.val(),'project',$("#sProjectHidden").val(),'#sFloorHidden',"#floorId",'floor'); },800 ) ; 
				  setTimeout(function(){getUnitFloorMSOption(option.val(),'project',$("#sProjectHidden").val(),'#sUnitHidden',"#unitId",'unit'); },1000 ) ;
				  setTimeout(function(){getUnitFloorMSOption(option.val(),'project',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit'); },1100 ) ;
	        	}
	    });
	      $('#sTowerHidden').multiselect({
	          enableFiltering: true,
	          enableCaseInsensitiveFiltering:true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --',
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	        	  getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sFloorHidden',"#floorId",'floor'); 
					setTimeout(function(){getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sUnitHidden',"#unitId",'unit'); },8000 ) ; 
					setTimeout(function(){getUnitFloorMSOption(option.val(),'tower',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit'); },1000 ) ;
	          	}
	      });
	      $('#sFloorHidden').multiselect({
	          enableFiltering: true,
	          enableCaseInsensitiveFiltering:true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --',
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	        	  getUnitFloorMSOption(option.val(),'floor',$("#sProjectHidden").val(),'#sUnitHidden',"#unitId",'unit');
              	setTimeout(function(){getUnitFloorMSOption(option.val(),'floor',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit'); },1000 ) ;
	          	}
	      });
	      $('#sUnitHidden').multiselect({
	          enableFiltering: true,
	          enableCaseInsensitiveFiltering:true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --',
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	        	  getUnitFloorMSOption(option.val(),'unit',$("#sProjectHidden").val(),'#sSubUnitHidden',"#subUnitId",'subUnit');
	          }
	      });
	      $('#sSubUnitHidden').multiselect({
	          enableFiltering: true,
	          enableCaseInsensitiveFiltering:true,
	          numberDisplayed: 2,
	          nonSelectedText: '-- Please Select --',
	          filterPlaceholder: 'Search...',
	          onChange : function(option, checked) {
	          }
	      });
	      

			
			
	   
	
    });

	
	
	
	
		function isNullOrEmpty(param) {
			if (param == "" || param == null) {
				return true;
			}
			return false;
		}
		
		function showMessageAddress(message) {
			if (!isNullOrEmpty(message)) {
				if (message == "APP0013: Transaction completed.") {
					$("#messageAddressId").html(message).removeClass("error").addClass(
							"success");
					//alert("message=>"+message);
					$("#messageAddressId").show();
				} else {
					$("#messageAddressId").html(message).removeClass("success").addClass(
							"error");
					//alert("message1=>"+message);
					$("#messageAddressId").show();
				}

			} else {
				$("#messageAddressId").hide();
			}

		}

		
		
		function showMessage(message) {

			if (!isNullOrEmpty(message)) {
				if (message == "APP0013: Transaction completed.") {
					$("#messageId").html(message).removeClass("error")
							.addClass("success");
					$("#messageId").show();
				} else {
					$("#messageId").html(message).removeClass("success")
							.addClass("error");
					$("#messageId").show();
				}

			} else {
				$("#messageId").hide();
			}
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');

		}
		</script>

	<script type="text/javascript" src="js/tableExporter.js"></script>
</body>
</html>

