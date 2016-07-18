'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Detailed data tab with web service.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ValidateWithWebServiceData", "REP_RSR_TC_057"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")

strComments=testcasedata.getvalue("strComments")

ivm.Activatebowser()
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait20
 DataSet=DATASET_REGIONSUMMARY
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportRegionSummary,3
					     wait Wait5
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3
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


						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait Wait8
						
End with	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
						.webtable("DetailedData_RS").assertTableData reportRegionSummaryDetailed,DataSet
						
				
					''''''validate data with DGW
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ValidateWithWebServiceData", "REP_RSR_TC_057"