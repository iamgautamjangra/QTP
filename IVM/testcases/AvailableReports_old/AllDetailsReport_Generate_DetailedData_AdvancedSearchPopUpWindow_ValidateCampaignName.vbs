'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_ADR_TC_027"


'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")

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
							wait Wait3
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

							.weblink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait2
							
							
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNNAMES_AD & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True" '''all items selected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False" '''all items deselected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							strCampaignName=testcasedata.getvalue("strCampaignName")
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True"
							 wait Wait4
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False"
							 wait Wait2
							
							.webLink("AdvClearAll").press
							wait Wait2	
							
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							wait Wait2
							
							.webLink("AdvSearch").press
							wait Wait5
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("CampaignName_Filter").assertExist "False"
							
							
End with			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_ADR_TC_027"