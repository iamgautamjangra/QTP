'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search in the advanced search multiselect listbox.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_RSR_TC_029"

DataSet=testcasedata.getvalue("DataSet")
'strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10


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

							.weblink("PreferredData").press
							 wait 5
							 
							
							.webLink("AdvancedSearch").press
							  wait 5
							  
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"							 
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName
                            wait 15
							.selectlistItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							wait 2
							
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"False"
							 wait 2
							.webEdit("CampaignName_Adv").assertValue "Type to search..."
							 	
							 
							 .webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait 2
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							wait 2
							
							.webEdit("TimeRange_Adv").assertValue strTimeRange1
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait 2
							.webEdit("TimeRange_Adv").assertValue "Type to search..."
							 	
							
							.webLink("AdvCancel").press							  
							
						  	
							
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_RSR_TC_029"