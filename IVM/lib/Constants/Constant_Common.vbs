REPORT_START_DATE1 = DateAdd("d",-10,Date())
REPORT_END_DATE1 = DateAdd("d",10,Date())

FIRST_DATE = DateAdd("d",-24,Date())
LAST_DATE = DateAdd("d",-23,Date())
CAMP_FIRST_DATE = DateAdd("d",-53,Date())
CAMP_LAST_DATE = DateAdd("d",-23,Date())
END_DATE = DateAdd("d",5,Date())
SDFIRST_DATE=DateAdd("d",-2,Date())
SDLAST_DATE= DateAdd("d",-1,Date())
Const ADMIN_USER = "admin"
Const ADMIN_PASSWORD ="admin@123"
'Used For Menu Navigation
Const MENU_AVAILABLE_REPORTS = "Data Analytics > Reports > Available Reports"
Const MENU_SCHEDULED_REPORTS = "Data Analytics > Reports > Scheduled Reports"
Const MENU_AUDIT_LOG = "Administration > Audit Log"
Const MENU_USERS="Administration > User Manager > Users"
Const MENU_ROLES="Administration > User Manager > Roles"
Const MENU_GLOBAL_SETTINGS="Administration > Global Settings"
Const MENU_NOTIFICATION_GROUPS="System Setup > Alert Settings > Notification Groups"
Const MENU_SOFTWARE_CONFIGURATION="System Setup > Deployment Settings > Software Configuration "

Const MENU_ON_DEMAND_REPORTS="Data Analytics > Reports > On-Demand Reports"



Const Maintance_page = "pgMaintance"
'Constants for page name
Const ScheduledReports_Page = "pgScheduledReports"
Const report_page = "pgAvailableReports"
Const reportgen_page= "pgReports_gen"
Const preferredData_page="pgPreferredData"
Const detailedData_page="pgDetailedData"
Const AuditLog_page = "pgAuditLog"
Const Common_page="pgCommon"
Const Login_page="pgLogin"
Const User_page="pgUser"
Const Roles_page="pgRoles"
'Constants for report name
Const reportAllDetails = "All Details"
Const reportAdvertisementandProgramDetails = "Advertisement And Program Details"
Const reportAdvertisementSummary = "Advertisement Summary"
Const reportCampaignSummary = "Campaign Summary"
Const reportEndOfCampaign = "End of Campaign"
Const reportProgramSummary = "Program Summary"
Const reportRawData = "Raw Data"
Const reportRegionSummary = "Region Summary"
Const reportUniqueCustomers = "Unique Customers"
Const reportVODAdDeliveryDataFeed = "VOD Ad Delivery Data Feed"
Const DataSetAdvertisementandProgramDetails="AdProgramDetails"
Const reportVODAdDelivery = "VodAdDelivery"
Const reportAdvertisementSummaryDataBase="AdSummary"

'Table constants
'grdUsers="Users"
'frmCreateNewUser="Users"
Const frmCreateNewUser="Users"
Const frmCreateNewRole="Create new role"
Const frmEditRole = "Edit Roles"
Const frmDeleteRole= "Delete Roles"
Const grdUsers="Users"
Const grdAuditLogs = "Audit Logs"
Const grdRoles = "Roles"



'Avalilable dataset constant
Const DATASET_CAMPAIGNSUMMARY="CampaignSummary787_20140318093354"
Const DATASET_ADVERTISEMENTSUMMARY="AdSummary57_20140211023801"




'Validation for lists
Const MULTI_LIST_SITES = "siteoption"
Const MULTI_LIST_CAMPAIGN = "campaign"
Const MULTI_LIST_CAMPAIGNNAMES_AVAI="camp"
Const MULTI_LIST_CAMPAIGNNAMES_Detail="campaignName_detail"
Const MULTI_LIST_CAMPAIGNNAMES_Detail1="campaignName_id"
Const MULTI_LIST_TIMERANGE="date"
Const MULTI_LIST_TIMERANGE_EOC1="timeRange"
Const MULTI_LIST_CAMPAIGNNAMES_VOD="camp_VOD"
Const MULTI_LIST_CAMPAIGNNAMES_RD="camp_RD"
Const MULTI_LIST_CAMPAIGNNAMES_APD="camp_APD"
Const MULTI_LIST_CAMPAIGNNAMES_CS="camp_CS"
Const MULTI_LIST_CAMPAIGNNAMES_PS="camp_PS"
Const MULTI_LIST_CAMPAIGNNAMES_AS="camp_AS"
Const MULTI_LIST_CAMPAIGNNAMES_AD="camp_AD"
'Const MULTI_LIST_CAMPAIGNNAMES_APD="camp_APD"
Const MULTI_LIST_CAMPAIGNNAMES_RS="camp_RS"
Const MULTI_LIST_ADTITLE_APD="adtitle_APD"
Const MULTI_LIST_ADTITLE_AVAI="adtitle_APD"
Const MULTI_LIST_PROGRAMPID_RD="progPid_RD"
Const MULTI_LIST_PROGRAMPID_PS="prog_PS"
Const MULTI_LIST_PROGRAMPID_AS="prog_AS"
Const MULTI_LIST_PROGRAMPID_AD="prog_AD"
Const MULTI_LIST_PROGRAMPID_RD_ADV1="prog_RD"
Const MULTI_LIST_PROGRAMPID_ADV1="prog"
Const MULTI_LIST_PROGRAMPID_AVAI="prog"
Const MULTI_LIST_PROGRAMPID_CSADV="programPid_detail"
Const MULTI_LIST_PROGRAMPID_CSPRE="programPid_id"
Const MULTI_LIST_PROGRAMPID_ADV="p"
Const MULTI_LIST_PROGRAMPID_RD_ADV="p_RD"
Const MULTI_LIST_TIMERANGE_AVAI="date"
Const MULTI_LIST_TIMERANGE_CS="time_CS"
Const MULTI_LIST_TIMERANGE_AD="time_AD"
Const MULTI_LIST_TIMERANGE_RS="time_RS"
Const MULTI_LIST_TIMERANGE_UC="time_UC"
Const MULTI_LIST_TIMERANGE_PS="time_PS"
Const MULTI_LIST_TIMERANGE_AS="time_AS"
Const MULTI_LIST_TIMERANGE_AVAI1="time"
Const MULTI_LIST_TIMERANGE_AVAI2="time_range_detailed"
Const MULTI_LIST_TIMERANGE_EOCDETAILED="timeRange_detail"

Const MULTI_LIST_TIMERANGE_AVAI3="timeRange_preferred"
Const MULTI_LIST_TIMERANGE_VOD="date_VOD"
Const MULTI_LIST_TIMERANGE_EOC="time_EOC"
Const MULTI_LIST_PROVIDER = "provider"
Const MULTI_LIST_TIMERANGE_APD="timeRange"
Const MULTI_LIST_SITEGROUPS = "site_group"
Const MULTI_LIST_GROUPBYLIST = "By Day;By Day of Month;By Day of Week;By Hour;By Hour of Day;By Month;By Quarter;Entire Range"
Const MULTI_LIST_CAMPAIGNNAME="camp"
Const MULTI_LIST_GROUPBY="GroupBy"
Const MULTI_LIST_DAYSOFWEEK="weekdropdown"
MULTI_LIST_DAYSOFWEEK_VALUE="Sundays,Mondays,Tuesdays,Wednesdays,Thursdays,Fridays,Saturdays"
MULTI_LIST_MONTH_VALUE="Select Month,January,February,March,April,May,June,July,August,September,October,November,December"
MULTI_LIST_DAYSOFMONTH="daydropdown"
MULTI_LIST_DAYSOFMONTH_VALUE="1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,11th,12th,13th,14th,15th,16th,17th,18th,19th,20th,21st,22nd,23rd,24th,25th,26th,27th,28th,29th,30th,31st,Last day of month"
MULTI_LIST_YEAR_VALUE="Select Year,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050"

'ReportDataset
Const DATASET_ADPROGRAMDETAILS="AdProgramDetails352_20140704021900"
Const DATASET_VODADDELIVERYDATAFEED="VodAdDelivery346_20140703224400"
Const DATASET_REGIONSUMMARY="RegionSummary257_20140704033000"
Const DATASET_UNIQUECUSTOMERS="UniqueCustomers340_20140703185800"
DATASET_PROGRAMSUMMARY1="ProgramSummary350_20140704011500"
Const DATASET_PROGRAMSUMMARY="ProgramSummary350_20140704011500"
Const DATASET_ALLDETAILS="AllDetails863_20140326070939"
' for testing PID scripts
DATASET_ALLDETAILS1="AllDetails510_20131105140600" 
DATASET_ADPROGRAMDETAILS1="AdProgramDetails579_20131105113000"
Const DATASET_ADSUMMARY="AdSummary344_20140703220000"
Const DATASET_ENDOFCAMPAIGN=" EndOfCampaign254_20140704033000"
Const DATASET_RAWDATA="RawData870_20140327003941"


''Table constants
Const reportRawDataPreferred="RawDataPreferred"
Const reportRawDataDetailed="RawDataDetailed"
Const reportCampaignSummaryPreferred="CampaignSummaryPreferred"
Const reportCampaignSummaryDetailed="CampaignSummaryDetailed"
Const reportEndOfCampaignPreferred="EndOfCampaignPreferred"
Const reportEndOfCampaignDetailed="EndOfCampaignDetailed"
Const reportProgramSummaryPreferred="ProgramSummaryPreferred"
Const reportProgramSummaryDetailed="ProgramSummaryDetailed"
Const reportAdvertisementSummaryPreferred="AdvertisementSummaryPreferred"
Const reportAdvertisementSummaryDetailed="AdvertisementSummaryDetailed"
Const reportAllDetailsDetailed="AllDetailsDetailed"
Const reportUniqueCustomersDetailed="UniqueCustomersDetailed"
Const reportAdvertisementandProgramDetailsDetailed="AdvertisementandProgramDetailsDetailed"
Const reportRegionSummaryPreferred="RegionSummaryPreferred"
Const reportRegionSummaryDetailed="RegionSummaryDetailed"
Const reportProgramSummaryDataSet="ProgramSummaryDataSet"

'List Validation
Const LIST_SHOW_DATE="Oct 10,2013,10/10/2013,10-10-2013"
Const LIST_SHOW_TIME="12-hour format,24-hour format"

'Sync wait time
const Wait2=2
const Wait3=3
const Wait5=5
Const wait6 = 6
const Wait8=8
const Wait7=7
const Wait360=600
const Wait20=20
const Wait30 = 30
const Wait10=10
const Wait12=12
const Wait15=15
const Wait300=600



'Constants for summary
Const Desc_APD = "This report shows the total ad views for every video asset targeted in each campaign against every ad spot in all breaks for a specified date range."
Const Desc_AS = "This report shows the total ad views for each campaign against every ad spot in all breaks (such as Pre roll #1, Pre roll #2, Pre roll #3, and so on)."
Const Desc_AD = "This report shows all data related to campaigns, advertisements, programs, and regions over a specified date range. The report may also be limited to specific regions and campaigns."
Const Desc_CS = "This report shows ad view profiles observed for all active campaigns for a specified date range."
Const Desc_EOC = "This report shows ad view profiles for a concluded campaign in detail for a configured campaign period."
Const Desc_PS = "This report shows ad view profiles observed for every video asset targeted in each campaign for a specified date range."
Const Desc_RD = "This report shows advertisement and content details for all subscriber MAC addresses that have ordered VOD content during a specified date range. This report is used as a source for all of the other reports."
Const Desc_RS = "This report shows the total ad views for each campaign broken down by each Ad Decision Service (ADS) instance."
Const Desc_UC = "This report shows the total number of unique customers against specified content providers, campaigns, and date range."
Const Desc_VOD = "This report shows a bespoke account for the content providers detailing the total ad views for a particular set of provider IDs."

'Messages if no dataset selected
FilterOptions_msg="You need to select a dataset in the table to enable filter options."
EmailAndStorageOptions_msg="You need to select a dataset in the table to enable email and storage options."
Comments_msg="You need to select a dataset in the table to enable comments."

NoRecordFound_msg="No data exists for the selected criteria."
NoDatsetFound_msg="No dataset met the filtered criteria." 
NotificationDelete_msg="Are you sure you want to delete this notification group "
NoDatsetFound_msg_APD="No dataset met the filtered criteria."