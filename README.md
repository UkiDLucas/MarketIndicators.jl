# MarketIndicators.jl

*by [Uki D. Lucas](https://www.linkedin.com/in/ukidlucas/)*

This project was started in August 2020 on [GitHub](https://github.com/UkiDLucas/MarketIndicators.jl)

#### TOC

- [Overview](#Overview)
    - [What are Market Indicators?](#What-are-Market-Indicators?)
    - [Project Objectives](#Project-Objectives)
    - [Why using programming, not spreadsheets?](#Why-using-programming,-not-spreadsheets?)
        - [Machine Learning](#AI)
    - [Why Julia?](#Why-Julia?)
- [Data Aquisition](#Data-Aquisition)
- [Data Pre-processing](#Data-Pre-processing)
    - [Common date formatting](#Common-date-formatting)
    - ["Rata Die" (days since the first date)](#Rata-Die-(days-since))

# Overview

## What are Market Indicators?

Market Indicators are numeric values assigned to particular aspect of the market performance, for example:
- "S&P 500" index show how major stocks as a whole are performing
- "ISM Manufacturing" index shows how well the manufacturing industry is doing
- "GDP" index (Gross Domestic Product) shows how the country is doing
- etc., etc., etc.

There are hundreds, if not thousands, of such indicators.

## Project Objectives

1. The primary goal of the project is to gather and analyze various market indicators.
2. The secondary goal is to predict market trends 30 to 90 days ahead. 
3. The tertiary goal is to predict a particular stock price based on the market indicators.
4. Additionally, the goal will be to maintain a stock portfolio including diversification using "hedge fund" principles.
5. Finally, it is my goal to document the process.

## Why using programming, not spreadsheets?

The spredsheets (i.e. Microsoft Excel, Apple Numbers, Google Sheets) and their graphing capability are the bread and butter of market analysis. They are great when comparing a few indicators.

### AI
The advantage of machine learning, or Artificial Intelligence (AI), is when that we have thousands of possible indicators, the human brain fails to grasp the wealth of the information presented. 

The machine learning, on the other hand can easily detect the patterns in thousands of datapoints and derive a conclussion.

## Why Julia?

- Julia is young and sexy (we are talking about [Julia programming language](https://docs.julialang.org/en/v1/) here)
- it is a pleasure to write and read (unlike C,C++)
- it is designed for scientific computing and machine learning
- it is extremely fast (similarly to C)
- it is very easy (similary to Python)
- it is designed for parallelism
- it is designed for distributed computing

# Data Aquisition

## Learn about market indicators
- [indicators that move the market](https://www.investopedia.com/articles/fundamental-analysis/10/indicators-that-move-the-market.asp)

# Data Pre-processing

## Common date formatting

The dates in the spreadsheets, especially these that are entered by hand, have a maddening array of possible formats.

The task of getting all the dates to the same format is crucial and it is done fastest with the spreadsheet.

The date format **I chose** is "1950-05-31", or (yy-mm-dd) as it is **less error prone, logical, and easily sortable**.

$Dates.Date("1950-05-31", date_format) # results in "1950-05-31"$



Alternatively, you can choose "Aug 31, 1950" (u d, y) as this is a standard in USA.

Explanation of terms:
- u: 3 letter abbreviation of the month in English
- d: 1 or 2 digit day of the month
- y: 4 digit year
- m: 2 digit month (option for you)

## Rata Die (days since)

Using dates is useful, but the market indicators are not availble on daily basis, most come out bi-weekly, mothly or quarterly, we will have some days that are "missing" in our datasets.

We will assign "[Rata Die](https://en.wikipedia.org/wiki/Rata_Die)", or the "days since the first day" in our data. 

I am using the first day of available data and not some other major date, such as founding of the New York Stock Exchange in 1800s as that numbers would be huge and there would be no useful early data anyway.


```julia

```
