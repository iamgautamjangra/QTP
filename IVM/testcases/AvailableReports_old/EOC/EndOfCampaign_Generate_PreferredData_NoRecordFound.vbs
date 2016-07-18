'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_NoRecordFound", "REP_EOC_TC_024"

strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportEndOfCampaign,3
					     wait 5
						 
																
										 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
							wait 5 
						 
						
							
					     
					  	.selectListItem MULTI_LIST_TimeRange,strTimeRange,"True"
						wait 2
						.selectListItem MULTI_LIST_TimeRange,strTimeRange1,"True"
						wait 2
						
																	
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
												
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(PreferredData_page)	

						.webLink("PreferredData").press
						wait 5
						
						.webTable("PreferredData_EOC").assertValue NO_RECORD_FOUND,1
						
						.webLink("BackToPreviousPage").press
							wait 10	
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
		

End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_NoRecordFound", "REP_EOC_TC_024"