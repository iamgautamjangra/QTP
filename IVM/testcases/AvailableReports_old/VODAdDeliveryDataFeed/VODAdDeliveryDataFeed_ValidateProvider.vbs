'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_ValidateProvider
' Description					:	Validate "Sites" List box.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateProvider", "REP_VOD_TC_015"

REM ivm.NavigateToMenu MENU_AVAILABLE_REPORTS	
REM wait 10

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
strProvider2=testcasedata.getvalue("strProvider2")


With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
							 wait 10	
							 
						   
						 					
										 
						    .webTable("DataSet").presstblRadioBtn strSeachValue,1 
							
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
							
				           .webList("SelectaProveder").assertExist "True"
						   .webList("SelectaProveder").selectItem strProvider
						   .webList("SelectaProveder").assertSelectedItem strProvider
						   
						   .webList("SelectaProveder").selectItem strProvider1
						   .webList("SelectaProveder").assertSelectedItem strProvider1
		
		                   REM .webList("SelectaProveder").selectItem strProvider2
						   REM .webList("SelectaProveder").assertSelectedItem strProvider2
		
																													

	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateProvider", "REP_VOD_TC_015"