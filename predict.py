import numpy as np

import pickle
import pandas as pd
from sys import argv


ff=open(argv[1],'rb')
ml=pickle.load(ff)

X=ml[ml.columns[1:len(ml.columns)]]
y=ml.target

X.ix[:,(X == 666).any()]="NaN"
from sklearn.preprocessing import Imputer
imr=Imputer(missing_values="NaN",strategy="most_frequent",axis=1)
X=imr.fit_transform(X)



from sklearn import preprocessing
scaler = preprocessing.StandardScaler()
X = scaler.fit_transform(X)


lgr=open("LGR_file5",'rb')
pa=[]
LGR=pickle.load(lgr)
for i in LGR:
   if i=="RF":
         model=LGR[i] 
         predict=model.predict(X)
         proba=model.predict_proba(X)
         print("Sample_Name","\t","Prediction","\t","Probability")
         for id,p,q  in zip(y,predict,proba):
             if p==0:
                   p="Healthy"
             else:
                   p="Cancer"
             pa=q
             qm=max(pa)
             print(id,"\t",p,"\t",qm)

exit()
