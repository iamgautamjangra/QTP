'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdSlotPosition
' Description					:	Validate the AdSlotPosition filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdSlotPosition", "REP_ODRR_TC_046"

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdSlotPosition=testcasedata.getvalue("strAdSlotPosition")
strAdSlotPosition1=testcasedata.getvalue("strAdSlotPosition1")
strAdSlotPositionInv=testcasedata.getvalue("strAdSlotPositionInv")

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
							
							.webEdit("AdSlotPosition_Adv").setValue strAdSlotPosition
						   
							.webLink("AdvSearch").press
							.webElement("AdSlotPosition_Filter").assertExist "True"
							If len(strAdSlotPosition)>9 then 
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& mid(strAdSlotPosition,1,8) &".." &"   X"
							
							Else
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& strAdSlotPosition &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
							
						
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition,"8"
							wait Wait5	
							.webTable("DetailedData_ODR").assertDelValue strAdSlotPosition1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("AdSlotPosition_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition1,"8"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("AdSlotPosition_Adv").setValue strAdSlotPositionInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("AdSlotPosition_Filter").assertExist "True"
							If len(strAdSlotPositionInv)>9 then 
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& mid(strAdSlotPositionInv,1,8) &".." &"   X"
							
							Else
							.webElement("AdSlotPosition_Filter").assertText  "Ad Slot Position ="& strAdSlotPositionInv &"   X"
							End If
							
							.webElement("AdSlotPosition_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
						
							.webTable("DetailedData_ODR").searchData NoRecordFound_msg
							
							.webTable("DetailedData_ODR").assertDelValue strAdSlotPosition
							.webTable("DetailedData_ODR").assertDelValue strAdSlotPosition1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("AdSlotPosition_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition,"8"
							
							.webTable("DetailedData_ODR").assertValue strAdSlotPosition1,"8"
							
							.webTable("DetailedData_ODR").assertDelValue NoRecordFound_msg
							
					        
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdSlotPosition", "REP_ODRR_TC_046"