'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle", "REP_APD_TC_044"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strAdTitleInv=testcasedata.getvalue("strAdTitleInv")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADPROGRAMDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
						 wait Wait10	
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
						.webTable("DataSet").presstblRadioBtn DataSet,1
	
							wait Wait10
						
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
							
							.webTable("DetailedData_AD").assertExist "True"
							
						
							.webTable("DetailedData_AD").assertValue strAdTitle,"16"
							wait Wait5	
							.webTable("DetailedData_AD").assertDelValue strAdTitle1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("AdTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_AD").assertValue strAdTitle1,"16"
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
							
							.webTable("DetailedData_AD").assertExist "True"
						
							.webTable("DetailedData_AD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_AD").assertDelValue strAdTitle
							.webTable("DetailedData_AD").assertDelValue strAdTitle1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("AdTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_AD").assertValue strAdTitle,"16"
							
							.webTable("DetailedData_AD").assertValue strAdTitle1,"16"
							
							.webTable("DetailedData_AD").assertDelValue NoRecordFound_msg		
End with			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle", "REP_APD_TC_044"