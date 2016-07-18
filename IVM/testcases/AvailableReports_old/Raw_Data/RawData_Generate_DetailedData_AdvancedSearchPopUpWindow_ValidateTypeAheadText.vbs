'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")


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

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RD").assertExist "True"
							
						   .webLink("AdvancedSearch").press
							wait 5
							
							  
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"							 
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName
                            wait 2
							.selectlistItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							wait 2
							strCampaignName1=testcasedata.getvalue("strCampaignName1")
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"False"
							 wait 3
							.webEdit("CampaignName_Adv").assertValue "Type to search..."
							 wait 3	
							 
							 .webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"							 
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."																							
							.webEdit("ProgramPID_Adv").setValue strProgramPID																								
							.assertListSearch MULTI_LIST_PROGRAMPID_ADV1,strProgramPID
                            wait 2	
							.selectlistItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"True"
							wait 2
							strProgramPID1=testcasedata.getvalue("strProgramPID1")
							.webEdit("ProgramPID_Adv").assertValue strProgramPID1
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"False"
							 wait 3
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."
							 wait 3	

							.webLink("AdvCancel").press							  
							
End with

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"