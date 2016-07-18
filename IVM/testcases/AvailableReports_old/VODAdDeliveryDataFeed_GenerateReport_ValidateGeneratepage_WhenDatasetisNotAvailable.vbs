'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate VOD Ad Delivery Data Feed report" with no available data set.			
' Author 						:   SeaChange
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_VOD_TC_003"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						wait Wait10
									
									'.webTable("DataSet").assertValue NoRecordFound ,1
									
									.webElement("FilterOptionsExpand_Text").assertExist "False"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "False"
									
									.webElement("CommentsExpand_Text").assertExist "False"
									
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
									
									
									.webElement("EmailAndStorageOptions_Expand").press
	
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg

									
									.webElement("Comments_Expand").press
	
									.webElement("CommentsExpand_Text").assertExist "True"
									
									.webElement("CommentsExpand_Text").assertStatus "Visible"
									
									.webElement("CommentsExpand_Text").assertText Comments_msg
								
									
End with						         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_VOD_TC_003"