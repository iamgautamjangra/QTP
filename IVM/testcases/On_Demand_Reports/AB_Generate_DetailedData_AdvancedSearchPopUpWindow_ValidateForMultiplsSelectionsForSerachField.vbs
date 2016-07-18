'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AB_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AB_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_ODRR_TC_051"


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
						   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
							
							.webElement("AdSlotPosition_Filter").assertExist "True"
							If len(strAdSlotPosition)>9 then 
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& mid(strAdSlotPosition,1,8) &".." &"   X"
							
							Else
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& strAdSlotPosition &"   X"
							
							End If
							
														
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitle)>9 then 
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& mid(strAdTitle,1,8) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& strAdTitle &"   X"
							
							End If
							
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
							
							
							.webTable("DetailedData_ODR").assertValue strCampaignName,"1"
							.webTable("DetailedData_ODR").assertValue strAdTitle,"2"
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition,"3"
															
						
							.webTable("DetailedData_ODR").assertDelValue strCampaignName1
							.webTable("DetailedData_ODR").assertDelValue strAdTitle1
							.webTable("DetailedData_ODR").assertDelValue strAdSlotPosition1
							
							.webLink("ClearAll").press
							wait Wait7
							
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("AdSlotPosition_Filter").assertExist "False"
							
							.webTable("DetailedData_ODR").assertValue strAdTitle1,"2"
							.webTable("DetailedData_ODR").assertValue strCampaignName1,"1"
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition1,"3"
							
							

End with
			
'End Test Case
							

executionController.stopTestCase_w_TestCaseNumber "AB_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_ODRR_TC_051"