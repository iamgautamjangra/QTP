'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_GenerateOptionsLink_ValidateUIControls
' Description					:   Validate Default view Controls of "UniqueCustomers" report..			
' Author 						:   Fonantrix Solution
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_GenerateOptionsLink_ValidateUIControls", "REP_UCR_TC_002"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
	wait 10
	 
	with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
							wait 10

	'---------------Assert Back to previous webLink-----------------------

						   .webLink("BackToPreviousPage").assertExist"True"
						   .webLink("BackToPreviousPage").assertStatus"Visible"

	'---------------Assert header-----------------------------------------

							.webElement("GenerateReport").assertExist "True"
							.webElement("GenerateReport").assertStatus "Visible"
							.webElement("GenerateReport").assertText "Generate "& reportAllDetails & " Report"

	'---------------Assert label description----------------------------------
							.webElement("Description_UC").assertExist "True"
							.webElement("Description_UC").assertStatus "Visible"
							.webElement("Description_UC").assertText Desc_UC

							
							.webElement("SelectaDatasetForThisReport").assertExist "True"
							.webElement("SelectaDatasetForThisReport").assertStatus "Visible"
							
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("DataSet_Header").assertExist "True"
							.webTable("DataSet_Header").assertColumnExist "Dataset Name" ,"True"
							.webTable("DataSet_Header").assertColumnExist "Dataset Creation Timestamp" ,"True"
							.webTable("DataSet_Header").assertColumnExist "User" ,"True"
							.webTable("DataSet_Header").assertColumnExist "Parameter" ,"True"
							.webTable("DataSet").assertExist "True"
							
							.webRadioGroup("DataSet").assertExist "True"
							
	'----------------Assert header-----------------------------------------------

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
							.webElement("FilterOptions_Expand").assertExist "True"
							.webElement("FilterOptions_Expand").assertStatus "Visible"
							.webElement("FilterOptions_Expand").press
							.webElement("FilterOptionsExpand_Text").assertExist "True"
							.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
							.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
							  
							
							.webElement("EmailAndStorageOptions").assertExist "True"
							.webElement("EmailAndStorageOptions").assertStatus "Visible"
							.webElement("EmailAndStorageOptions_Expand").assertExist "True"
							.webElement("EmailAndStorageOptions_Expand").assertStatus "Visible"
							.webElement("EmailAndStorageOptions_Expand").press
							.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
							.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
							.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg
							
						
							
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_Expand").assertExist "True"
							.webElement("Comments_Expand").assertStatus "Visible"
							.webElement("Comments_Expand").press
							.webElement("CommentsExpand_Text").assertExist "True"
							.webElement("CommentsExpand_Text").assertStatus "Visible"
							.webElement("CommentsExpand_Text").assertText Comments_msg
		

	'Assert webbutton generate

							.webbutton("Generate").assertExist "True"
							.webbutton("Generate").assertStatus "Disable"

	'Assert webbutton Cancel

							.webbutton("Cancel").assertExist "True"
							.webbutton("Cancel").assertStatus "Visible"
							.webbutton("Cancel").press
							
	End with
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_GenerateOptionsLink_ValidateUIControls", "REP_UCR_TC_002"