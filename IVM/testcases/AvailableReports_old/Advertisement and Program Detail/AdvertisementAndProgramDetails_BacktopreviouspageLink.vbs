'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_BacktopreviouspageLink
' Description					:	Validate the "Back to Previous Page" link in "Advertisement And Program Details" page..
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_BacktopreviouspageLink", "REP_APD_TC_011"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
						 wait 10	
						 
						 REM webTable("SelectaDatasetforThisReport").assertExist "True"
						REM .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						REM .webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						REM .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						REM .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        REM .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
						
						 					
										 
						REM .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 'TBD new function for selecting genertaed report
						REM =""
REM =""
REM =""
REM =""
REM SITE_5=""
REM SITE_6=""
REM SITE_7
						
						REM strSite = SITE_1 & ";" & SITE_2 & ";" & SITE_3 & ";" & SITE_4
						REM strproviderID = PROVIDER_ID
						
						REM StrFilter= StartDate & ";" & strEndDate & ";" & strCamapaign ID   & ";" & strSite & ";" & strproviderID
						
						
						REM .webtable("").ValidateDatasetInnerTable(StrFilter) 'Function to validate inner table
						
						
						
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
					
						.selectDate reportAdvertisementAndProgramDetails,"StartDate",START_DATE
                        wait 5
						.selectDate reportAdvertisementAndProgramDetails,"EndDate",END_DATE		
						wait 5
                     							
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 5
						
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5
						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
											
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait 5	
End With

With ivm.page(report_page)
							
						.webElement("GeneralReportInformation").assertExist "True"							
						.webElement("GeneralReportInformation").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").asserttblRadioBtn strSeachValue,1 
							wait 5
						 
						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						
					
						.WebEdit("StartDate").assertValue START_DATE
                        wait 5
						.WebEdit("EndDate").assertValue END_DATE		
						wait 5
                     							
						.WebEdit("Sites").assertValue strSites
						wait 5
						
						.WebEdit("SiteGroups").assertValue strSiteGroups
						wait 5
						
						.WebEdit("ProviderIDs").assertValue strProviderId
						wait 5
						
						.WebEdit("CampaignName").assertValue strCampaign
						wait 5
						
											
						.webEdit("Comments").assertValue strComments
						wait 5
						
							
						.weblink("BackToPreviousPage").press
						wait 5
							
						.webTable("AvailableReports").assertExist "True"
						.webTable("AvailableReports").assertStatus "Visible"
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_BacktopreviouspageLink", "REP_APD_TC_011"