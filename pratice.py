
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
x=np.linspace(0,10,100)
#y = np.sin(x)
#fig = plt.figure()
#plt.plot(x,np.cos(x),'--',label="cos(x)")
#plt.xlabel("giá trị x")
#plt.legend()
#plt.show()
#fig.savefig('my_figure.png') #lưu file lại
#plt.figure()
#plt.subplot(2,1,2)#hàng,cột,panel number=> 2 hàng 1 cột 
#plt.plot(x,np.cos(x),'--',label="cos(x)")
#plt.show()
#Object-oriented interface
#plt.figure()
#fig, ex= plt.subplots(2)#ax will be an array of two Axes objects
#ex[0].plot(x,np.cos(x),'--',label="cos(x)")
#ex[1].plot(x,np.sin(x),'--',label="cos(x)")
#plt.plot(x, x + 1, linestyle='solid')
##plt.plot(x, np.sin(x))
#plt.xlim(-1, 11)
#plt.ylim(-1.5, 1.5);
#plt.plot(x, y, 'o', color='black')
#plt.show()
#Basic Errorbars
#x = np.linspace(0, 10, 50)
#dy = 0.8
#y = np.sin(x) + dy * np.random.randn(50)
#plt.errorbar(x, y, yerr=dy, fmt='.k');
##x=np.linspace(0,10,20)
#dy=0.6
#y = np.sin(x) + dy*np.random.randn(20)
#plt.errorbar(x,y,yerr=dy,fmt='.k')
#fig, ax = plt.subplots()
#x = np.linspace(0, 20, 1000)
#ax.plot(x, np.cos(x))
#ax.axis('equal')
#ax.annotate('local maximum', xy=(6.28, 1), xytext=(10, 4),
#rrowprops=dict(arrowstyle= "->", connectionstyle="arc3,rad=-0.2"))
#ax.annotate('local minimum', xy=(5 * np.pi, -1), xytext=(2, -6),
#arrowprops=dict(arrowstyle="->",
#connectionstyle="angle3,angleA=0,angleB=-90"));
import seaborn as sns
from scipy import stats
#a=[2,2,2,3,4,5,5,6,7,7,8,8,8,9,10,10,11,12,12,13,14,15,16,18,22,26]
#b=a[::-1]
#print(len(a))

#vals= a+b
#groups = ['gene1']*5 +['gene2']*5
#plt.figure(figsize=(2,4))
#ax = sns.barplot(x=groups,y=vals,capsize =0.5,edgecolor='0.2',lw=2.5,errwidth=2.5,palette=['Green','Blue'])
#kwargs ={'edgecolor':'0.2','linewidth':2.5,'fc':'none'}
#ax= sns.swarmplot(x=groups,y=vals,marker = 's', s=3,**kwargs)
#week=[]
#for x in range(1,8):
    #week+= [x,x,x]
#week+=week
#groups= ['Control']*26 + ['Drug']*26
#err_kws ={'capsize':1 ,'elinewidth':2.5,'capthick':2}
#df=pd.DataFrame(zip( vals,week,groups), columns=['Tumor size','week','Treatment'])
#ax = sns.lineplot(data=df, x='week', y = 'Tumor size', hue= 'Treatment',marker ='s', style ='Treatment',err_style ='bars',err_kws =err_kws)
#plt.title("Bieu do")
#plt.show()







