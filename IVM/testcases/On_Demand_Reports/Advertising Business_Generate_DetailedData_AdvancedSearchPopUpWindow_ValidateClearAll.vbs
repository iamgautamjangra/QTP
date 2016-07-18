'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdTitle=testcasedata.getvalue("strAdTitle")
strCampaignName=testcasedata.getvalue("strCampaignName")
strAdSlotPosition=testcasedata.getvalue("strAdSlotPosition")


ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait7

With ivm.page(report_page)

						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						 
						.webEdit("PastNoOfHours").setValue strHours
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(detailedData_page)
							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("CampaignName_Adv").setValue strCampaignName
							.webEdit("AdSlotPosition_Adv").setValue strAdSlotPosition
							.webEdit("AdTitle_Adv").setValue strAdTitle
													
						.webLink("AdvClearAll").press
						
						wait Wait3
						.webEdit("CampaignName_Adv").assertValue ""
						
						.webEdit("AdSlotPosition_Adv").assertValue ""
						
						.webEdit("AdTitle_Adv").assertValue ""
						
						.webLink("AdvCancel").press
						
					
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"