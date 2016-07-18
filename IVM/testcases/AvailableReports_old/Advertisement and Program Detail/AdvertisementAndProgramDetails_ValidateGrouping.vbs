'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_ValidateGrouping
' Description					:	Validate the Grouping list box
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateGrouping", "REP_APD_TC_017"

strSeachValue=testcasedata.getvalue("strSeachValue")
strGrouping=testcasedata.getvalue("strGrouping")
strGrouping1=testcasedata.getvalue("strGrouping1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
							wait 10
							
							.webTable("SelectaDatasetforThisReport").assertExist "True"
						    .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                            .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
							.webLink("FilterOptions").assertExist "True"
						    .webLink("FilterOptions").assertStatus "Visible"
							.webLink("FilterOptions").press
							wait 5
		
							
							.webList("Grouping").assertExist "True"
							.webList("Grouping").assertStatus "Visible"
							
							.assertListItems LIST_GROUPING,""
							
							.webList("Grouping").selectItem strGrouping
							 wait 3
							.webList("Grouping").validateSelectedItem strGrouping
							
							.webList("Grouping").selectItem strGrouping1
							 wait 3
							.webList("Grouping").validateSelectedItem strGrouping1	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateGrouping", "REP_APD_TC_017"