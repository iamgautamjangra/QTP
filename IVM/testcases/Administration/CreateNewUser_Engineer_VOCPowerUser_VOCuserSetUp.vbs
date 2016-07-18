ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
 ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
 ivm.page(Login_page).webLink("LogIn").press
 wait 7