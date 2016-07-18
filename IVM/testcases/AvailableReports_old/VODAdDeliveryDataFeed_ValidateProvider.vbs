'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_ValidateProvider
' Description					:	Validate "Sites" List box.
' Author 						:   SeaChange
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateProvider", "REP_VOD_TC_015"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS	
wait Wait10

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
DataSet=testcasedata.getvalue("DataSet")
DataSet=DATASET_VODADDELIVERYDATAFEED


With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
							 wait Wait10	
							
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait10
							
							
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
						   .webList("Provider").assertListItems "Provider"&";"&DataSet
				           .webList("Provider").assertExist "True"
						   .webList("Provider").selectItem strProvider
						   .webList("Provider").assertSelectedItem strProvider
						   
						   .webList("Provider").selectItem strProvider1
						   .webList("Provider").assertSelectedItem strProvider1
						   .webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateProvider", "REP_VOD_TC_015"