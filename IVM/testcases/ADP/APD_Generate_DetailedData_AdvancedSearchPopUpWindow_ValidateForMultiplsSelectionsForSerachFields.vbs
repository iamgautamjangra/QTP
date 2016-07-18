'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_APD_TC_037"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
DataSet=DATASET_ADPROGRAMDETAILS
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

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
							End If
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
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"				
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							.webEdit("Channel_Adv").setValue strChannel
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							.webEdit("ProgramTitle_Adv").setValue strProgramTitle
							.webEdit("AdTitle_Adv").setValue strAdTitle

													   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitle)>9 then 
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& mid(strAdTitle,1,8) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Ad Titles ="& strAdTitle &"   X"
							
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"
							
							End If
							
							
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannel)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannel,1,8) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannel &"   X"
							
							End If
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitle)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitle,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitle &"   X"
							
							End If
							
							.webElement("TimeRange_Filter").assertExist "True"
							If len(strTimeRange)>9 then 
							.webElement("TimeRange_Filter").assertText  "Time Range ="& mid(strTimeRange,1,8) &".." &"   X"
							
							Else
							.webElement("TimeRange_Filter").assertText  "Time Range ="& strTimeRange &"   X"
							
							End If
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_APD").assertExist "True"
							
						
							REM .webTable("DetailedData_APD").assertValue strProgramPID,"6"
							.webTable("DetailedData_APD").assertValue strElementNumber,"2"
							.webTable("DetailedData_APD").assertValue strTimeRange,"1"
							.webTable("DetailedData_APD").assertValue strChannel,"8"
							.webTable("DetailedData_APD").assertValue strProgramTitle,"9"
							.webTable("DetailedData_APD").assertValue strCampaignName,"3"
							.webTable("DetailedData_APD").assertValue strClockNumber,"4"
							.webTable("DetailedData_APD").assertValue strAdTitle,"16"
							
								
							REM .webTable("DetailedData_APD").assertDelValue strProgramPID1
							REM .webTable("DetailedData_APD").assertDelValue strChannel1
							REM .webTable("DetailedData_APD").assertDelValue strProgramTitle1
							REM .webTable("DetailedData_APD").assertDelValue strElementNumber1
							.webTable("DetailedData_APD").assertDelValue strTimeRange1
							.webTable("DetailedData_APD").assertDelValue strCampaignName1
							REM .webTable("DetailedData_APD").assertDelValue strAdTitle1
							REM .webTable("DetailedData_APD").assertDelValue strClockNumber1
							
							.webLink("ClearAll").press
							wait Wait7
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("Channel_Filter").assertExist "False"
							.webElement("ProgramTitle_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							
							
							.webTable("DetailedData_APD").assertValue strProgramPID1,"6"
							REM .webTable("DetailedData_APD").assertValue strElementNumber1,"2"
							.webTable("DetailedData_APD").assertValue strTimeRange1,"1"
							.webTable("DetailedData_APD").assertValue strChannel1,"8"
							.webTable("DetailedData_APD").assertValue strProgramTitle1,"9"
							.webTable("DetailedData_APD").assertValue strCampaignName1,"3"
							.webTable("DetailedData_APD").assertValue strClockNumber1,"4"
							.webTable("DetailedData_APD").assertValue strAdTitle1,"16"
							

End with
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_APD_TC_037"