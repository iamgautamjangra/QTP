'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel
' Description					:	Validate "Channel" text box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_PSR_TC_027"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strChannelInv=testcasedata.getvalue("strChannelInv")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("Channel_Adv").setValue strChannel
						   
							.webLink("AdvSearch").press
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannel)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannel,1,10) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannel &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_PS").assertExist "True"
							
						
							.webTable("PreferredData_PS").assertValue strChannel,"6"
							wait 5	
							.webTable("PreferredData_PS").assertDelValue strChannel1
							.webLink("ClearAll").press
							wait 5
							.webElement("Channel_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("PreferredData_PS").assertValue strChannel1,"6"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("Channel_Adv").setValue strChannelInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannelInv)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannelInv,1,10) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannelInv &"   X"
							End If
							
							.webElement("Channel_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_PS").assertExist "True"
						
							.webTable("PreferredData_PS").searchData NoRecordFound_msg
							
							.webTable("PreferredData_PS").assertDelValue strChannel
							.webTable("PreferredData_PS").assertDelValue strChannel1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("Channel_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("PreferredData_PS").assertValue strChannel,"6"
							
							.webTable("PreferredData_PS").assertValue strChannel1,"6"
							
							.webTable("PreferredData_PS").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_PSR_TC_027"