'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateElementNumber
' Description					:	Validate the element number filter on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateElementNumber", "REP_CSR_TC_025"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strElementNumberInv=testcasedata.getvalue("strElementNumberInv")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10


With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							
							.webEdit("ElementNumber_EOC_Adv").setValue strElementNumber
						   
							.webLink("AdvSearch").press
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_EOC").assertExist "True"
							
						
							.webTable("PreferredData_EOC").assertValue strElementNumber,"2"
							wait Wait5	
							.webTable("PreferredData_EOC").assertDelValue strElementNumber1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ElementNumber_Filter").assertExist "False"
							
						
							.webTable("PreferredData_EOC").assertValue strElementNumber1,"2"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ElementNumber_EOC_Adv").setValue strElementNumberInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumberInv)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumberInv,1,8) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumberInv &"   X"
							End If
							
							.webElement("ElementNumber_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_EOC").assertExist "True"
						
							.webTable("PreferredData_EOC").searchData NoRecordFound_msg
							
							.webTable("PreferredData_EOC").assertDelValue strElementNumber
							.webTable("PreferredData_EOC").assertDelValue strElementNumber1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ElementNumber_Filter").assertExist "False"
							
						
							
							.webTable("PreferredData_EOC").assertValue strElementNumber,"2"
							
							.webTable("PreferredData_EOC").assertValue strElementNumber1,"2"
							
							.webTable("PreferredData_EOC").assertDelValue NoRecordFound_msg
							
					        
End with

'End testcase
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateElementNumber", "REP_CSR_TC_025"