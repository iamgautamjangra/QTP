'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ScheduledBreaksReport_ChannelColumnCustomizationWindow_ValidateControls
' Description					:	Validate customize column window is open and validate controls.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_ValidateControls", "REP_SBR_TC_065"


ism.ClickToMenu MENU_AVAILABLE_REPORTS

StartDateValue=REPORT_START_DATE1
EndDateValue=REPORT_END_DATE1
Regions_val=testcasedata.getvalue("Regions_val")
Markets_val=testcasedata.getvalue("Markets_val")
Zones_val=testcasedata.getvalue("Zones_val")
Networks_val=testcasedata.getvalue("Networks_val")
InterConnect_val=testcasedata.getvalue("InterConnect_val")
Comments_val=testcasedata.getvalue("Comments_val")

'Filling data and press Generate button
with ism.page(report_page)
wait Wait10
						.webTable("AvailableReports").presstblLink reportScheduledBreaks,3
						wait Wait10
						
					      If StartDateValue <> "" then                                                                                        
			.selectDate reportScheduledBreaks,"StartDate",StartDateValue
			End if
			 If EndDateValue <> "" then
		 .selectDate reportScheduledBreaks,"EndDate",EndDateValue		
		 End if
		  wait Wait5
						
					
						.selectListItem MULTI_LIST_REGION,Regions_val,"True"						
						wait Wait3

						.selectListItem MULTI_LIST_MARKETS,Markets_val,"True"
						wait Wait3

						.selectListItem MULTI_LIST_ZONES,Zones_val,"True"
                         wait Wait3						
						
						.selectListItem MULTI_LIST_NETWORKS,Networks_val,"True"
						wait Wait3
						
						.selectListItem MULTI_LIST_INTERCONNECTS,InterConnect_val,"True"
						wait Wait3
						
						
						
						.webEdit("Comments").setValue Comments_val
						wait Wait3

wait Wait2
					.webbutton("Generate").press
					wait Wait3

End with
wait Wait10
'Assert generated report page


with ism.page(reportgen_page)
wait Wait3				
						.webLink("Channels").press
						.webTable("ChannelsDetails").assertExist "True"																		
						.webTable("ChannelsDetails_header").assertExist "True"
						
					
						
						.webTable("ChannelsDetails_header_SB").pressSBColumnCustomization
						wait Wait5
					
					
					.webedit("Search").assertExist "True"
					.webedit("Search").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

				    .webElement("DisplayedColumns").assertExist "True"
					.webElement("DisplayedColumns").assertStatus "Visible"

					.webElement("AvailableColumns").assertExist "True"
					.webElement("AvailableColumns").assertStatus "Visible"
					
'---------------Assert Checkbox under Displayed columns----------------------------------------
                    .webElement("ChannelName").assertExist "True"
					.webElement("ChannelName").assertStatus "Visible"
                    .webCheckBox("ChannelName").assertExist "True"
					.webCheckBox("ChannelName").assertStatus "Visible"										
					.webCheckBox("ChannelName").assertStatus "Checked"
																																																
					.webElement("InConflict").assertExist "True"
					.webElement("InConflict").assertStatus "Visible"													
					.webCheckBox("InConflict").assertExist "True"				
					.webCheckBox("InConflict").assertStatus "Visible"
					.webCheckBox("InConflict").assertStatus "Checked"
										
					.webElement("LocalBreakCountScheduled").assertExist "True"
					.webElement("LocalBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("LocalBreakCountScheduled").assertExist "True"					
					.webCheckBox("LocalBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("LocalBreakCountScheduled").assertStatus "Checked"
										
					.webElement("LocalBreakCountExpected").assertExist "True"
					.webElement("LocalBreakCountExpected").assertStatus "Visible"
					.webCheckBox("LocalBreakCountExpected").assertExist "True"					
					.webCheckBox("LocalBreakCountExpected").assertStatus "Visible"
					.webCheckBox("LocalBreakCountExpected").assertStatus "Checked"
										
					.webElement("LocalBreakCountDifference").assertExist "True"
					.webElement("LocalBreakCountDifference").assertStatus "Visible"
					.webCheckBox("LocalBreakCountDifference").assertExist "True"					
					.webCheckBox("LocalBreakCountDifference").assertStatus "Visible"
					.webCheckBox("LocalBreakCountDifference").assertStatus "Checked"					
					
					.webElement("InterconnectBreakCountScheduled").assertExist "True"
					.webElement("InterconnectBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountScheduled").assertExist "True"					
					.webCheckBox("InterconnectBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountScheduled").assertStatus "Checked"
										
					.webElement("InterconnectBreakCountExpected").assertExist "True"
					.webElement("InterconnectBreakCountExpected").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountExpected").assertExist "True"					
					.webCheckBox("InterconnectBreakCountExpected").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountExpected").assertStatus "Checked"
																																						
					.webElement("InterconnectBreakCountDifference").assertExist "True"
					.webElement("InterconnectBreakCountDifference").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountDifference").assertExist "True"					
					.webCheckBox("InterconnectBreakCountDifference").assertStatus "Visible"
					.webCheckBox("InterconnectBreakCountDifference").assertStatus "Checked"
					
					.webElement("TotalBreakCountScheduled").assertExist "True"
					.webElement("TotalBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("TotalBreakCountScheduled").assertExist "True"					
					.webCheckBox("TotalBreakCountScheduled").assertStatus "Visible"
					.webCheckBox("TotalBreakCountScheduled").assertStatus "Checked"
					
					.webElement("TotalBreakCountExpected").assertExist "True"
					.webElement("TotalBreakCountExpected").assertStatus "Visible"
					.webCheckBox("TotalBreakCountExpected").assertExist "True"					
					.webCheckBox("TotalBreakCountExpected").assertStatus "Visible"
					.webCheckBox("TotalBreakCountExpected").assertStatus "Checked"
					
					.webElement("TotalBreakCountDifference").assertExist "True"
					.webElement("TotalBreakCountDifference").assertStatus "Visible"
					.webCheckBox("TotalBreakCountDifference").assertExist "True"					
					.webCheckBox("TotalBreakCountDifference").assertStatus "Visible"
					.webCheckBox("TotalBreakCountDifference").assertStatus "Checked"
					
REM '---------------Assert Checkbox under Available columns----------------------------------------

REM wait Wait2
                    .webElement("LatestDateLocalScheduleReceived").assertExist "True"
					.webElement("LatestDateLocalScheduleReceived").assertStatus "Visible"
					.webCheckBox("LatestDateLocalScheduleReceived").assertExist "True"					
					.webCheckBox("LatestDateLocalScheduleReceived").assertStatus "Visible"
					.webCheckBox("LatestDateLocalScheduleReceived").assertStatus "UnChecked"
wait Wait2					
					
					.webElement("LatestDateInterconnectScheduleReceived").assertExist "True"
					.webElement("LatestDateInterconnectScheduleReceived").assertStatus "Visible"
					.webCheckBox("LatestDateInterconnectScheduleReceived").assertExist "True"					
					.webCheckBox("LatestDateInterconnectScheduleReceived").assertStatus "Visible"
					.webCheckBox("LatestDateInterconnectScheduleReceived").assertStatus "UnChecked"

					
'---------------Assert webbutton generate------------------------------------------------

					.webLink("CustomizeApply").assertExist "True"

					.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

					.webLink("CustomizeCancel").assertExist "True"

					.webLink("CustomizeCancel").assertStatus "Visible"
					
					.webLink("CustomizeCancel").press
					
					wait Wait5
					.webLink("BackToPreviousPage").press
					
End with

with ism.page(report_page)
					
					wait Wait5
					.webButton("Cancel").press
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_ValidateControls", "REP_SBR_TC_065"