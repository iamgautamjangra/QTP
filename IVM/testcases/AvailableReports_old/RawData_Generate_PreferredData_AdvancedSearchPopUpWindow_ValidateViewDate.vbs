'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateViewDate 
' Description					:	Validate the date range filter on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateViewDate ", "REP_RDR_TC_038"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strElementNumberInv=testcasedata.getvalue("strElementNumberInv")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")
strBetweenDate1=testcasedata.getvalue("strBetweenDate1")
strAndDate1=testcasedata.getvalue("strAndDate1")
strBetweenDateInv=testcasedata.getvalue("strBetweenDateInv")
strAndDateInv=testcasedata.getvalue("strAndDateInv")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait5

								.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
						end if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait10
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
							.webTable("PreferredData_RD").assertExist "True"
							
						   .webLink("AdvancedSearch").press
							wait Wait5
							
							
							.selectDate "BetweenDate",strBetweenDate
							wait Wait2
							.selectDate "AndDate",strAndDate
							wait Wait2
							.webLink("AdvSearch").press
							 wait Wait7	
							.webElement("Between_Filter").assertExist "True"
							If len(strBetweenDate)>9 then 
							.webElement("Between_Filter").assertText  "Between ="& mid(strBetweenDate,1,10) &".." &"   X"
							
							Else
							.webElement("Between_Filter").assertText  "Between ="& strBetweenDate &"   X"
							
							End If
							
							.webElement("And_Filter").assertExist "True"
							If len(strAndDate)>9 then 
							.webElement("And_Filter").assertText  "and ="& mid(strAndDate,1,10) &".." &"   X"
							
							Else
							.webElement("And_Filter").assertText  "and ="& strAndDate &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
						
							.webTable("PreferredData_RD").assertValue strBetweenDate1,1
							.webTable("PreferredData_RD").assertValue strAndDate1,1
							wait Wait5	
							.webTable("PreferredData_RD").assertDelValue strBetweenDateInv
							.webTable("PreferredData_RD").assertDelValue strAndDateInv
							.webLink("ClearAll").press
							wait Wait5
							
							.webTable("PreferredData_RD").assertValue strBetweenDateInv,1
							.webTable("PreferredData_RD").assertValue strAndDateInv,1
							
							.webElement("And_Filter").assertExist "False"
							.webElement("Between_Filter").assertExist "False"
							
							.webLink("AdvancedSearch").press
							wait Wait5
							
							
							.selectDate "BetweenDate",strBetweenDate
							
							.webLink("AdvSearch").press
							 wait Wait7	
							.webElement("Between_Filter").assertExist "True"
							If len(strBetweenDate)>9 then 
							.webElement("Between_Filter").assertText  "Between ="& mid(strBetweenDate,1,10) &".." &"   X"
							
							Else
							.webElement("Between_Filter").assertText  "Between ="& strBetweenDate &"   X"
							
							End If
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
						
							.webTable("PreferredData_RD").assertValue strBetweenDate1,1
							.webTable("PreferredData_RD").assertDelValue strAndDate1
							
							.webLink("ClearAll").press
							wait Wait5
							.webTable("PreferredData_RD").assertValue strAndDate1,1
							.webElement("Between_Filter").assertExist "False"
							
							.webLink("AdvancedSearch").press
							wait Wait5
							.selectDate "AndDate",strAndDate
							wait Wait2
							.webLink("AdvSearch").press
							 wait Wait7	
							 
							 .webElement("And_Filter").assertExist "True"
							If len(strAndDate)>9 then 
							.webElement("And_Filter").assertText  "and ="& mid(strAndDate,1,10) &".." &"   X"
							
							Else
							.webElement("And_Filter").assertText  "and ="& strAndDate &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
						
							
							.webTable("PreferredData_RD").assertValue strAndDate1,1
							.webTable("PreferredData_RD").assertDelValue strBetweenDate1
							
							.webLink("ClearAll").press
							wait Wait5
							.webTable("PreferredData_RD").assertValue strBetweenDate1,1
							.webElement("Between_Filter").assertExist "False"
							
							
							
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateViewDate ", "REP_RDR_TC_038"