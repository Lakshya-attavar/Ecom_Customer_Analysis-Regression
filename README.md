# Regression_Analysis_Ecommerce
## Project Background

‘Drinks@home.uk’ is an ecommerce platform operating from the UK and deals with the sale of  both alcoholic and non-alcoholic beverages from all over the world.  The company employs a direct-to-consumer (DTC) business model, leveraging online channels to reach and engage customers.

The company is organizing a marketing campaign and would like to get a better understanding of the customers to increase the revenue from the sale of alcoholic and non-alcoholic drinks. 

## Objectives:

1. Given the demographic and behaviour of past customers on the website, to identify what factors significantly lead to customers spending more or less money on the ‘drinks@home’ website.
2. Provide recommendations on the next marketing project out of the three options on which one would be the best to go with for increasing profits.  
    1. Run an advertisement targeting customers who are older than 45 years old as they are likely to spend more money.
    2. Provide a voucher for 20 GBP off their next orders.
    3. Spend more money on advertising with an influencer.

The R code used for this analysis can be found here [[link]](https://github.com/Lakshya-attavar/Regression_Analysis_Ecommerce/blob/main/Regression_Analysis.R).

The detailed analysis report can be found here [[link]](https://github.com/Lakshya-attavar/Regression_Analysis_Ecommerce/blob/main/Regression_Analysis_Report.pdf)

## Data Structure & Initial Checks

The dataset provided has 400 observations of customer orders. No incomplete records were found.

- Revenue (GBP):  The revenue in GBP from the most recent order made by the customer.
- Estimated_Age is the age of the customer estimated by the software.
- Time_On_Site is the time in seconds spent by the customer on the website per week.
- Seen_Voucher is a categorical variable that shows if the customer has come across a discount voucher pop-up. It has two values 0 and 1.
- Estimated_Income is the income of the customer in GBP estimated by the website tracking software.
- Advertisement_Channel is a categorical variable indicating the means of advertisement that led the customer to the website. (1-Leaflet, 2-Social media, 3-Search Engine, 4-Influencer).

## Executive Summary

### Overview of Findings

The factors that positively impact the spending of customers are income, voucher pop-up  and advertisement channels 2 (Social Media), 3 (Search Engine), 4 (Influencer). The estimated age and time spent on site do not have a significant influence on the revenue. Given the choice of 3 campaigns, campaign 3 of investing in influencer advertising is is recommended. 

### Objective 1: Factors that positively impact the spending of customers:

- To better understand the relationship between the variables in the dataset proceed to check the correlation of the dataset. In the image below, shades of blue indicate a positive correlation and red indicates a negative correlation. Darker shades indicate a stronger correlation. It is evident that Seen_Voucher and Estimated income have a strong positive correlation of 0.466 and 0.532 respectively on the Revenue. The advertisement channel has a moderate positive correlation of 0.212 with revenue. Age and time spent on site have a very low correlation with the revenue. There is no high correlation among the independent variables, hence multicollinearity is avoided.

<p align="center">
<img width="600" alt="image-5" src="https://github.com/user-attachments/assets/6ec34156-3a2c-40cc-8b99-7fb5b1b4b37e">
</p>

- Scatter Plots visualising positive relationship of Income and voucher seen with revenue

<p align="center">
<img width="600" alt="image-6" src="https://github.com/user-attachments/assets/c32aae2f-5b31-431b-8bcc-f8c66585c4dd">
</p>

- Scatter Plots visualising positive relationship of Income and advertisement channel with revenue

<p align="center">
<img width="600" alt="image-7" src="https://github.com/user-attachments/assets/4d721adf-b8b2-4238-b937-89a9c81f200b">
</p>

- As the objective is to find what factors positively or negatively impact the spending of customers, it is appropriate to apply multiple linear regression. Multiple linear regression allows an understanding of the influence of two or more independent variables on the dependent variable. This also enables to explain and identify which marketing campaign to recommend to ensure an increase in profits. The Revenue is the dependent variable as it is the variable of interest and the rest of the variables are considered independent variables.
- Fitting the regression model for Income, Voucher Seen and Advertisement channel vs the revenue gives the following insights

<p align="center">
<img width="600" alt="image-8" src="https://github.com/user-attachments/assets/d3cdbfca-f13b-4a38-84a8-25f7e2efff03">
</p>

#### Insights:

- Estimated income is statistically significantly related to the revenue (p-value<0.05) and it can be seen that an increase of 1 GBP in income increases the revenue by 0.002 GBP on average.
- Seen voucher is significantly related to the revenue with the revenue increasing by 19.627 GBP when the voucher is seen.
- Advertisement Channel 2 is significantly related to revenue and using advertisement channel 2 increases the revenue by 6.90 GBP on average with reference to using channel 1.
- Advertisement Channel 3 is significantly related to revenue and increases the revenue by 8.11 GBP on average with reference to channel 1.
- Advertisement Channel 4 is significantly related to revenue and increases the revenue by 12.91 GBP on average with reference to channel 1.
- Considering that channel 1 is reference channel with respect to the other channels, Impact of Advertisement channel 1 is inferred from the intercept and is not significantly related to the revenue.

From the above analysis, it can be concluded that estimated income, voucher seen and advertisement channels 2, 3 and 4 have a positive impact while advertisement channel 1, time on site and Estimated age of customer have no impact on the spending of the customer on the website.

### Objective 2: Marketing Campaign recommendations

Drinks@home is looking to increase profits on the website and has three choices for the marketing campaign that are being considered.

1. Launch an advertisement targeting customer above the age of 45 considering the likelihood of them spending more.

From the results of the analysis conducted it is inferred that the age of the customer has no impact on the revenue. Hence running a commercial targeting an age group would not aid in increasing profits.

2. Grant a voucher of 20 GBP off the next purchase to the customer.

It is evident from the analysis and regression model summary that whether the customer has been presented with a voucher pop-up largely impacts the revenue. The revenue increases by 19.6 GBP depending on if the customer has seen the voucher. Hence providing vouchers to customers increases revenue. But in this case since the voucher amount is 20 GBP it could lead to a loss depending on the order amount.

3. Invest on influencer advertising

The data provided has an equal distribution with 100 data points for each channel. Advertisement Channel 1 represents leaflets, 2 represents social media, 3 represents search engines and 4 represents influencers. From the analysis, we see that if the customer has reached the website through advertisement channel 4 which is influencer advertising, then the revenue increases by 12.91 GBP. Therefore, investing in Influencer Ads increases profits.

## Recommendations:

Based on the insights and findings above, given the choice of 3 campaigns, campaign 3 of investing in influencer advertising is is recommended. Although campaign 2 is a good option with a lower coupon amount, the current coupon offering of  20 GBP  discount might result in a loss.
