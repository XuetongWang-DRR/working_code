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
import matplotlib.pyplot as plt

#from scipy.stats import halfnorm
#from scipy.stats import kstest
import pymysql
import scipy.stats as st
import pandas as pd
import numpy as np




#定义函数####################################################

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

    threshold = np.percentile(value, 90)
    print(threshold)
    
    GEV = gev(**gev.lmom_fit(value[value < threshold]))
    
    
    GPA = gpa(**gpa.lmom_fit(value[value > threshold]))
    
    GAMMA = distr.gam(**distr.gam.lmom_fit(value[value < threshold]))
    
    #beta_params = beta.fit(value)
    #BETA = beta(beta_params[0],beta_params[1])
    #expon_params = expon.fit(value)
    

    #norm_params = norm.fit(value)
    value = list(range(13))
    #value1 = [c/max(value) for c in value]
    ax.set_title("{elements} probability density fitting curve".format(elements = element))
    ax.plot(value, GEV.pdf(value), 'k-',lw=2, label='GEV pdf')
    ax.plot(value, 0.02*GPA.pdf(value),'r-', lw=2, linestyle = ':', label='GPA pdf')
    ax.plot(value, GAMMA.pdf(value),color = 'pink', lw=2, linestyle = '--', label='GAMMA pdf')
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
    threshold = np.percentile(factor, 100)
    print(threshold)
    
    #GEV
    params = gev.lmom_fit(factor[factor < threshold])
    GEV = gev(**params)
    result = 1 - GEV.cdf(value)
    print('GEV:',result, 1/result,result)
    
    #GPD
    GPA = gpa(**gpa.lmom_fit(factor[factor > threshold]))

    result= 0.05 - 0.05*GPA.cdf(value)
    print('GPD:',result, 1/result)

    #Exponential 
    #params = expon.fit(factor)
    #result = 1-expon.cdf(value,params[0], params[1])
    #print('Exponential:',result, 1/result)
    
    #Norm
    #params = norm.fit(factor)
    #result = 1-norm.cdf(value,params[0], params[1])
    #print('Norm:',result, 1/result)

    #GAMMA
    params = distr.gam.lmom_fit(factor[factor < threshold])
    gam = distr.gam(**params)
    result =1-gam.cdf(value)
    print('GAMMA:',0.98*result, 1/result,0.98*gam.pdf(value))


#提取数据集 #########################################
conn = pymysql.connect(host='123.56.193.234', user='tq007', passwd='1I9waUNDCH', db='observe_siteId')
cur = conn.cursor()

cur.execute("select SiteId, mon, day,tempAvg, tempMax, tempMin, prec20_20,windAvg,\
            windMax, windExt,sunshineHour from `obsSiteId` where SiteId = 54596 and \
            day in (18,19,20,21,22,23,24,25,26) and month(datetime) = 7 \
            and DateTime > '1987-01-01 00:00:00'")
#siteid in (54511,54433,54514,54513,54399,54505,54596,54431,54398,54499,54594,54419,54424,54416,54406)

data = cur.fetchall()
data = pd.DataFrame(list(data))
data.rename(columns = {0: 'siteid', 1:'mon', 2: 'day', 3:'tempavg', 4:'tempmax', 5:'tempmin',
                       6:'rain', 7:'windavg', 8:'windmax', 9:'windext',10:'sunshine'},inplace = True)


distribute(data,'sunshine',0)
distribute(data1, 'sunshine', 5)

distribute(data1, 'sunshine', 7)

distribute(data1, 'sunshine', 8)

distribute(data1, 'sunshine', 9)

distribute(data1, 'sunshine', 10)

distribute(data1, 'tempmax', 38)


fit_plot(data1,'sunshine')


sunshine = data_clear(data,'sunshine')
plt.hist(sunshine,bins = 15, normed = 1)



data1 = data[~data['sunshine'].isin([0])]
rain = data_clear(data,'rain')
tempmax = data_clear(data,'tempmax')

params = gev.lmom_fit(tempmax)
GEV = gev(**params)
1 - GEV.cdf(25)


























