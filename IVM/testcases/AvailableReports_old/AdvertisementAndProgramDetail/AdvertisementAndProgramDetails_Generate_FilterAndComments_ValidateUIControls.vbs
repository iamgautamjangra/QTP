'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate UI of "Advertisement And Program Details" report in Filters And Comments tab with different options.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_FilterAndComments_ValidateUIControls", "REP_APD_TC_021"
   

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strAdTitle=testcasedata.getvalue("strAdTitle")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"

						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 

REM 'Market Details table exist					
with ivm.page(preferredData_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("AdvertisementAndProgramDetails").assertExist "True"
							.webElement("AdvertisementAndProgramDetails").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"
                            
							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							
							.webLink("PreferredData").assertExist "True"
							.webLink("PreferredData").assertStatus "Visible"
							 
							.webLink("DetailedData").assertExist "True"
							.webLink("DetailedData").assertStatus "Visible"

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
						

							.webLink("ExportToPDF").assertExist "False"
		                    
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.assertExistWE strTimeRange,"True"
					
							.webElement("Campaigns").assertExist "True"
							.webElement("Campaigns").assertStatus "Visible"
							 
							.assertExistWE strCampaign,"True"
							
							.webElement("AdTitle").assertExist "True"
							.webElement("AdTitle").assertStatus "Visible"
							 
							.assertExistWE strAdTitle,"True"
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							
							.webElement("Comments_val").assertText strComments
							
							
							 
					        .webLink("BackToPreviousPage").press
			                 wait 5
End with

with ivm.page(report_page)
							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.webButton("Generate").press
					        wait 5
End With

With ivm.page(preferredData_page)							

							.webElement("TimeRange").assertExist "False"
							.webElement("Campaigns").assertExist "False"
							.webElement("programPid").assertExist "False"
							.webElement("Comments").assertExist "False"
							
End With
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_FilterAndComments_ValidateUIControls", "REP_APD_TC_021"