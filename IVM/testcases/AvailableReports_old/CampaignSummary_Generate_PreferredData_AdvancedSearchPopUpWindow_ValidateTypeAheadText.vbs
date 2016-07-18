'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"




'strTimeRange=testcasedata.getvalue("strTimeRange")
'strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15


DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
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
						
						wait Wait2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							 wait Wait5
							 
							
							.webLink("AdvancedSearch").press
							  wait Wait5
							  
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"							 
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName
                            wait 3
							.webEdit("CampaignName_Adv").press
							.selectlistItem MULTI_LIST_CAMPAIGNNAMES_Detail1,strCampaignName1,"True"
							wait Wait3
							
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
							wait Wait3
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_Detail1,strCampaignName1,"False"
							 wait Wait3
							
							 
							 .webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait 5
							.webEdit("TimeRange_Adv").press
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI3,strTimeRange1,"True"
							wait Wait5
							
							.webEdit("TimeRange_Adv").assertValue strTimeRange1
							wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_AVAI3,strTimeRange1,"False"
							 wait Wait5
							

							.webLink("AdvCancel").press							  
							
						  	
							
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"