'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UIControls of advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_RSR_TC_024"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
With ivm.page(PreferredData_page)	

							.webLink("PreferredData").press
							wait 5
							
							.webLink("AdvancedSearch").press
							wait 3
							
							.webElement("SearchTerm_Adv").assertExist "True"
							.webElement("SearchTerm_Adv").assertStatus "Visible"
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "Visible"
																	
														
							.webElement("CampaignName_Adv").assertExist "True"
							.webElement("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							
							.webElement("ElementNumber_Adv").assertExist "True"
							.webElement("ElementNumber_Adv").assertStatus "Visible"
							.webEdit("ElementNumber_Adv").assertExist "True"
							.webEdit("ElementNumber_Adv").assertStatus "Visible"
							
							
							.webElement("RegionName_Adv").assertExist "True"
							.webElement("RegionName_Adv").assertStatus "Visible"
							.webEdit("RegionName_Adv").assertExist "True"
							.webEdit("RegionName_Adv").assertStatus "Visible"
							
							.webElement("Timerange_Adv").assertExist "True"
							.webElement("Timerange_Adv").assertStatus "Visible"
							.webEdit("Timerange_Adv").assertExist "True"
							.webEdit("Timerange_Adv").assertStatus "Visible"
							
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							
End With

		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_RSR_TC_024"