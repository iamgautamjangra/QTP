'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClockNumber
' Description					:	Validate the element number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClockNumber", "REP_RDR_TC_018"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strClockNumberInv=testcasedata.getvalue("strClockNumberInv")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_RD").assertExist "True"
							
						   .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ClockNumber_Adv").setValue strClockNumber
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
						
							.webTable("PreferredData_RD").assertValue strClockNumber,"8"
							wait 5	
							.webTable("PreferredData_RD").assertDelValue strClockNumber1
							.webLink("ClearAll").press
							wait 5
							.webElement("ClockNumber_Filter").assertExist "False"
							
							
							.webTable("PreferredData_RD").assertValue strClockNumber1,"8"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ClockNumber_Adv").setValue strClockNumberInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumberInv)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumberInv,1,10) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumberInv &"   X"
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
						
							.webTable("PreferredData_RD").searchData NoRecordFound_msg
							
							.webTable("PreferredData_RD").assertDelValue strClockNumber
							.webTable("PreferredData_RD").assertDelValue strClockNumber1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("ClockNumber_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("PreferredData_RD").assertValue strClockNumber,"8"
							
							.webTable("PreferredData_RD").assertValue strClockNumber1,"8"
							
							.webTable("PreferredData_RD").assertDelValue NoRecordFound_msg
							
					        
							
End with							
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClockNumber", "REP_RDR_TC_018"