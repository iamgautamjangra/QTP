'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdTitle
' Description					:	Validate the AdTitle filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdTitle", "REP_ODRR_TC_046"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strAdTitleInv=testcasedata.getvalue("strAdTitleInv")

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
							
							.webEdit("AdTitle_Adv").setValue strAdTitle
						   
							.webLink("AdvSearch").press
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitle)>9 then 
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& mid(strAdTitle,1,8) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& strAdTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
							
						
							.webTable("DetailedData_ODR").assertValue strAdTitle,"8"
							wait Wait5	
							.webTable("DetailedData_ODR").assertDelValue strAdTitle1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("AdTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_ODR").assertValue strAdTitle1,"8"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("AdTitle_Adv").setValue strAdTitleInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitleInv)>9 then 
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& mid(strAdTitleInv,1,8) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& strAdTitleInv &"   X"
							End If
							
							.webElement("AdTitle_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_ODR").assertExist "True"
						
							.webTable("DetailedData_ODR").searchData NoRecordFound_msg
							
							.webTable("DetailedData_ODR").assertDelValue strAdTitle
							.webTable("DetailedData_ODR").assertDelValue strAdTitle1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("AdTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_ODR").assertValue strAdTitle,"8"
							
							.webTable("DetailedData_ODR").assertValue strAdTitle1,"8"
							
							.webTable("DetailedData_ODR").assertDelValue NoRecordFound_msg
							
					        
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_AdvanceSearchPopUpWindow_ValidateAdTitle", "REP_ODRR_TC_046"