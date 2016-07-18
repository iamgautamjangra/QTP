'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Validate "Apply" functionality for "Customize Columns" pop up. 
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_APD_TC_043"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

DataSet=DATASET_ADPROGRAMDETAILS
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

With ivm.page(report_page)
							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							wait Wait10
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
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							wait 1
							.webLink("AdvSearch").press
							wait Wait3
							End If
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait10


							.webEdit("EmailRecipients").setValue strEmail

							.webEdit("StorageLocation").setValue strStorageLocation

							.webList("ReportFormat").selectItem strReportFormat

							.webList("DataType").selectItem strDataType

							.webEdit("Comments").setValue strComments
							.webButton("Generate").press
							wait Wait10
End with 
	
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait5
							
							
							.webTable("DetailedData_Header_APD").pressColumnCustomization
							wait Wait5
							
							
							.selectCustomizeColumn "Clock Number","False"
							REM .selectCustomizeColumn "Campaign Name","False"
							REM .selectCustomizeColumn "Program PID","False"
							REM .selectCustomizeColumn "Program PAID","False"
							REM .selectCustomizeColumn "Channel","False"
							REM .selectCustomizeColumn "Program Title","False"
							.selectCustomizeColumn "Element Number","False"
							.selectCustomizeColumn "Program Series Title","False"
							.selectCustomizeColumn "Program Episode Title","False"
							.selectCustomizeColumn "Program Episode ID","False"
							.selectCustomizeColumn "Program Placement Count","False"
							.selectCustomizeColumn "Program Views","False"
							.selectCustomizeColumn "Program Partial Views","False"
							REM .selectCustomizeColumn "Region Name","False"
							REM .selectCustomizeColumn "Region Group Name","False"
							REM .selectCustomizeColumn "Ad Title","False"
							.selectCustomizeColumn "UniCampaign1000-245.248ue Customers","False"
							.selectCustomizeColumn "Advert Placement Count","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							REM .selectCustomizeColumn "Total Ad Views","False"
							
							
							.assertExistWE "Time Range","True"
							REM .assertExistWE "Campaign Name","True"
							.assertExistWE "Element Number","True"
							.assertExistWE "Clock Number","True"
							.assertExistWE "Program PID","True"
							.assertExistWE "Program PAID","True"
							.assertExistWE "Channel","True"
							.assertExistWE "Program Title","True"
							.assertExistWE "Program Series Title","True"
							.assertExistWE "Program Episode Title","True"
							.assertExistWE "Program Episode ID","True"
							.assertExistWE "Program Placement Count","True"
							.assertExistWE "Program Views","True"
							.assertExistWE "Program Partial Views","True"
							
							REM .assertExistWE "Region Group Name","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "UniCampaign1000-245.248ue Customers","True"
							.assertExistWE "Advert Placement Count","True"
							.assertExistWE "Advert Full Views","True"
							.assertExistWE "Advert Partial Views","True"
							.assertExistWE "Advert Fast Forward Views","True"
							.assertExistWE "Advert Placements Not Viewed","True"
							.assertExistWE "Total Home Views","True"
							.assertExistWE "Advert Average Play Time","True"
							.assertExistWE "Total Ad Views","True"
							
							
						
							.webLink("CustomizeApply").press
							wait Wait5
							
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Clock Number","False"
							REM .webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Campaign Name","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program PID","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Ad Title","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "UniCampaign1000-245.248ue Customers","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Placement Count","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program PAID ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Channel ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Title ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Series Title ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Episode Title ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Episode ID ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Placement Count ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Views ","False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist "Program Partial Views ","False"
							
							
							
							.webTable("DetailedData_Header_APD").pressColumnCustomization
							wait Wait5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait Wait10
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_APD").assertCustomizeColumnExist strColumn1,"False"
														
							
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_APD_TC_043"