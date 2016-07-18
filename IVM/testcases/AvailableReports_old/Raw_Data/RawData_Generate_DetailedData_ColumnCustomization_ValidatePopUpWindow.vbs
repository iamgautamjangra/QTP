'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_RDR_TC_044"


DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


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
							.webTable("DetailedData_RD_Header").pressColumnCustomization 
							wait 3
							
							.webedit("CustomizeSearch").assertExist "True"
					        .webedit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DisplayedColumns").assertExist "True"
							.webElement("DisplayedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
							
							.webElement("NoColumnsToDisplay").assertExist "True"
							.webElement("NoColumnsToDisplay").assertStatus "Visible"
							
							.assertExistWE "Bind GUID","True"
							.assertExistWE "Device Id","True"
							.assertExistWE "View Date","True"
							.assertExistWE "Placement Asset Type","True"
							.assertExistWE "Placement View Type Unknown","True"
							.assertExistWE "Placement View Type Full","True"
							.assertExistWE "Placement View Type Partial","True"
							.assertExistWE "Placement View Type Fast Forward","True"
							.assertExistWE "Placement Play Time","True"
							.assertExistWE "Placement Fast Forwards","True"
							.assertExistWE "Placement Rewind","True"
							.assertExistWE "Placement Pauses","True"
							.assertExistWE "Placement Not Viewed","True"
							.assertExistWE "Break Number","True"
							.assertExistWE "Slot Position","True"
							.assertExistWE "Ad PID","True"
							.assertExistWE "Ad PAID","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "Ad Impression Limit","True"
							.assertExistWE "Ad Duration","True"
							.assertExistWE "Region ID","True"
							.assertExistWE "Region Name","True"
							.assertExistWE "Region Group Name","True"
							.assertExistWE "Campaign ID","True"
							.assertExistWE "Campaign Start Date","True"
							.assertExistWE "Campaign End Date","True"
							.assertExistWE "Element Number","True"
							.assertExistWE "Campaign Name","True"
							.assertExistWE "Clock Number","True"
							.assertExistWE "Campaign Impression Limit","True"
							.assertExistWE "Client ID","True"
							.assertExistWE "Client Name","True"
							.assertExistWE "Program PID","True"
							.assertExistWE "Channel","True"
							.assertExistWE "Prog Title","True"
							.assertExistWE "Prog Series Title","True"
							.assertExistWE "Prog Episode Title","True"
					
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						   
							.webCheckBox("BindGUID").assertExist "True"
							.webCheckBox("BindGUID").assertStatus "Visible"										
							.webCheckBox("BindGUID").assertStatus "Checked"
							
							
							.webCheckBox("ViewDate").assertExist "True"					
							.webCheckBox("ViewDate").assertStatus "Visible"
							.webCheckBox("ViewDate").assertStatus "Checked"
							.webCheckBox("ViewDate").assertStatus "Disabled"
							
							
							.webCheckBox("DeviceId").assertExist "True"
							.webCheckBox("DeviceId").assertStatus "Visible"										
							.webCheckBox("DeviceId").assertStatus "Checked"
							.webCheckBox("DeviceId").assertStatus "Disabled"
							
							
							.webCheckBox("PlacementAssetType").assertExist "True"					
							.webCheckBox("PlacementAssetType").assertStatus "Visible"
							.webCheckBox("PlacementAssetType").assertStatus "Checked"
							
							
							.webCheckBox("PlacementViewTypeUnknown").assertExist "True"
							.webCheckBox("PlacementViewTypeUnknown").assertStatus "Visible"										
							.webCheckBox("PlacementViewTypeUnknown").assertStatus "Checked"
							
							
							.webCheckBox("PlacementViewTypeFull").assertExist "True"					
							.webCheckBox("PlacementViewTypeFull").assertStatus "Visible"
							.webCheckBox("PlacementViewTypeFull").assertStatus "Checked"
							
							
							.webCheckBox("PlacementViewTypePartial").assertExist "True"					
							.webCheckBox("PlacementViewTypePartial").assertStatus "Visible"
							.webCheckBox("PlacementViewTypePartial").assertStatus "Checked"
							
						
							.webCheckBox("PlacementViewTypeFastForward").assertExist "True"					
							.webCheckBox("PlacementViewTypeFastForward").assertStatus "Visible"
							.webCheckBox("PlacementViewTypeFastForward").assertStatus "Checked"
							
						
							.webCheckBox("PlacementPlayTime").assertExist "True"					
							.webCheckBox("PlacementPlayTime").assertStatus "Visible"
							.webCheckBox("PlacementPlayTime").assertStatus "Checked"
							
							
							.webCheckBox("PlacementFastForwards").assertExist "True"					
							.webCheckBox("PlacementFastForwards").assertStatus "Visible"
							.webCheckBox("PlacementFastForwards").assertStatus "Checked"
							
							
							.webCheckBox("PlacementRewinds").assertExist "True"					
							.webCheckBox("PlacementRewinds").assertStatus "Visible"
							.webCheckBox("PlacementRewinds").assertStatus "Checked"
							
						
							.webCheckBox("PlacementPauses").assertExist "True"					
							.webCheckBox("PlacementPauses").assertStatus "Visible"
							.webCheckBox("PlacementPauses").assertStatus "Checked"
							
							
							.webCheckBox("PlacementNotViewed").assertExist "True"					
							.webCheckBox("PlacementNotViewed").assertStatus "Visible"
							.webCheckBox("PlacementNotViewed").assertStatus "Checked"
							
							
							.webCheckBox("BreakNumber").assertExist "True"
							.webCheckBox("BreakNumber").assertStatus "Visible"										
							.webCheckBox("BreakNumber").assertStatus "Checked"
											
							
							.webCheckBox("SlotPosition").assertExist "True"
							.webCheckBox("SlotPosition").assertStatus "Visible"										
							.webCheckBox("SlotPosition").assertStatus "Checked"
							
							
							.webCheckBox("AdPID").assertExist "True"
							.webCheckBox("AdPID").assertStatus "Visible"										
							.webCheckBox("AdPID").assertStatus "Checked"
							
							
							.webCheckBox("AdPAID").assertExist "True"
							.webCheckBox("AdPAID").assertStatus "Visible"										
							.webCheckBox("AdPAID").assertStatus "Checked"
							
							
							.webCheckBox("AdTitle").assertExist "True"
							.webCheckBox("AdTitle").assertStatus "Visible"										
							.webCheckBox("AdTitle").assertStatus "Checked"
							
							
							
							.webCheckBox("AdImpressionLimit").assertExist "True"
							.webCheckBox("AdImpressionLimit").assertStatus "Visible"										
							.webCheckBox("AdImpressionLimit").assertStatus "Checked"
							
							
							.webCheckBox("AdDuration").assertExist "True"
							.webCheckBox("AdDuration").assertStatus "Visible"										
							.webCheckBox("AdDuration").assertStatus "Checked"
							
						
							.webCheckBox("RegionId").assertExist "True"
							.webCheckBox("RegionId").assertStatus "Visible"										
							.webCheckBox("RegionId").assertStatus "Checked"
							
							
						
							.webCheckBox("RegionName").assertExist "True"
							.webCheckBox("RegionName").assertStatus "Visible"										
							.webCheckBox("RegionName").assertStatus "Checked"
							
							
							
							
							.webCheckBox("RegionGroupName").assertExist "True"
							.webCheckBox("RegionGroupName").assertStatus "Visible"										
							.webCheckBox("RegionGroupName").assertStatus "Checked"
							
							
							
							.webCheckBox("CampaignID").assertExist "True"
							.webCheckBox("CampaignID").assertStatus "Visible"										
							.webCheckBox("CampaignID").assertStatus "Checked"
							
						
							.webCheckBox("CampaignStartDate").assertExist "True"
							.webCheckBox("CampaignStartDate").assertStatus "Visible"										
							.webCheckBox("CampaignStartDate").assertStatus "Checked"
						
							.webCheckBox("CampaignEndDate").assertExist "True"
							.webCheckBox("CampaignEndDate").assertStatus "Visible"										
							.webCheckBox("CampaignEndDate").assertStatus "Checked"
							
							
							
							.webCheckBox("ElementNumber").assertExist "True"
							.webCheckBox("ElementNumber").assertStatus "Visible"										
							.webCheckBox("ElementNumber").assertStatus "Checked"
							.webCheckBox("ElementNumber").assertStatus "Disabled"
							
							
							
							.webCheckBox("CampaignName").assertExist "True"
							.webCheckBox("CampaignName").assertStatus "Visible"										
							.webCheckBox("CampaignName").assertStatus "Checked"
							
							
							.webCheckBox("ClockNumber").assertExist "True"
							.webCheckBox("ClockNumber").assertStatus "Visible"										
							.webCheckBox("ClockNumber").assertStatus "Checked"
							.webCheckBox("ClockNumber").assertStatus "Disabled"
							
							
							.webCheckBox("CampaignImpressionLimit").assertExist "True"
							.webCheckBox("CampaignImpressionLimit").assertStatus "Visible"										
							.webCheckBox("CampaignImpressionLimit").assertStatus "Checked"
							
							
							.webCheckBox("ClientId").assertExist "True"
							.webCheckBox("ClientId").assertStatus "Visible"										
							.webCheckBox("ClientId").assertStatus "Checked"
							
							
							
							.webCheckBox("ClientName").assertExist "True"
							.webCheckBox("ClientName").assertStatus "Visible"										
							.webCheckBox("ClientName").assertStatus "Checked"
																					
						
							.webCheckBox("ProgramPID").assertExist "True"
							.webCheckBox("ProgramPID").assertStatus "Visible"										
							.webCheckBox("ProgramPID").assertStatus "Checked"
							
							
							.webCheckBox("ProgPAID").assertExist "True"
							.webCheckBox("ProgPAID").assertStatus "Visible"										
							.webCheckBox("ProgPAID").assertStatus "Checked"
							
							
							
							.webCheckBox("Channel").assertExist "True"
							.webCheckBox("Channel").assertStatus "Visible"										
							.webCheckBox("Channel").assertStatus "Checked"
							.webCheckBox("ClockNumber").assertStatus "Disabled"
							
							
							.webCheckBox("BreakNumber").assertExist "True"
							.webCheckBox("BreakNumber").assertStatus "Visible"										
							.webCheckBox("BreakNumber").assertStatus "Checked"
							
							
							
							.webCheckBox("ProgSeriesTitle").assertExist "True"
							.webCheckBox("ProgSeriesTitle").assertStatus "Visible"										
							.webCheckBox("ProgSeriesTitle").assertStatus "Checked"
							
						
							.webCheckBox("ProgEpisodeTitle").assertExist "True"
							.webCheckBox("ProgEpisodeTitle").assertStatus "Visible"										
							.webCheckBox("ProgEpisodeTitle").assertStatus "Checked"
							
							
							
							.webCheckBox("ProgGenre").assertExist "True"
							.webCheckBox("ProgGenre").assertStatus "Visible"										
							.webCheckBox("ProgGenre").assertStatus "Checked"
							
							
							
							
							
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
						
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_RDR_TC_044"