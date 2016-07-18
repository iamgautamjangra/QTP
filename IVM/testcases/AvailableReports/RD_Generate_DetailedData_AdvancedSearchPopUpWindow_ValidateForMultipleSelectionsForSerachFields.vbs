'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RD_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachFields
' Description					:	Validate the multiple fileld search using advanced search
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RD_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachFields", "REP_RDR_TC_037"

'DataSet=testcasedata.getvalue("DataSet")
'strCampaign=testcasedata.getvalue("strCampaign")
'strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strBindGUID=testcasedata.getvalue("strBindGUID")
strBindGUID1=testcasedata.getvalue("strBindGUID1")
strDeviceId=testcasedata.getvalue("strDeviceId")
strDeviceId1=testcasedata.getvalue("strDeviceId1")
strAdPID=testcasedata.getvalue("strAdPID")
strAdPID1=testcasedata.getvalue("strAdPID1")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strRegionName=testcasedata.getvalue("strRegionName")
strRegionName1=testcasedata.getvalue("strRegionName1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPAID=testcasedata.getvalue("strProgramPAID")
strProgramPAID1=testcasedata.getvalue("strProgramPAID1")



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
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_RD").assertExist "True"
							
						   .webLink("AdvancedSearch").press
							wait Wait5
							.webEdit("BindGUID_Adv").setValue strBindGUID
							.webEdit("DeviceId_Adv").setValue strDeviceId
							.webEdit("AdPID_Adv").setValue strAdPID
							.webEdit("AdTitle_Adv").setValue strAdTitle
							.webEdit("RegionName_Adv").setValue strRegionName
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							
							strProgramPAID=testcasedata.getvalue("strProgramPAID")
							.webEdit("ProgramPAID_Adv").setValue strProgramPAID
							.webEdit("ProgramTitle_RD_Adv").setValue strProgramTitle
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
													
							.webElement("BindGUID_Filter").assertExist "True"
							If len(strBindGUID)>9 then 
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& mid(strBindGUID,1,10) &".." &"   X"
							
							Else
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& strBindGUID &"   X"
							
							End If
							
							.webElement("DeviceId_Filter").assertExist "True"
							If len(strDeviceId)>9 then 
							.webElement("DeviceId_Filter").assertText  "Device ID ="& mid(strDeviceId,1,10) &".." &"   X"
							
							Else
							.webElement("DeviceId_Filter").assertText  "Device ID ="& strDeviceId &"   X"
							
							End If
							
							.webElement("AdPID_Filter").assertExist "True"
							If len(strAdPID)>9 then 
							.webElement("AdPID_Filter").assertText  "Ad PID ="& mid(strAdPID,1,10) &".." &"   X"
							
							Else
							.webElement("AdPID_Filter").assertText  "Ad PID ="& strAdPID &"   X"
							
							End If
							
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitle)>9 then 
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& mid(strAdTitle,1,10) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Ad Title ="& strAdTitle &"   X"
							
							End If
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionName)>9 then 
							.webElement("RegionName_Filter").assertText  "Region Name ="& mid(strRegionName,1,10) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region Name ="& strRegionName &"   X"
							
							End If
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,10) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"
							
							End If
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitle)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitle,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitle &"   X"
							
							End If
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
							
							.webElement("ProgramPAID_Filter").assertExist "True"
							If len(strProgramPAID)>9 then 
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& mid(strProgramPAID,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& strProgramPAID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
													
							.webLink("ClearAll").press
							wait Wait5
							.webElement("BindGUID_Filter").assertExist "False"
							.webElement("DeviceId_Filter").assertExist "False"
							.webElement("AdPID_Filter").assertExist "False"
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("ProgramPAID_Filter").assertExist "False"
							.webElement("ProgramTitle_Filter").assertExist "False"
				       
							
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RD_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachFields", "REP_RDR_TC_037"