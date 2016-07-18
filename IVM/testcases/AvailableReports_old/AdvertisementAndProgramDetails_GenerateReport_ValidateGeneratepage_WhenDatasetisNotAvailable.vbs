'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate Advertisement And Program Details report" with no available data set.			
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_APD_TC_003"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)
									
									
									.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
									wait Wait5
									
									'.webTable("DataSet").assertValue NoRecordFound ,1
									
									.webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("CommentsExpand_Text").assertExist "False"
									
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
									
									REM .webElement("FilterOptions_Expand").press
									
									REM .webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptions_Expand").press
	
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg

									REM .webElement("EmailAndStorageOptions_Expand").press
									
									REM .webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("Comments_Expand").press
	
									.webElement("CommentsExpand_Text").assertExist "True"
									
									.webElement("CommentsExpand_Text").assertStatus "Visible"
									
									.webElement("CommentsExpand_Text").assertText Comments_msg
									
									REM .webElement("Comments_Expand").press
									
									REM .webElement("CommentsExpand_Text").assertExist "False"
End with				         
		         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_APD_TC_003"