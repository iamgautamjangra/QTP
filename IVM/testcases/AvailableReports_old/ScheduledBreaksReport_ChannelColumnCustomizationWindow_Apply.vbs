'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduledBreaksReport_ChannelColumnCustomizationWindow_Apply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added.
' Author 						:   SeaChange
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_Apply", "REP_SBR_TC_068"

ism.ClickToMenu MENU_AVAILABLE_REPORTS

StartDateValue=testcasedata.getvalue("StartDateValue")
EndDateValue=testcasedata.getvalue("EndDateValue")
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
                    
						.webLink("Channels").press
						.webTable("ChannelsDetails").assertExist "True"																		
						.webTable("ChannelsDetails_header_SB").assertExist "True"
						.webTable("ChannelsDetails_header_SB").pressSBColumnCustomization
						wait Wait5
					
					
					
'for Displayed columns							
							
						.selectCustomizeColumn "Channel Name","False"
						.selectCustomizeColumn "In Conflict?","False"
														
							
'for Available columns							
						.selectCustomizeColumn "Latest Date Local Schedule Received","True"						
						.selectCustomizeColumn "Latest Date Interconnect Schedule Received","True"
																																						
							
'validate selected columns in ScheduleFiles table							
							
							
						.webLink("CustomizeApply").press
						 wait 15
						.webTable("ChannelsDetails").assertExist "True"
REM 'Displayed columns							
						.webTable("ChannelsDetails_header_SB").assertCustomizeColumnExist "Channel Name","False"
						.webTable("ChannelsDetails_header_SB").assertCustomizeColumnExist "In Conflict?","False"
						
						
'Available columns							
						.webTable("ChannelsDetails_header_SB").assertCustomizeColumnExist "Latest Date Local Schedule Received","True"
						.webTable("ChannelsDetails_header_SB").assertCustomizeColumnExist "Latest Date Interconnect Schedule Received","True"
						
					

wait Wait5
					.webLink("BackToPreviousPage").press
								
																						
End with

with ism.page(report_page)
					
					wait Wait5
					.webButton("Cancel").press
End with
 
 
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_Apply", "REP_SBR_TC_068"