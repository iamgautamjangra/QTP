'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_NoRecordFound
' Description					:	Validate the message displayed in the table in case of no data. 
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_NoRecordFound", "REP_ASR_TC_057"

strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
					
       					.webTable("DataSet").presstblRadioBtn strSeachValue,1 
						wait 5
						 
						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
					
					    .selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait 3
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange1,"True"
						wait 3
																	
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(DetailedData_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData").assertExist "True"
							.webTable("DetailedData").assertValue NO_RECORD_FOUND,1
							wait 5
						
							.webLink("BackToPreviousPage").press
							wait 10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_NoRecordFound", "REP_ASR_TC_057"