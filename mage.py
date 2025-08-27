#from my_module import *
#Ma1 =("ATTCGTT")
#import random
#ranGen =''.join([random.choice(nucleotides) for nuc in range(20)])
#print(len(ranGen))
#print(f"A: {Ma1.count('A')}, G: {Ma1.count('G')}")
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy as statis
df = pd.read_csv('Pokemon_data.csv')
db= df.loc[(df.HP>100),:]
#print(df.loc[((df.HP >100)&(df['Speed'] > 10)),:])
#dt=pd.DataFrame(df.groupby('Type 1')['HP'].sum())
#plt.figure()
#ax=sns.barplot(data=db, x= 'Type 1',y ='HP', errorbar=('ci', 95))
#plt.legend()
#plt.show()
#print(pd.DataFrame(df.groupby('Type 2').agg({'HP':'mean', 'Attack':'sum'})))
print(df.sort_values('Type 2'))