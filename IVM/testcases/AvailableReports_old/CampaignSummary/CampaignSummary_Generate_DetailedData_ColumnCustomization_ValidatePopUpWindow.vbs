'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the customized column popup on the Detailed data tab of the "Campaign Summary" Report.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_053"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
				         wait 5	
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5 
						 
					    .webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").press
						wait 5

						.selectDate reportCampaignSummary,"StartDate",START_DATE

						.selectDate reportCampaignSummary,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						.webList("Grouping").selectItem strGrouping
						wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						 wait 10
						
End With

With ivm.page(reportgen_page)						
							
							
							.webLink("DetailedData").press
							wait 3
							
							.webTable("DetailedData_CS").assertExist "True"
							.webTable("DetailedData_CS").pressColumnCustomization 
							wait 3
							
							.webedit("CustomizeSearch").assertExist "True"
					        .webedit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DispalyedColumns").assertExist "True"
							.webElement("DispalyedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
					
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						    .webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.webCheckBox("TimeRange").assertExist "True"
							.webCheckBox("TimeRange").assertStatus "Visible"										
							.webCheckBox("TimeRange").assertStatus "Checked"
							.webCheckBox("TimeRange").assertStatus "Disable"
							
							.webElement("ElementNumber").assertExist "True"
							.webElement("ElementNumber").assertStatus "Visible"
							.webCheckBox("ElementNumber").assertExist "True"					
							.webCheckBox("ElementNumber").assertStatus "Visible"
							.webCheckBox("ElementNumber").assertStatus "Checked"
							.webCheckBox("ElementNumber").assertStatus "Disable"
							
							.webElement("CampaignName").assertExist "True"
							.webElement("CampaignName").assertStatus "Visible"
							.webCheckBox("CampaignName").assertExist "True"
							.webCheckBox("CampaignName").assertStatus "Visible"										
							.webCheckBox("CampaignName").assertStatus "Checked"
							.webCheckBox("CampaignName").assertStatus "Disable"
							
							.webElement("ClockNumber").assertExist "True"
							.webElement("ClockNumber").assertStatus "Visible"
							.webCheckBox("ClockNumber").assertExist "True"					
							.webCheckBox("ClockNumber").assertStatus "Visible"
							.webCheckBox("ClockNumber").assertStatus "Checked"
							
							.webElement("ProgramPID").assertExist "True"
							.webElement("ProgramPID").assertStatus "Visible"
							.webCheckBox("ProgramPID").assertExist "True"
							.webCheckBox("ProgramPID").assertStatus "Visible"										
							.webCheckBox("ProgramPID").assertStatus "Checked"
							.webCheckBox("ProgramPID").assertStatus "Disable"
							
							.webElement("UniqueCustomers").assertExist "True"
							.webElement("UniqueCustomers").assertStatus "Visible"
							.webCheckBox("UniqueCustomers").assertExist "True"					
							.webCheckBox("UniqueCustomers").assertStatus "Visible"
							.webCheckBox("UniqueCustomers").assertStatus "Checked"
							
							.webElement("AdvertPlacements").assertExist "True"
							.webElement("AdvertPlacements").assertStatus "Visible"
							.webCheckBox("AdvertPlacements").assertExist "True"					
							.webCheckBox("AdvertPlacements").assertStatus "Visible"
							.webCheckBox("AdvertPlacements").assertStatus "Checked"
							
							.webElement("AdvertFullViews").assertExist "True"
							.webElement("AdvertFullViews").assertStatus "Visible"
							.webCheckBox("AdvertFullViews").assertExist "True"					
							.webCheckBox("AdvertFullViews").assertStatus "Visible"
							.webCheckBox("AdvertFullViews").assertStatus "Checked"
							
							.webElement("AdvertPartialViews").assertExist "True"
							.webElement("AdvertPartialViews").assertStatus "Visible"
							.webCheckBox("AdvertPartialViews").assertExist "True"					
							.webCheckBox("AdvertPartialViews").assertStatus "Visible"
							.webCheckBox("AdvertPartialViews").assertStatus "Checked"
							
							.webElement("AdvertFastForwardViews").assertExist "True"
							.webElement("AdvertFastForwardViews").assertStatus "Visible"
							.webCheckBox("AdvertFastForwardViews").assertExist "True"					
							.webCheckBox("AdvertFastForwardViews").assertStatus "Visible"
							.webCheckBox("AdvertFastForwardViews").assertStatus "Checked"
							
							.webElement("AdvertPlacementsNotViewed").assertExist "True"
							.webElement("AdvertPlacementsNotViewed").assertStatus "Visible"
							.webCheckBox("AdvertPlacementsNotViewed").assertExist "True"					
							.webCheckBox("AdvertPlacementsNotViewed").assertStatus "Visible"
							.webCheckBox("AdvertPlacementsNotViewed").assertStatus "Checked"
							
							.webElement("TotalHomeViews").assertExist "True"
							.webElement("TotalHomeViews").assertStatus "Visible"
							.webCheckBox("TotalHomeViews").assertExist "True"					
							.webCheckBox("TotalHomeViews").assertStatus "Visible"
							.webCheckBox("TotalHomeViews").assertStatus "Checked"
							.webCheckBox("TotalHomeViews").assertStatus "Disable"
							
							.webElement("AdvertAveragePlayTime").assertExist "True"
							.webElement("AdvertAveragePlayTime").assertStatus "Visible"
							.webCheckBox("AdvertAveragePlayTime").assertExist "True"					
							.webCheckBox("AdvertAveragePlayTime").assertStatus "Visible"
							.webCheckBox("AdvertAveragePlayTime").assertStatus "Checked"
							
							.webElement("TotalAdViews").assertExist "True"
							.webElement("TotalAdViews").assertStatus "Visible"
							.webCheckBox("TotalAdViews").assertExist "True"
							.webCheckBox("TotalAdViews").assertStatus "Visible"										
							.webCheckBox("TotalAdViews").assertStatus "Checked"
						   
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
							wait 5
							
							.webLink("BackToPreviousPage").press
							wait 10
			
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_053"