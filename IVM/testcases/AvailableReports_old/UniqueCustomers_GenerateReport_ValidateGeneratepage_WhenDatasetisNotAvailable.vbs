'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate UniqueCustomers report" with no available data set.			
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_UCR_TC_004"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10


With ivm.page(report_page)
									
									
									.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
									wait Wait5
									
									'.webTable("DataSet").assertValue NoRecordFound ,1
									
									.webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("CommentsExpand_Text").assertExist "False"
									
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
									
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptions_Expand").press
	
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg

									.webElement("EmailAndStorageOptions_Expand").press
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("Comments_Expand").press
	
									.webElement("CommentsExpand_Text").assertExist "True"
									
									.webElement("CommentsExpand_Text").assertStatus "Visible"
									
									.webElement("CommentsExpand_Text").assertText Comments_msg
									
									.webElement("Comments_Expand").press
									
									.webElement("CommentsExpand_Text").assertExist "False"
End with				         
		         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_UCR_TC_004"