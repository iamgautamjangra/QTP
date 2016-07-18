'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate Clear all operation on advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_RSR_TC_033"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strRegionName=testcasedata.getvalue("strRegionName")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 3
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("RegionName_Adv").setValue strRegionName
						   
							
							.webLink("AdvClearAll").press
						wait 2
					
						.webEdit("ElementNumber_Adv").assertValue ""
						wait 3
						
						.webEdit("RegionName_Adv").assertValue ""
						
						.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
						wait 3
						
						.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
						wait 3
						.webEdit("CampaignName").assertValue "Type to search..."
						.webEdit("TimeRange").assertValue "Type to search..."
						
						.webLink("AdvCancel").press
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_RSR_TC_033"