#~/anaconda3/bin/
import pandas as pd
import numpy as np
from sys import argv
class Load_Corpus_with_Iteration(object): 
    def __init__(self, path):  
        self.path = path  
  
    def __iter__(self):  
        for line in open(self.path):  
            yield line.split()  
aa=[]
kk=[]
corpus = Load_Corpus_with_Iteration(argv[1])
for item in corpus:
     kk.append(item.pop(0))
     aa.append(item)
aa=pd.DataFrame(aa,index=kk).T
aa=aa.fillna(value=666)
s="Features.newT"
ff=open(s,'wb')
import pickle
pickle.dump(aa,ff,protocol=4)
ff.close()
exit()

