'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateTypeAheadTextFiltering
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateTypeAheadTextFiltering", "REP_CSR_TC_039"



DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						 wait Wait10	
						 
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

				
with ivm.page(preferredData_page)

							.weblink("PreferredData").press
							 wait Wait5
							 
							
							.webLink("AdvancedSearch").press
							  wait Wait2
							 
							 .webEdit("TimeRange_EOC_Adv").assertExist "True"
							.webEdit("TimeRange_EOC_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_EOC_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_EOC_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait 15
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							wait Wait5
							
							.webEdit("TimeRange_EOC_Adv").assertValue strTimeRange1
							wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait5
							.webEdit("TimeRange_EOC_Adv").assertValue "Type to search..."
							 wait Wait3	

							.webLink("AdvCancel").press							  
							
						  	
							
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_AdvancedSearch_ValidateTypeAheadTextFiltering", "REP_CSR_TC_039"