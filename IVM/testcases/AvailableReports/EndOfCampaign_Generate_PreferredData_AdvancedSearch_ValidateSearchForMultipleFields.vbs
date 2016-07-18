'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateSearchForMultipleFields
' Description					:	Validate the multipel search using advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateSearchForMultipleFields", "REP_CSR_TC_031"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait7
					
					
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
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							
						   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
							
						
							
							.webElement("TimeRange_Filter").assertExist "True"
							If len(strTimeRange)>9 then 
							.webElement("TimeRange_Filter").assertText  "Time Range ="& mid(strTimeRange,1,8) &".." &"   X"
							
							Else
							.webElement("TimeRange_Filter").assertText  "Time Range ="& strTimeRange &"   X"
							
							End If
							
							
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_EOC").assertExist "True"
							
						
							
							.webTable("PreferredData_EOC").assertValue strElementNumber,"2"
							.webTable("PreferredData_EOC").assertValue strTimeRange,"1"
							
							
							.webTable("PreferredData_EOC").assertDelValue strElementNumber1
							
							.webTable("PreferredData_EOC").assertDelValue strTimeRange1
							.webLink("ClearAll").press
							wait Wait5
							
							.webElement("TimeRange_Filter").assertExist "False"
							
							.webElement("ElementNumber_Filter").assertExist "False"
							
							
							.webTable("PreferredData_EOC").assertValue strElementNumber1,"2"
							.webTable("PreferredData_EOC").assertValue strTimeRange1,"1"
							
							

End with
			
'End Test Case
							



'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateSearchForMultipleFields", "REP_CSR_TC_031"