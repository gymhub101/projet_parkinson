import pygal
#pip install pygal
with open('data.txt', 'r') as f:
    lines = f.read().splitlines()

proce1 = [int(x) for x in lines[0].strip('[]').split(',')]
users1 = [int(x) for x in lines[1].strip('[]').split(',')]
cpu1   = [int(x) for x in lines[2].strip('[]').split(',')]
ram1   = [int(x) for x in lines[3].strip('[]').split(',')]
disk1  = [int(x) for x in lines[4].strip('[]').split(',')]

date1  = lines[5].strip('[]').split(',')

agraphe = pygal.Line(x_label_rotation=20)
agraphe.title = 'caractéristiques machine'
agraphe.x_labels = date1

agraphe.add('Nb Process', proce1, secondary=True)  
agraphe.add('Nb Users', users1, secondary=True) 
agraphe.add('CPU (%)', cpu1)      
agraphe.add('RAM (%)', ram1) 
agraphe.add('Disk (%)', disk1)     

agraphe.render_to_file('machine.svg')