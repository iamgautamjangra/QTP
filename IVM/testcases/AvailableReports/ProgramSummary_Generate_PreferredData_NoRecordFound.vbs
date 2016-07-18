'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_NoRecordFound", "REP_PSR_TC_035"


DataSet=testcasedata.getvalue("DataSet")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportProgramSummary,3
					     wait Wait5
						 
						wait Wait5
						.webLink("AdvancedSearch").press
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait8
						
						
							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							
							If status=False Then
							
								Browser("SeaChangeManagementConsole").Refresh
								wait wait8
								.webLink("AdvancedSearch").press
								 wait Wait8
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								wait wait8
							End if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1
						
						wait Wait5
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait Wait8
						
End with	

With ivm.page(preferredData_page)	

						.webLink("PreferredData").press
						wait Wait5
						
						.webTable("PreferredData_PS").assertValue NoRecordFound_msg,1
						
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
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_NoRecordFound", "REP_PSR_TC_035"