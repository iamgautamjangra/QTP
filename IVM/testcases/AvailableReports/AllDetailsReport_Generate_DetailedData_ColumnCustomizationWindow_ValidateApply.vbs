'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AllDetailsReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						 
						   .webLink("AdvancedSearch").press
						    wait Wait3
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
							wait Wait7
						
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
							
							
							.webTable("DetailedData_Header_AD").pressColumnCustomization
							wait Wait5
							
							
							.selectCustomizeColumn "Clock Number","False"
													.selectCustomizeColumn "Program Series Title","False"
							.selectCustomizeColumn "Program Episode Title","False"
							.selectCustomizeColumn "Program Episode ID","False"
							.selectCustomizeColumn "Program Placement Count","False"
							.selectCustomizeColumn "Program Views","False"
							.selectCustomizeColumn "Program Partial Views","False"
						
							.selectCustomizeColumn "Region Group Name","False"
							
							.selectCustomizeColumn "Unique Customers","False"
							.selectCustomizeColumn "Advert Placement Count","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							
							
							
							.assertExistWE "Time Range","True"
							.assertExistWE "Campaign Name","True"
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
							.assertExistWE "Region Name","True"
							.assertExistWE "Region Group Name","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "Unique Customers","True"
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
							
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Clock Number","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Campaign Name","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program PID","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Ad Title","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Unique Customers","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Placement Count","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program PAID ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Channel ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Title ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Series Title ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Episode Title ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Episode ID ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Placement Count ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Views ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Program Partial Views ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Region Name ","False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist "Region Group Name ","False"
							
							
							.webTable("DetailedData_Header_AD").pressColumnCustomization
							wait Wait5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait Wait10
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_AD").assertCustomizeColumnExist strColumn1,"False"
														
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"