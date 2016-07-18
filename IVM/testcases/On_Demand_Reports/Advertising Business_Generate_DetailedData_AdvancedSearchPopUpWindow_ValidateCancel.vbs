'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate Cancel operation on advanced search
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_ODRR_TC_052"

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strAdSlotPosition=testcasedata.getvalue("strAdSlotPosition")
strAdSlotPosition1=testcasedata.getvalue("strAdSlotPosition1")

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
						   
						   
							.webLink("AdvCancel").press
							
							wait Wait2
							
						
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("AdSlotPosition_Filter").assertExist "False"
						
							
							.webTable("DetailedData_ODR").assertExist "True"
							
						
							
							.webTable("DetailedData_ODR").assertValue strAdTitle1,"2"
							.webTable("DetailedData_ODR").assertValue strCampaignName1,"1"
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition1,"3"
						
							

End with	
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_ODRR_TC_052"