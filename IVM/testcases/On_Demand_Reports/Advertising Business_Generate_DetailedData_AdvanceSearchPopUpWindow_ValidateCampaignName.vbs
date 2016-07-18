'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateCampaignName
' Description					:	Validate the CampaignName filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateCampaignName", "REP_ODRR_TC_046"

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strCampaignNameInv=testcasedata.getvalue("strCampaignNameInv")

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
						   
							.webLink("AdvSearch").press
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
							
						
							.webTable("DetailedData_ODR").assertValue strCampaignName,"8"
							wait Wait5	
							.webTable("DetailedData_ODR").assertDelValue strCampaignName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("CampaignName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_ODR").assertValue strCampaignName1,"8"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("CampaignName_Adv").setValue strCampaignNameInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignNameInv)>9 then 
							.webElement("CampaignName_Filter").assertText  "Program Title ="& mid(strCampaignNameInv,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Program Title ="& strCampaignNameInv &"   X"
							End If
							
							.webElement("CampaignName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
						
							.webTable("DetailedData_ODR").searchData NoRecordFound_msg
							
							.webTable("DetailedData_ODR").assertDelValue strCampaignName
							.webTable("DetailedData_ODR").assertDelValue strCampaignName1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("CampaignName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_ODR").assertValue strCampaignName,"8"
							
							.webTable("DetailedData_ODR").assertValue strCampaignName1,"8"
							
							.webTable("DetailedData_ODR").assertDelValue NoRecordFound_msg
							
					        
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateCampaignName", "REP_ODRR_TC_046"