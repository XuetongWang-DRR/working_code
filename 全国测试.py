#加载程序包############################################
from lmoments3 import distr
#from scipy.stats import genextreme as gev
from lmoments3.distr import gev
from lmoments3.distr import gpa
from scipy import optimize

#from scipy.stats import genpareto as gpa
from scipy.stats import expon
from scipy.stats import norm

from scipy.stats import beta
from numpy import array
import matplotlib 
import matplotlib.pyplot as plt
from matplotlib import pyplot as plt

import matplotlib.pyplot as plt 
import numpy as np 

#x = np.linspace(-10 , 10, 100)
#y = np.sin(x) 
#plt.plot(x, y, marker="x")
#plt.show()


#from scipy.stats import halfnorm
#from scipy.stats import kstest
import pymysql
import scipy.stats as st
import pandas as pd
import numpy as np

#提取数据
conn = pymysql.connect(host='123.56.193.234', user='tq007', passwd='tq123456_', db='observe_siteId')
cur = conn.cursor()


cur.execute("select SiteId, mon, day, tempMin from `obsSiteId` \
            where SiteId = 53778 \
            and day in (3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23) \
            and month(datetime) = 4 \
            and DateTime > '1987-01-01 00:00:00'")

data = cur.fetchall()
data = pd.DataFrame(list(data))
data.rename(columns = {0: 'siteid', 1:'mon', 2: 'day', 3:'tempMin'},inplace = True)



def data_clear(data,element):
    
    """特征值处理"""
    
    dat = data[['siteid', 'mon', 'day', element]]
    dat = dat.loc[dat[element] < 32744]
    dat.loc[dat[element] == 32700,element] = 0
    dat.iloc[:, 3] = dat.iloc[:, 3]/10
    dat.iloc[:, 3] = dat.iloc[:, 3].apply(lambda t: t - 3200 if t >= 3200 else t)
    dat.iloc[:, 3] = dat.iloc[:, 3].apply(lambda t: t - 3100 if 3200 > t >= 3100 else t)
    dat.iloc[:, 3] = dat.iloc[:, 3].apply(lambda t: t - 3000 if 3100 > t >= 3000 else t)
   
    return(dat[element])
    
    
#画拟合曲线图进行对比   
def fit_plot(data,element):
    
    value = data_clear(data,element)
    value2 = data_clear(data,element)
    
    fig, ax = plt.subplots(1, 1)
    #ax.set_xlim([0,50])
    #ax.set_ylim([0,0.2])

    #threshold = np.percentile(value, 90)
    #print(threshold)    
    GEV = gev(**gev.lmom_fit(value))
    
    
        #norm_params = norm.fit(value)
    value = (-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,18,20)
    #value1 = [c/max(value) for c in value]
    ax.set_title("{elements} probability density fitting curve".format(elements = element))
    ax.plot(value, GEV.pdf(value), 'k-',lw=2, label='GEV pdf')
    #ax.plot(value, 0.02*GPA.pdf(value),'r-', lw=2, linestyle = ':', label='GPA pdf')
    #ax.plot(value, GAMMA.pdf(value),color = 'pink', lw=2, linestyle = '--', label='GAMMA pdf')
    #ax.plot(value, beta.pdf(value1,beta_params[0],beta_params[1]), color = '#008000', lw=2, label='beta pdf')
    #ax.plot(value, norm.pdf(value,norm_params[0], norm_params[1]), color = '#008000', lw=2, label='norm pdf')
    #ax.plot(value, expon.pdf(value,expon_params[0], expon_params[1]), color = '#808080',lw=2, label='expontial pdf')
    ax.hist(value2, bins = 18,normed = 1,histtype = 'stepfilled', alpha = 0.8)
    
    ax.legend(loc='best', frameon=False)
    plt.show()
    
    
    
    #不同分布进行拟合比较
def distribute(data, element, value):
    """ 
    compare with different distributions 
    data : 选取的评估时段内数据集  数据框形式
    element： 需要评估的天气要素   字符串形式
    value： 需要评估的阈值（>=）   数字形式
    """
    
    factor = data_clear(data,element)
    #threshold = np.percentile(factor, 100)
    #print(threshold)
    
    #GEV
    #params = gev.lmom_fit(factor[factor < threshold])
    params = gev.lmom_fit(factor)
    GEV = gev(**params)
    result = GEV.cdf(value)
    print('GEV:',result, 1/result,result)


def Accumulated_values_result_little_1(data, element, value):
    
    factor = data_clear(data,element)
    #threshold = np.percentile(factor, 100)
    #print(threshold)
    
    #df_1 = df[['Year','Month',element]].groupby([ 'Year'], as_index=0).sum()
    #rp_list = [1- 1/ x for x in rp_list]
    #row = []
    #for i in range(0, len(rp_list)):
    #params = gev.lmom_fit(factor[factor < threshold])
    params = gev.lmom_fit(factor)
    GEV = gev(**params)
    result = GEV.ppf(value)
    print('GEV:',result, 1/result,result)
    #GPD
    #GPA = gpa(**gpa.lmom_fit(factor[factor < threshold]))

    #result= 0.02 - 0.02*GPA.cdf(value)
    #print('GPD:',result, 1/result)
   
  
    
fit_plot(data,'tempMin')

    
data_clear(data,'tempMin')
data = data_clear(data,'tempMin')

distribute(data, 'tempMin', 0)

distribute(data, 'tempMin', -2)

distribute(data, 'tempMin',-4)

distribute(data, 'tempMin', -5)

Accumulated_values_result_little_1(data, 'tempMin', 0.009375)
Accumulated_values_result_little_1(data, 'tempMin', 0.01172)
Accumulated_values_result_little_1(data, 'tempMin', 0.01876)
Accumulated_values_result_little_1(data, 'tempMin', 0.09375)



Accumulated_values_result_little_1(data, 'tempMin', 0.009566326530612245)
Accumulated_values_result_little_1(data, 'tempMin', 0.011958163265306123)
Accumulated_values_result_little_1(data, 'tempMin', 0.01913265306122449)
Accumulated_values_result_little_1(data, 'tempMin', 0.09566326530612244)
