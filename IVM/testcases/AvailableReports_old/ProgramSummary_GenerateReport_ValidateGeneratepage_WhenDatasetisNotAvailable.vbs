'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate ProgramSummary report" with no available data set.			
' Author 						:   SeaChange
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_PSR_TC_004"


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10


With ivm.page(report_page)
									
									
									.webTable("AvailableReports").presstblLink reportProgramSummary,3
									wait Wait5
									
									
									
									.webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("CommentsExpand_Text").assertExist "False"
									
									.webElement("FilterOptions_Expand").press
									wait wait2
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									
									
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
																		
									.webElement("EmailAndStorageOptions_Expand").press
										wait wait2
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									
									
										.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg
																		
											.webElement("Comments_Expand").press
												wait wait2
											.webEdit("TimeRange").assertExist "False"
											.webEdit("Campaigns").assertExist "False"
									
End with				         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_PSR_TC_004"