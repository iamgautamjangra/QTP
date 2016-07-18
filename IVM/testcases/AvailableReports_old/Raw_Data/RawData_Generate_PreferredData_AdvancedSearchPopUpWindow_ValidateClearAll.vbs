'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_026"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPid=testcasedata.getvalue("strProgramPid")
strChannel=testcasedata.getvalue("strChannel")
strElementNumber=testcasedata.getvalue("strElementNumber")
strClockNumber=testcasedata.getvalue("strClockNumber")
strDeviceId=testcasedata.getvalue("strDeviceId")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")

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
								
						.webLink("AdvClearAll").press
						wait 2
						
						.webEdit("DeviceId_Adv").assertValue ""
						
					
						.webEdit("ElementNumber_Adv").assertValue ""
						
						.webEdit("ProgramPID_Adv").assertValue "Type to search..."
						.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPID,"False"
						wait 3
						.webEdit("ClockNumber_Adv").assertValue ""
						
						.webEdit("Channel_Adv").assertValue ""
						
						.webEdit("Between").assertValue "yyyy-mm-dd"
						
						.webEdit("And").assertValue "yyyy-mm-dd"
						
						
						.webLink("AdvCancel").press
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_026"