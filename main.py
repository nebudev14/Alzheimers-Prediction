from sklearn.metrics import confusion_matrix
import numpy as np
from scipy.io import loadmat
import os
from pywt import wavedec
from functools import reduce
from scipy import signal
from scipy.stats import entropy
from scipy.fft import fft, ifft
import pandas as pd
from sklearn.model_selection import train_test_split, StratifiedKFold
from sklearn.model_selection import RandomizedSearchCV
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import scipy
from sklearn import metrics
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.model_selection import KFold,cross_validate
from sklearn.metrics import classification_report
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.model_selection import cross_val_score
import seaborn as sns
import pandas_profiling as pp

data_cross = pd.read_csv('./data/oasis_cross-sectional.csv')
data_long = pd.read_csv('./data/oasis_longitudinal.csv')

print(data_cross.info())
print("-----")
print(data_long.info())

print("NA vals:")
print(data_cross.isna().sum())
print("----------")
print(data_long.isna().sum())

# drop all rows with na/undefined values
data_cross.dropna(subset=['CDR'], inplace=True)

# remove unneccessary columns in both subsets
data_cross.drop(columns=['ID', 'Delay'], inplace=True)
data_long = data_long.rename(columns={'EDUC': 'Educ'})
data_long.drop(columns=['Subject ID', 'MRI ID', 'Group', 'Visit', 'MR Delay'], inplace=True)

print("----------------new data")
data = pd.concat([data_cross, data_long])
print(data.describe())

# find correlation between columns in the dataset
cor = data.corr()
print("-----------")
print(cor)
plt.figure(figsize=(12,9))
sns.heatmap(cor, xticklabels=cor.columns.values,yticklabels=cor.columns.values, annot=True)
# plt.show()

# profiling report
report = pp.ProfileReport(data)
# report.to_file('profile_report.html')
