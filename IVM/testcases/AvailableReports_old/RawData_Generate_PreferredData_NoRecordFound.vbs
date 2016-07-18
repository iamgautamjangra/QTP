'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_NoRecordFound", "REP_RDR_TC_027"


strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
DataSet=testcasedata.getvalue("DataSet")
strComments=testcasedata.getvalue("strComments")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportRawData,3
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

With ivm.page(preferredData_page)	

						.webLink("PreferredData").press
						wait Wait5
						
						.webTable("PreferredData_RD").assertValue NoRecordFound_msg,1

End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_NoRecordFound", "REP_RDR_TC_027"