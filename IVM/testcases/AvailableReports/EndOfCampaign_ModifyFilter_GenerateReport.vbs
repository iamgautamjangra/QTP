'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_ModifyFilter_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_ModifyFilter_GenerateReport", "REP_CSR_TC_013"


DataSet1=testcasedata.getvalue("DataSet1")

strTimeRange1=testcasedata.getvalue("strTimeRange1")
strComments1=testcasedata.getvalue("strComments1")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet1,1 
						wait Wait7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						for i=0 to 4
						Comments=Comments & strComments1
						Next
						.webEdit("Comments").setValue Comments
		
						.webButton("Generate").press
						wait Wait8

End with
With ivm.page(preferredData_page)

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.assertExistWE strTimeRange1,"True"
			
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText Comments
						
End With
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_ModifyFilter_GenerateReport", "REP_CSR_TC_013"	