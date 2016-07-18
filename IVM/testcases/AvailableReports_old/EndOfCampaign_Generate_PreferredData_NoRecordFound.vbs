'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   SeaChange
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_NoRecordFound", "REP_EOC_TC_024"
DataSet=testcasedata.getvalue("DataSet")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportEndOfCampaign,3
					     wait Wait5
						 
						.webLink("AdvancedSearch").press
						 wait Wait5
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
						end if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait10
					     
								
						.webbutton("Generate").press 
						wait Wait8
						
End with	

With ivm.page(PreferredData_page)	

						.webLink("PreferredData").press
						wait Wait5
						
						.webTable("PreferredData_EOC").assertValue NO_RECORD_FOUND,1
						
						.webLink("BackToPreviousPage").press
							wait Wait10	
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait Wait10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
		

End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_NoRecordFound", "REP_EOC_TC_024"