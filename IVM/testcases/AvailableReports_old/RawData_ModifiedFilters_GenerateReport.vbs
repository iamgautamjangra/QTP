'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport
' Description					:	To validate the pre-populated values displayed when user generates a report without changing the filter criteria.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport", "REP_CSR_TC_012"


strSeachValue=testcasedata.getvalue("strSeachValue")
strProgramPid=testcasedata.getvalue("strProgramPid")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
						wait Wait7
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					   .selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
					   
					   for i=0 to 4
							Comment=Comment & strComments
							next
						.webEdit("Comments").setValue Comment
		
						.webButton("Generate").press
						wait Wait8

End with
With ivm.page(preferredData_page)

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							.webElement("ProgramPid").assertExist "True"
							.webElement("ProgramPid").assertStatus "Visible"
							.assertExistWE strProgramPid,"True"
							
							.webElement("CampaignNames").assertExist "True"
							.webElement("CampaignNames").assertStatus "Visible"
							.assertExistWE strCampaign,"True"
						
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							
							.webElement("Comments_val").assertText Comment
						
End With
						
						
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport", "REP_CSR_TC_012"	