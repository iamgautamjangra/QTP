'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	PS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField
' Description					:	Validate the multipel search using advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "PS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_CSR_TC_031"

DataSet=testcasedata.getvalue("DataSet")
'strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
DataSet=DATASET_PROGRAMSUMMARY

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait5	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("ProgramTitle_Adv").setValue strProgramTitle
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("Channel_Adv").setValue strChannel
						   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitle)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitle,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitle &"   X"
							
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
							.webLink("ClearAll").press
							.webTable("PreferredData_PS").assertExist "True"
							
						
							REM .webTable("PreferredData_PS").assertValue strProgramPID,"3"
							.webTable("PreferredData_PS").assertValue strProgramTitle,"5"
							.webTable("PreferredData_PS").assertValue strTimeRange,"1"
							.webTable("PreferredData_PS").assertValue strCampaignName,"2"
							.webTable("PreferredData_PS").assertValue strChannel,"4"
							
							wait Wait5	
							.webTable("PreferredData_PS").assertDelValue strProgramPID1
							.webTable("PreferredData_PS").assertDelValue strProgramTitle1
							.webTable("PreferredData_PS").assertDelValue strTimeRange1
							.webTable("PreferredData_PS").assertDelValue strCampaignName1
							.webTable("PreferredData_PS").assertDelValue strChannel1
							
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("ProgramTitle_Filter").assertExist "False"
							.webElement("Channel_Filter").assertExist "False"
							
							
							REM .webTable("PreferredData_PS").assertValue strProgramPID1,"3"
							REM .webTable("PreferredData_PS").assertValue strProgramTitle1,"4"
							REM .webTable("PreferredData_PS").assertValue strTimeRange1,"1"
							REM .webTable("PreferredData_PS").assertValue strCampaignName1,"2"
							REM .webTable("PreferredData_PS").assertValue strChannel1,"6"
							
							

End with
			
'End Test Case

executionController.stopTestCase_w_TestCaseNumber "PS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_CSR_TC_031"