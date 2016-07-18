'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RDR_TC_025"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPid=testcasedata.getvalue("strProgramPid")
strProgramPid1=testcasedata.getvalue("strProgramPid1")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strDeviceId=testcasedata.getvalue("strDeviceId")
strDeviceId1=testcasedata.getvalue("strDeviceId1")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")
strBetweenDate1=testcasedata.getvalue("strBetweenDate1")
strAndDate1=testcasedata.getvalue("strAndDate1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10
 
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							'.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							'.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
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
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 5
							
					        .webEdit("DeviceId_Adv").setValue strDeviceId
							
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							wait 2
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.webEdit("Channel_Adv").setValue strChannel
						
					        .selectDate "BetweenDate",strBetweenDate
							wait 2
							.selectDate "AndDate",strAndDate
							wait 2
							 
							
					        .webLink("AdvCancel").press
						
						wait 5
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("DeviceId_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("Channel_Filter").assertExist "False"
							
							.webTable("PreferredData_RD").assertValue strProgramPid1,"9"
							.webTable("PreferredData_RD").assertValue strDeviceId1,"2"
							.webTable("PreferredData_RD").assertValue strElementNumber1,"7"
							.webTable("PreferredData_RD").assertValue strClockNumber1,"8"
							.webTable("PreferredData_RD").assertValue strChannel1,"10"
							.webTable("PreferredData_RD").assertValue strBetweenDate1,"10"
							.webTable("PreferredData_RD").assertValue strEndDate1,"10"
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RDR_TC_025"