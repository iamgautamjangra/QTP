'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_BacktopreviouspageLink
' Description					:	Validate the "<Back To Previous Page" link on the Report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_BacktopreviouspageLink", "REP_CSR_TC_011"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

strSeachValue=testcasedata.getvalue("strSeachValue")


With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1
						wait 5
						
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(PreferredData_page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait 7
End With

With ivm.page(report_page)
							
						
						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webtable("DataSet_Header").assertExist "True"
							
						.weblink("BackToPreviousPage").press
						wait 5
							
						.webTable("AvailableReports").assertExist "True"
					
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_BacktopreviouspageLink", "REP_CSR_TC_011"