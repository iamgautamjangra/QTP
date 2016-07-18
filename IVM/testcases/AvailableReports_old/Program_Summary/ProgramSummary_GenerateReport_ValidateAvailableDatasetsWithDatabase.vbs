'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls
' Description					:   Validate Default view Controls of "Advertisement And Program Details" report..			
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls", "REP_APD_TC_002"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
	wait 5
	 
	with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportProgramSummary,3
							wait 10

	

							.webTable("DataSet").assertTableData "DataSet",reportProgramSummary
							
	End with
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls", "REP_APD_TC_002"