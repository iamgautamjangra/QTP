'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_NoRecordFound", "REP_CSR_TC_036"

strStart=testcasedata.getvalue("strStart")
strEnd=testcasedata.getvalue("strEnd")
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportCampaignSummary,3
					     wait 5
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5 
						 
						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").press
						wait 5
							
					     
					     .selectDate reportCampaignSummary,"StartDate",strStart

						.selectDate reportCampaignSummary,"EndDate",strEnd
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						.webList("Grouping").selectItem strGrouping
						wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(reportgen_page)	

						.webLink("PreferredData").press
						wait 5
						
						.webTable("PreferredData_CS").assertValue NO_RECORD_FOUND,1
						
						.webLink("BackToPreviousPage").press
							wait 10	
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
		

End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_NoRecordFound", "REP_CSR_TC_036"