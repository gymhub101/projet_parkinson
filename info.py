import psutil

a = psutil.cpu_percent()
b = psutil.virtual_memory().percent
c = psutil.disk_usage('/').percent

class Info:
 stat = (a,b,c)
"""
print('----------------')
print('usage CPU : (%)', a)
print('usage RAM : (%)', b)
print('usage disk: (%)', c)
print('----------------')
"""
