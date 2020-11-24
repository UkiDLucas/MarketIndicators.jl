# MarketIndicators.jl

*by [Uki D. Lucas](https://www.linkedin.com/in/ukidlucas/)*

This project was started in August 2020 on [GitHub](https://github.com/UkiDLucas/MarketIndicators.jl)

<h1>Table of Contents<span class="tocSkip"></span></h1>
<div class="toc"><ul class="toc-item"><li><span><a href="#Overview" data-toc-modified-id="Overview-1"><span class="toc-item-num">1&nbsp;&nbsp;</span>Overview</a></span><ul class="toc-item"><li><span><a href="#What-are-Market-Indicators?" data-toc-modified-id="What-are-Market-Indicators?-1.1"><span class="toc-item-num">1.1&nbsp;&nbsp;</span>What are Market Indicators?</a></span></li><li><span><a href="#Project-Objectives" data-toc-modified-id="Project-Objectives-1.2"><span class="toc-item-num">1.2&nbsp;&nbsp;</span>Project Objectives</a></span></li><li><span><a href="#Why-using-Machine-Learning-and-not-spreadsheets?" data-toc-modified-id="Why-using-Machine-Learning-and-not-spreadsheets?-1.3"><span class="toc-item-num">1.3&nbsp;&nbsp;</span>Why using Machine Learning and not spreadsheets?</a></span></li><li><span><a href="#Machine-Learning-approach" data-toc-modified-id="Machine-Learning-approach-1.4"><span class="toc-item-num">1.4&nbsp;&nbsp;</span>Machine Learning approach</a></span></li><li><span><a href="#Why-Julia?" data-toc-modified-id="Why-Julia?-1.5"><span class="toc-item-num">1.5&nbsp;&nbsp;</span>Why Julia?</a></span></li></ul></li><li><span><a href="#Data-acquisition" data-toc-modified-id="Data-acquisition-2"><span class="toc-item-num">2&nbsp;&nbsp;</span>Data acquisition</a></span><ul class="toc-item"><li><span><a href="#Learn-about-market-indicators" data-toc-modified-id="Learn-about-market-indicators-2.1"><span class="toc-item-num">2.1&nbsp;&nbsp;</span>Learn about market indicators</a></span></li><li><span><a href="#Download-from-Yahoo-Finance" data-toc-modified-id="Download-from-Yahoo-Finance-2.2"><span class="toc-item-num">2.2&nbsp;&nbsp;</span>Download from Yahoo Finance</a></span></li><li><span><a href="#Download-from-mql5.com" data-toc-modified-id="Download-from-mql5.com-2.3"><span class="toc-item-num">2.3&nbsp;&nbsp;</span>Download from mql5.com</a></span></li></ul></li><li><span><a href="#Data-Pre-processing" data-toc-modified-id="Data-Pre-processing-3"><span class="toc-item-num">3&nbsp;&nbsp;</span>Data Pre-processing</a></span></li><li><span><a href="#Common-date-formatting" data-toc-modified-id="Common-date-formatting-4"><span class="toc-item-num">4&nbsp;&nbsp;</span>Common date formatting</a></span><ul class="toc-item"><li><span><a href="#Explanation-of-terms" data-toc-modified-id="Explanation-of-terms-4.1"><span class="toc-item-num">4.1&nbsp;&nbsp;</span>Explanation of terms</a></span></li><li><span><a href="#yy-mm-dd" data-toc-modified-id="yy-mm-dd-4.2"><span class="toc-item-num">4.2&nbsp;&nbsp;</span>yy-mm-dd</a></span></li><li><span><a href="#yy.mm.dd" data-toc-modified-id="yy.mm.dd-4.3"><span class="toc-item-num">4.3&nbsp;&nbsp;</span>yy.mm.dd</a></span></li><li><span><a href="#u-dd,-yyyy" data-toc-modified-id="u-dd,-yyyy-4.4"><span class="toc-item-num">4.4&nbsp;&nbsp;</span>u dd, yyyy</a></span></li></ul></li><li><span><a href="#Rata-Die-(days-since)" data-toc-modified-id="Rata-Die-(days-since)-5"><span class="toc-item-num">5&nbsp;&nbsp;</span>Rata Die (days since)</a></span></li><li><span><a href="#Populate-missing-indicators-with-previously-known-values" data-toc-modified-id="Populate-missing-indicators-with-previously-known-values-6"><span class="toc-item-num">6&nbsp;&nbsp;</span>Populate missing indicators with previously known values</a></span></li></ul></div>

## Overview

### What are Market Indicators?

Market Indicators are **collections of data points** specific to a particular segment of the market, for example:
- "S&P 500" index show how major 500 stocks as a whole are performing
- "ISM Manufacturing" index shows how well the manufacturing industry is doing
- "GDP" index (Gross Domestic Product) shows how the country is doing
- etc., etc., etc.

There are hundreds, if not thousands, of such indicators.

### Project Objectives

- The primary goal of the project is to **gather and analyze** various market indicators.
- The secondary goal is to predict market trends 30 to 90 days ahead. 
- The tertiary goal is to predict a particular stock price based on the market indicators.
- Additionally, the goal will be to maintain a stock portfolio including diversification using "hedge fund" principles.
- Finally, it is my goal to produce a usable code and document the process.

### Why using Machine Learning and not spreadsheets?

The spreadsheets (i.e. Microsoft Excel, Apple Numbers, Google Sheets) and their graphing capability are the bread and butter of market analysis. They are great when comparing only a few indicators.

### Machine Learning approach

The overwhelming advantage of machine learning, or Artificial Intelligence (AI), is apparent when that we try to find subtle **patterns in thousands of indicators**. The human brain (using spreadsheets) fails to grasp the wealth of the information presented. 

The machine learning, on the other hand can easily detect the patterns in massive datasets and derive a conclusion.

### Why Julia?

- Julia is young, fast, elegant, multitasking and does the math extremely well, of course we are talking about [Julia programming language](https://docs.julialang.org/en/v1/)
- unlike C,C++, it is a pleasure to write and read Julia
- it is designed for scientific computing and machine learning
- similarly to C, it is extremely fast
- similar to Python, it is very easy to learn
- it is designed for parallelism
- it is designed for distributed computing

## Data acquisition

### Learn about market indicators
- [indicators that move the market](https://www.investopedia.com/articles/fundamental-analysis/10/indicators-that-move-the-market.asp)

In this project, I started with a couple of dozen common market indicators and plan to expand to as many as I can find and use.

I have written a Julia [notebook](https://github.com/UkiDLucas/MarketIndicators.jl/blob/master/content/02%20Fetch%20Web%20Data.ipynb) that automatically fetched the data from the web and saves it locally as Comma Separated Value (.csv) spreadsheets.

### Download from Yahoo Finance

- [Yahoo Finance > Historical Data > Max](https://finance.yahoo.com/quote/%5EDJI/history?p=%5EDJI)
- [Apple AAPL - finance.yahoo.com]("https://finance.yahoo.com/quote/AAPL/history?p=AAPL")

The Yahoo Finance website is a great source of current and historical data for stocks and market indexes. 

### Download from mql5.com

-[mql5.com](https://www.mql5.com/en/economic-calendar/united-states)

This website is a great source for dozens of market indicators.

## Data Pre-processing

Since the data comes from the different sources, before the analysis, I have to check that it is formatted properly, if it has missing values, if the values are usable.

## Common date formatting

The dates in the spreadsheets, especially these that are entered by hand, have a maddening array of possible formats.

The task of getting all the dates to the same format is crucial and it is done fastest with the spreadsheet.

### Explanation of terms
- u: 3 letter abbreviation of the month in English
- d: 1 or 2 digit day of the month
- y: 4 digit year
- m: 2 digit month (option for you)

### yy-mm-dd
The date format **I chose** is "1950-05-31", or (yy-mm-dd) as it is **less error prone, logical, and easily sortable**.
This format is also used by Yahoo Finance export.

$Dates.Date("1950-05-31", date_format) # results in "1950-05-31"$

### yy.mm.dd
This format is used by MQL5.com, a primary source of indicator data.


### u dd, yyyy
As an example, the standard in USA is "Aug 31, 1950" (u d, y) 



## Rata Die (days since)

Using dates is useful, but the market indicators are not availble on daily basis, most come out bi-weekly, mothly or quarterly, we will have some days that are "missing" in our datasets.

We will assign "[Rata Die](https://en.wikipedia.org/wiki/Rata_Die)", or the "days since the first day" in our data. 

I am using the first day of available data and not some other major date, such as founding of the New York Stock Exchange in 1800s as that numbers would be huge and there would be no useful early data anyway.

## Populate missing indicators with previously known values

- get value for the first row
- for each row starting at row 2
    - get the current value
        - if that value is missing
            - set it to the previus value if you have it
        - if you have current row value
            - set the previous to be equal to current
    
actual code:
column = 6 # choose column to populate
previous_value = df[1, column]

for row in 2:items # start with second row
    
    value = df[row, column] # get value for the current row
    
    if ismissing(value) # need to do something
        if ismissing(previous_value)
            # nothing to populate with, go to the next row
            continue
        else # we have a previous value
            df[row, column] = previous_value
        end
    else # we have a pre-existing indicator
        previous_value = value
    end
end
# Normalize data

Let's say we have two market indicators, one ranges from -1 to 1 and another from 0 to 100. Obviously it is not easy to compare them to see how they influence each other. 

![title](images/not_normalized.png)


Normalization is nothing else than "scaling" the data to be able to compare apples-to-apples.

![title](images/normalized.png)


```julia

```
