'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle
' Description					:	Validate the element number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_APD_TC_028"


DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strProgramTitleInv=testcasedata.getvalue("strProgramTitleInv")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADPROGRAMDETAILS
with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							wait Wait5	
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3

							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							wait 1
							.webLink("AdvSearch").press
							wait Wait3
							End If
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait5

							.webEdit("EmailRecipients").setValue strEmail

							.webEdit("StorageLocation").setValue strStorageLocation

							.webList("ReportFormat").selectItem strReportFormat

							.webList("DataType").selectItem strDataType

							.webEdit("Comments").setValue strComments
							.webButton("Generate").press
							wait Wait10
						
End with	

With ivm.page(DetailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							
							.webEdit("ProgramTitle_APD_Adv").setValue strProgramTitle
						   
							.webLink("AdvSearch").press
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitle)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitle,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_APD").assertExist "True"
							
						
							.webTable("DetailedData_APD").assertValue strProgramTitle,"9"
							wait Wait5	
							REM .webTable("DetailedData_APD").assertDelValue strProgramTitle1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_APD").assertValue strProgramTitle1,"9"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramTitle_APD_Adv").setValue strProgramTitleInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitleInv)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitleInv,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitleInv &"   X"
							End If
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_APD").assertExist "True"
						
							.webTable("DetailedData_APD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_APD").assertDelValue strProgramTitle
							.webTable("DetailedData_APD").assertDelValue strProgramTitle1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ProgramTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							 .webTable("DetailedData_APD").assertValue strProgramTitle1,"9"
							
							.webTable("DetailedData_APD").assertDelValue NoRecordFound_msg
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_APD_TC_028"