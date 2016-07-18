'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ScheduledBreaksReport_ChannelColumnCustomizationWindow_Search
' Description					:	Validate search for customize column window.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_Search", "REP_SBR_TC_066"

ism.ClickToMenu MENU_AVAILABLE_REPORTS

StartDateValue=REPORT_START_DATE1
EndDateValue=REPORT_END_DATE1

Regions_val=testcasedata.getvalue("Regions_val")
Markets_val=testcasedata.getvalue("Markets_val")
Zones_val=testcasedata.getvalue("Zones_val")
Networks_val=testcasedata.getvalue("Networks_val")
InterConnect_val=testcasedata.getvalue("InterConnect_val")
Comments_val=testcasedata.getvalue("Comments_val")
SearchTerm_val=testcasedata.getvalue("SearchTerm_val")
SearchTerm_val_2=testcasedata.getvalue("SearchTerm_val_2")
SearchTerm_val_3=testcasedata.getvalue("SearchTerm_val_3")
SearchTerm_val_4=testcasedata.getvalue("SearchTerm_val_4")
SearchTerm_val_5=testcasedata.getvalue("SearchTerm_val_5")

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
						
						
						.webRadioGroup("LISeparate").SelectGroupItem "Enabled"
						wait Wait3
						
						.webEdit("Comments").setValue Comments_val
						wait Wait3

wait Wait2
					.webbutton("Generate").press
					wait Wait3

End with
wait Wait10
REM 'Assert generated report page


with ism.page(reportgen_page)
wait Wait3				
						.webLink("Channels").press
						wait 9
						.webTable("ChannelsDetails_SB").assertExist "True"																		
						.webTable("ChannelsDetails_header_SB").assertExist "True"
						.webTable("ChannelsDetails_header_SB").pressSBColumnCustomization
						
						.webEdit("Search").setValue SearchTerm_val
						
						wait Wait5
						.assertExistWE SearchTerm_val_2,"True"

						wait Wait3
						.webEdit("Search").setValue SearchTerm_val_3
						wait Wait4
						.assertExistWE SearchTerm_val_4,"True"	
						wait Wait2
						.assertExistWE SearchTerm_val_5,"True"	
						
						.webLink("CustomizeCancel").press
							
						wait Wait5
						.webLink("BackToPreviousPage").press	
						wait Wait5
End with

with ism.page(report_page)
					
					wait Wait5
					.webButton("Cancel").press
End with
executionController.startTestCase_w_TestCaseNumber "ScheduledBreaksReport_ChannelColumnCustomizationWindow_Search", "REP_SBR_TC_066"
