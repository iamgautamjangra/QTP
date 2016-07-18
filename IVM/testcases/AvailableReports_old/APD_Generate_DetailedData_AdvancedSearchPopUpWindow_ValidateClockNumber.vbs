'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateClockNumber
' Description					:	Validate the Clock Number filter using advanced search.
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateClockNumber", "REP_APD_TC_030"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strClockNumberInv=testcasedata.getvalue("strClockNumberInv")
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
							end if
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait10
							'.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							'.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							wait Wait2
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

							.webEdit("ClockNumber_Adv").setValue strClockNumber

							.webLink("AdvSearch").press
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,8) &".." &"   X"

							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"

							End If
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"

							.webTable("DetailedData_APD").assertExist "True"


							.webTable("DetailedData_APD").assertValue strClockNumber,"4"
							wait Wait5	
							REM .webTable("DetailedData_APD").assertDelValue strClockNumber1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ClockNumber_Filter").assertExist "False"
							
							.webTable("DetailedData_APD").assertValue strClockNumber1,"4"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ClockNumber_Adv").setValue strClockNumberInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
														
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumberInv)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumberInv,1,8) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumberInv &"   X"
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_APD").assertExist "True"
						
							.webTable("DetailedData_APD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_APD").assertDelValue strClockNumber
							.webTable("DetailedData_APD").assertDelValue strClockNumber1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ClockNumber_Filter").assertExist "False"
													
							.webTable("DetailedData_APD").assertValue strClockNumber,"4"
							
							.webTable("DetailedData_APD").assertValue strClockNumber1,"4"
							
							.webTable("DetailedData_APD").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateClockNumber", "REP_APD_TC_030"