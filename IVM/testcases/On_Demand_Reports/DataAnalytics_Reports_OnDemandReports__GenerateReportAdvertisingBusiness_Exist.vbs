'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_OnDemandReports__GenerateReportAdvertisingBusiness_Exist
' Description					:	Validate  "Advertisement Business" should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   27-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_OnDemandReports__GenerateReportAdvertisingBusiness_Exist", "REP_ODR_TC_001"

ivm.NavigateToMenu MENU_ON_DEMAND_REPORTS
wait 10

With ivm.page(OnDemandReportPage)
                        
						.webElement("OnDemandReport").assertExist "True"
						.webElement("OnDemandReport").assertStatus "Visible"

						.webTable("OnDemandReport").assertExist "True"
						
						.webTable("OnDemandReport").assertColumnExist "Report Name","True"
						.webTable("OnDemandReport").assertColumnExist "Description","True"
						.webTable("OnDemandReport").assertColumnExist "Actions","True"

						.webTable("AdvertisingBusiness").assertValue reportOnDemand,1
						.webTable("AdvertisingBusiness").assertValue Desc_ODR,2
						.webTable("AdvertisingBusiness").asserttblLink reportOnDemand,3

End with								

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_OnDemandReports__GenerateReportAdvertisingBusiness_Exist", "REP_ODR_TC_001"