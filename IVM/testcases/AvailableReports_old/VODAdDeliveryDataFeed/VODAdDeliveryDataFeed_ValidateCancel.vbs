'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_ValidateCancel
' Description					:	Validate the "VOD Ad Delivery Data Feed" on clicking "Cancel" button.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateCancel", "REP_VOD_TC_020"

REM ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
REM wait 10

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
' strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait 10	
						 
						    .webTable("SelectaDatasetforThisReport").assertExist "True"
						 
						
						 	
										 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
						wait 5
						 
						 .webElement("FilterOptions").assertExist "True"
						 .webElement("FilterOptions").assertStatus "Visible"
						
											
						.selectListItem MULTI_LIST_TimeRange,strTimeRange,"True"
						wait 2
						.selectListItem MULTI_LIST_TimeRange,strTimeRange1,"True"
						wait 2
						
						.webList("SelectaProveder").assertExist "True"
					    .webList("SelectaProveder").selectItem strProvider
						 wait 5
					
                     					
												
						'.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						'wait 5
						
										
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Cancel").press
						wait 10
		
						.webTable("AvailableReports").assertExist "True"
						
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateCancel", "REP_VOD_TC_020"