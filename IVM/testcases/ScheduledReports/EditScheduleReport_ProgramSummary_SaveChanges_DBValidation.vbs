ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

strFirstDate=SDFIRST_DATE
strLastDate=SDLAST_DATE
strEndDate=END_DATE
strSites=testcasedata.getvalue("strSites")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strGroupBy=testcasedata.getvalue("strGroupBy")
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")
strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

With ivm.page(ScheduledReports_Page)

			SCHEDULED_DATE=getDate("Date","EDT",0)

				
			strReportTime=Trim(ivm.page(ScheduledReports_Page).webTable("ScheduledReports").getCellValue(reportProgramSummary,3))
			
			strReportTime=Replace(strReportTime," ","")
			strReportTime=Mid(strReportTime,11,8)						
									
									
		 .assertFormrecord reportProgramSummary,SCHEDULED_DATE & strReportTime,strUiVal,"True"
			
End With
