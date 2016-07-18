'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_BacktopreviouspageLink
' Description					:	Validate the operation of  "<Back To Previous Page" link on the Report.
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_BacktopreviouspageLink", "REP_EOC_TC_021"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						wait 10
							
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 5
						
						.webEdit("EmailRecipients").setValue strEmail
					
						.webList("ReportFormat").selectItem strReportFormat
			
						.webList("DataType").selectItem strDataType
								
										
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(PreferredData_Page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait 5	
End With

With ivm.page(report_page)
							
						.webElement("GenerateReport").assertExist "True"
						.webElement("GenerateReport").assertStatus "Visible"
						.webElement("GenerateReport").assertText "Generate "& reportEndOfCampaign & " Report"
						
							
						.weblink("BackToPreviousPage").press
						wait 5
							
						.webTable("AvailableReports").assertExist "True"
					
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_BacktopreviouspageLink", "REP_EOC_TC_021"