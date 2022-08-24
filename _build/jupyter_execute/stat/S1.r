# Exploratory Data Analysis

## Data

Two key questions for analyses of data in statistics are:

1. Shape?
2. Outliers/skew?

For shape, we would like to know whether the distribution is **normal** (bell-shaped). Is it *uniform* meaning all outcomes are equally likely? Is it some other known distribution like the binomial distribution? The most significant shape for introductory statistics is the **normal distribution** since parametric statistical tests like the $z$-test, the $t$-test and ANOVA are built on assumptions of normality. The second question is whether or not skew and outliers exist because we often must treat skewed data and outliers with care and possibly different tools. The first steps of data analysis are to generate numeric descriptions of the data (descriptive statistics) and typical graphical displays of data like histograms, stem plots. 

````{seealso}
**Data Visualization.** Data scientists use more robust analytic tools and have entire courses on data visualization which is the art of creating visual displays that tell a story about the data. To understand more about the groundbreaking work in data science, check out several data visualizations at the Pew Research Center regarding [political beliefs in the US](https://www.pewresearch.org/fact-tank/2014/12/29/our-favorite-pew-research-center-data-visualizations-from-2014). Also check out this [blog post](https://visme.co/blog/best-data-visualizations) where data science and artwork intersect</a> or this marketing blog with [16 great examples](https://blog.hubspot.com/marketing/great-data-visualization-examples) of data visualizations.

As data science progresses, more and more exciting avenues exist for displaying and visualizing data. In this course, we will provide the basic numeric and graphic approaches to summarizing data. You're learning some R coding along the way. By the end of this course, if you're interested, a few hours will be all you will need to teach yourself to produce some pretty powerful visualizations of your own with RStudio.
````

## Types of Data
Data come in two varieties: **quantitative** (numeric) or **qualitative** (categorical) data. Poker player Pete plays Heads Up tournaments with a 20 dollar buy-in (HU20). These two-player tournaments take less than half an hour where he either loses 21, or wins 19. (The online casino takes a cut of each tournament buy-in, called the *rake*.) Pete's HU20 win-loss record is *category data*, a series of W's and L's.

Pete's friend Mandy, a math major with a stats minor at North Georgia, enjoys 6-max NL10, an action-intensive version of No Limit Texas Holdem with a maximum of 6 players at the table rather than the standard 9 or 10 players per table. Mandy's list of winnings from her past twenty cash game sessions is *numeric data*.

For numeric data sets, we have a **sample** of $n$ data points: $\left\{x_{1},x_{2},\dots, x_{n}\right\} \in X$.

## Parameters and Statistics

In statistics, we use two different sets of symbols to refer to the mean and standard deviation:

$$\begin{array}{c|cc}
&\text{Population}&\text{Sample}\\ \hline
\text{AVG}&\mu&\bar{x}\\
\text{SD}&\sigma& s\\
\end{array}$$

The population parameters $\mu$ and $\sigma$ are rarely known. Much of statistics is about estimating these parameters using the sample statistics $\bar{x}$ and $s$ respectively. For example, a poker player's distribution of winnings (per 100 hands) is a normal distribution. True win rates are not known. Winning poker players often suffer long colds streaks. Over time, things average out. We don't know Mandy's average win rate, $\mu$, but we can take sample of recent sessions and estimate it with $\bar{x}$.

````{admonition}
:note: Initialization Block
The **Mosaic** package was created by statistics instructors to help students learn the coding in R. Commands are streamlined to be more intuitive. Installing **Mosaic** (Tools: "Install Packages") must only be done once (and takes 60-90 seconds). After that, we use the **library** function to load it. Aren't sure? If you execute the code block below, RStudio will prompt you to install **Mosaic** if needed.
```
library(mosaic)
```
````

## Exploratory Data Analysis: Mandy's Winnings

Mandy's result from her last 2,000 hands of online poker are shown below. Poker players report win rates in units of BB/100, or big blinds per hundred hands, so she created 20 groups of 100 hands each using random samples of her recent sessions. She plays NL10 which is poker parlance for No Limit Texas Holdem with a big blind (similar to an ante) of a dime. Her first session shown in the data set below is +28 BB/100 which means she won 2.80 over the course of those 100 hands.

$$\begin{array}{|rrrrr|}\hline
28&11&18&35&36\\
6&-38&14&-19&43\\
-14&-30&-16&-25&0\\
40&16&-79&3&11\\ \hline
\end{array}$$

Let's load this data set into R and demonstrate how to find these descriptives along with producing some typical graphics. Often, we will import data sets or even generate them with code and randomization, but we can enter the data directly, too. Let's create a variable $W$ in RStudio and enter Mandy's winnings. 

```
W = c( 28, 11, 18, 35, 36, 6, -38, 14, -19, 43, -14, -30, -16, -25, 0, 40, 16, -79, 3, 11)
```
The operator $\fbox{c}$ in the code above is the concatenate function which creates a vector from the numbers separated by commas. Once this line executes, the vector **W** is loaded into R and ready for our basic commands.

## 1. Descriptive Statistics
Native R does not have a single function that generates all the needed descriptive statistics, but Mosaic does. The **library** command asks R to load the Mosaic package.

```
favstats(W)
```

**Standard Descriptives** are the statistics all researchers compute for every numeric data set:

$$\begin{array}{lccr}
  \textbf{Statistic} & \textbf{Symbol} && \textbf{Value}\\ \hline
  \text{Mean} & \overline x & = &  `r paste(mean(W))`\\
  \text{Standard Deviation} & s & = & `r paste(round(sd(W),3))`\\
  \text{Sample Size} & n & = & `r paste(length(W))`
\end{array}$$

The **Five Number Summary** uses percentiles to divide up the data into four groups called quartiles. ^[Quartiles refers both the four groups created and to the values Q1, Q2 and Q3 the are the cut points for creating the groups.]

$$\begin{array}{lccr}
  \textbf{Statistic} & \textbf{Symbol} && \textbf{Value}\\ \hline
  \text{Minimum} & \text{Min} & = & `r paste(fivenum(W)[1])`\\
  \text{25th Percentile} & \text{Q1}  & = & `r paste(fivenum(W)[2])`\\
  \text{50th Percentile} & \text{Med}  & = & `r paste(fivenum(W)[3])`\\
  \text{75th Percentile} & \text{Q3}  & = & `r paste(fivenum(W)[4])`\\
  \text{Maximum} & \text{Max}  & = & `r paste(fivenum(W)[5])`
\end{array}$$

### 1.a) Analysis of Descriptives
Two interesting features appear from a glance at these numeric summaries of the data. The most salient detail is that mean and median are quite different. Since the median is `r paste(median(W))` and the mean is `r paste(mean(W))`, their difference is `r paste (median(W)-mean(W))` which is about 1/4 of standard deviation. 

````{hint}
**Robb's Rule of Thumb.** When the mean and median of a data set differ by more than one-tenth of a standard deviation, we should expect skew and outliers. 

$$|\overline x - \text{med}| \geq s\hspace{3mm}\implies \hspace{3mm}\text{check skew}$$

Not official stats info. No one does this but me. Just a helpful way of considering if the the difference between mean and median is significant enough to result in skew or outliers.
````

In this example, because the mean is significantly less than the median, we anticipate skew to the left and outliers, if present, to be on the left, which brings up the second detail one should notice. There is a much longer tail to the left shown the Five Number Summary. The Lower Quartile spans the interval $(-79,-17.5)$ or 60+ units. The upper Quartile spans only $(23,43)$ or 20 units. This indicates likely skew to left since the lower Quartile range is much bigger and hence has more room for outliers.

### 1.b) Standard Deviation and Outliers
The standard deviation can be thought of as a distance metric specific to the data set. Let's take a moment to discover why. Given the data set $X=\{1,2,3,6\}$, we have $n=4$ and $\bar{x}=3$. For any data point, say, $x_1=1$, we can compute the directional distance (or **deviation**) from the mean:
</p>

\begin{align*}d_{i}&=x_{i}-\bar{x}\implies\\
d_{1}&=x_{1}-\bar{x}\\
&=1-3=-2
\end{align*}

For deviations where $x_{i}<\bar{x}$ (below average), then $d_i<0$, e.g. a negative deviation. Positive deviations indicate data points that are above average. If we treat the data set $X$ as a column vector $\vec{x}$ and calculate the deviation for each component, we have the deviation vector:

$$\vec{d}_x=\begin{pmatrix}x_1-\bar{x}\\x_2-\bar{x}\\ \vdots \\ x_{n}-\bar{x}\end{pmatrix}=\begin{pmatrix}1-3\\2-3\\3-3 \\6-3\end{pmatrix}=
\left(\begin{array}{r}-2 \\ -1 \\ 0 \\ 3\end{array}\right)$$

The idea for the calculation of a standard distance (deviation) beings with an application of the Euclidean distance metric to $\vec{d}_x$:

\begin{align*}
\left|\vec{d_x}\right|&=\sqrt{(-2)^2+(-1)^2+0^2+3^2}\\
&=\sqrt{4+1+0+9}\\
&=\sqrt{14}\approx3.742\\
\end{align*}

This naive idea would suffice if all data sets were the exact same size. However, we need to adjust for sample size. Let the data set $Y$ be two copies of the data set $X$, so that $Y=\{1,2,3,6,1,2,3,6\}$. Note that we have $\overline{y}=\overline{x}=3$ but with $n_y=8$ where $n_x=4$. 

Compare $|\vec{d}_x|=\sqrt{14}\approx 3.742$ to $|\vec{d}_y|=\sqrt{28}=\sqrt{14}\sqrt{2}\approx5.292$. The magnitutde of the deviation vector for $Y$ is larger, not because the data have spread out more, but simply because there is more data. To ``standardize" this magnitude or distance, we divide by $n$ (or $n-1$) before we take the square root.

\begin{align*}
\sigma_x^2&=\frac{|d_x|^2}{n}\\
\sigma_x^2&=\frac{4+1+0+9}{4}\implies\\
\sigma_x&=\sqrt{\frac{14}{4}}\approx1.871
\end{align*}

Compare this to the sample standard deviation, where we replace $n$ with $n-1$:

\begin{align*}
s_x^2&=\frac{|d_x|^2}{n-1}\\[.2cm]
s_x^2&=\frac{4+1+0+9}{3}\implies\\
s_x&=\sqrt{\frac{14}{3}}\approx2.160
\end{align*}

If you've read this far and understood something about the standard deviation, congratulations. Enough theory, the next short section shows how to use the standard deviation to check for influential data points.

### 1.c) Outliers and Standard Deviation
Because the standard deviation measures distances in a data set, we can check for outliers using it. For small data sets, where $n\leq 50$, *any data point more than two standard deviations from the mean may be considered an outlier*.

We have the data in R, so let's use some quick code to determine the cutoff values at which we would consider a data point an outlier. The R functions **mean** and **sd** will be needed for their obvious purposes.

```{r}
right = mean(W) + 2 * sd(W)
left = mean(W) - 2 * sd(W)
left
right
```


We see that $x=-79<-59.2$ and is an outlier to the left. No data points are larger than $63.15$, so there are no outliers to the right.

## 2. Data Visualization - The Basics 
Data science is a ground-breaking field right now, especially when it comes to data visualizations. 

### 2.a) Histograms
Histograms are bar graphs that show the shape of the data set which, hopefully, gives insight into what the underlying distribution might look like. 

Histograms have rules. The rules keep data presentations uniform so that it's more difficult to lie with statistics, a favorite pass time of politicians and media pundits. Researchers don't wish to lie with statistics. They hope to present their findings to the scientific community without bias. Scientific reports use only histograms with:

* Single color
* Entire $y$-axis shown
* Equal bin width
  + All bins / categories intervals of same length, which leads to...
  + All bars have same width
  
```{r}
histogram(W)
```
Histograms are built on frequency tables which groups the entries in the data set into bins or categories, then counts the number of entries in each category. The default histogram above looks wonky. The bins are intervals along the $x$-axis, but R has chosen them in a weird way. They should obviously be in units of 10 or 20 given the data range, and centered on something divisible by 10. We can have RStudio create a frequency table based on a bin width of 20, then show how to adjust the histogram to display something more reasonable. We'll view the frequency table but suppress the R code that generates it, as you won't be responsible for creating frequency tables in R.


```{r echo = FALSE}
bins <- seq(-80, 60, by = 20)
Bins <- cut(W, bins)
transform(table(Bins))
```

<div style="float:right; margin: 8px; border:2px black solid; padding: 0px 10px 5px">
#### Histogram Option: Type
The **type** parameter is cosmetic. The $y$-axis</br>
units change from density to counts so we can see</br>
how many data points fall into each bin.
</div>

<p>We want to force RStudio to use the bin widths we want. The **width** parameter will force a bin width of our choosing, and the **center** parameter forces a single bin to be centered at that point. All  bins have equal widths so we don't have to specify the center of the histogram, just the center of one bin. We created a frequency table with a bin width of 20 above, and the center of each bin is an odd multiple of 10. </p>
<div style="clear:right;"></div>

```{r}
histogram(W, width = 20, center = 10 , type = "count")
```

R has a standard way to add headings and labels, so let's add a few upgrades to our histogram. We use the **main** parameter to provide a title, and **xlab** and **ylab** to label the axes. Let's also try a bin **width** of 10. Lastly, we'll superimpose a bell-curve with the **fit** parameter asking for a fitted normal distribution overlay.

```{r}
histogram(W,
     width = 10,
     center = 0,
     fit = "normal",
     main = "Histogram: Mandy's Winnings",
     xlab = "Dollars Won or Lost",
     ylab = "Sessions")
```

## 2.b) Box Plots
The standard **box plot** is easy to generate and is a visualization of the Five Number Summary.
```{r}
boxplot(W)
```

<div style="float:right; margin: 8px; border:2px black solid; padding: 0px 10px 5px">
### <span style="color: red;">Stem and Boxplots</span>
**Stem** and **Boxplot** are not *Mosaic* functions and</br>
thus use the **DataFrame$Variable** format where a</br>
dollar sign indicates a variable within a data frame.
</div>

The box in a boxplot shows the middle the 50% of the data set. The line breaks are at the quartiles, and the tails are shown outside the box so that skew can be detected. We always prefer for the boxplot to check for outliers as is the case here.

Vertical box plots are especially useful when we're displaying several at once, but the horizontal box plot better parallels the histogram presentation because the $x$-axis is the same. The title and labels work the same as before.
```{r}
boxplot(W, horizontal = TRUE,
     main = "Boxplot: Mandy's Winnings",
     xlab = "Dollars Won or Lost")
```

Notice the outlier to the left marked by the open dot. We often use the IQR (inner-quartile range) in the Five Number Summary to detect outliers, where IQR is the distance between Q1 and Q3. $$\text{IQR}=\text{Q3}-\text{Q1}$$ We calculate the fences as follows:

\begin{align*}
\text{Upper Fence}&=\text{Q3}+1.5\times\text{IQR}\\
\text{Lower Fence}&=\text{Q1}-1.5\times\text{IQR}
\end{align*}

Any data points below the Lower Fence are outliers to the left. Any data points above the Upper Fence are outliers to the right. Any data points that land exactly on a fence are *not* considered outliers.

## 3. Data Analysis Results for Example 1
The histogram shows an approximate bell-shape. Why? Consider the tallest bar. Then view the tails to either side of it. Both tails clearly exist, and we can consider this data set as having been sampled from a distribution that is approximately normal. The boxplot shows an outlier to left as well as a skew to the left which was also visible in the histogram which had a much longer tail to the left.

Our final word? An approximately normal (bell-shaped) distribution with skew to the left.

# <span style="color: blue;">III. Other Visualizations</span>

<div style="float:right; margin: 8px; border:2px black solid; padding: 0px 10px 5px">
### <span style="color: red;">Stem and Boxplots</span>
**Stem** and **Boxplot** are not *Mosaic* functions and</br>
thus use the **DataFrame$Variable** format where a</br>
dollar sign indicates a variable within a data frame.
</div>

## Stem Plots

An interesting visualization is the stem-and-leaf plot which uses the numbers in the data set to create a histogram-like display. Often useful, the scaling is important. Try different scales like 1 or 2 and you'll find the display is hopeless for showing anything about the data.

```{r}
stem(W, scale = 3)
```
When scaled properly, however, we get a end up with a histogram (if we rotate our paper 90 degrees). We can read off all the values in the data set which makes finding the Five Number Summary pretty easy. For more details about creating and interpretting stem plots check out this <a href="https://www.youtube.com/watch?v=PSrCxsIgPFU">Youtube video</a>.

Two disadvantages of stem plots should be obvious. First, with some data sets we cannot get them scaled properly. The requirement that the bins be equally spaced limits how we can proceed since we have only ten digits. Second, big data sets defy stem plots. Even if a machine can create it, it's not readable if there's more than a couple hundred data points.

## Density Plots
The **density plot** is a hybrid. It shows the data points along the $x$-axis and an envelope above them showing a histogram-like shape. The taller the envelope gets, the more closely the data are clumped together right below it. Where the data points are spread out, the envelope curve is near the $x$-axis.

```{r}
densityplot(W)
```
This is perhaps the best visualization of the skew to the left. We can also see that Mandy tends to win a lot of small amounts, with many of the data points between 0 and 20. A few of the losses are huge which leads to longer tail to the left.

# <span style="color: blue;">IV. Visualization Example: Old Faithful Geyser</span>
R has preloaded data sets like **faithful**, a data frame with two variables: eruptions and waiting. Both are time variables. Eruptions is number of seconds the eruptions lasted. Waiting is the time interval between eruptions. By just typing the name of the data frame, R will print out a preview.

```{r}
faithful
```
Note the 272 rows refers to 272 eruption-waiting pairs of values, so both numeric data sets have 272 entries.

## Two Variable Plots
One might wonder if longer waiting times correlate with longer eruptions. Perhaps more pressure builds up, then when released the eruptions last longer. Let's check a scatter plot. The first argument is the form $y\sim x$. The $y$-variable is the dependent variable, the $x$-variable independent. In this setup, we are implicitly suggesting that the variable **eruptions** depends upon the variable **waiting**. If we reverse the order, we reverse the implicit dependence.

```{r}
xyplot(eruptions ~ waiting, data = faithful)
```
There does seem to be a pattern. A quick of the correlation verifies there is a strong, positive correlation.

```{r}
cor(eruptions ~ waiting, data = faithful)
```
We will discuss correlation and regression later in the course, but keep in mind that exploratory data analysis often involves studying related variables in data sets, both together and separately.

## Data Analysis: Old Faithful Waiting Times
Let's start with the numerics. When using a data frame -- a data object with more than one variable -- we first specify the variable we want to analyze, then the data frame where it will be found. The reason for the tilde (~) will be clear shortly.
```{r}
favstats(~ waiting, data = faithful)
```
By Robb's Rule of Thumb, the mean is significantly less than the median, so we expect skew and outliers to the left. However, the lower and upper quartiles of the Five Number Summary are intervals with roughly the same length, 15 vs. 14.

```{r}
histogram(~ waiting, data = faithful)
```
This appears to be bimodal data, a histogram with two peaks. While there a large cluster of values around 80 seconds, there is a secondary clustering around 55. The bimodal shape likely accounts for the difference in mean and median, rather than outliers to the left (though they may still exist).

The boxplot function will produce a boxplot for every variable in the data frame by default.

```{r}
boxplot(faithful, horizontal = TRUE)
```
Notice there are no outliers, so our guess about the bimodal tendencies causing the disparity between mean and median seems justified. The density plot is instructive, too.

```{r}
densityplot(~ waiting, data = faithful)
```


## Data Analysis: Old Faithful Eruption Duration Times
The mean appears to be significantly less than the median (rule of thumb), so we expect skew and outliers to the left. 
```{r}
favstats(~ eruptions, data = faithful)
```
Again, the Five Number Summary seems to belie this analysis, so perhaps there is a bimodal pattern in **eruptions**, too. 

```{r}
histogram(~ eruptions, data = faithful)
```
The bimodal pattern is even more stark. While the **waiting** histogram might still have qualified in a loose sense as approximately bell-shaped, these data surely do not. The box plots above showed no outliers in either data set. Again, the density plot shows the pattern clearly.

```{r}
densityplot(~ waiting, data = faithful)
```




What have we learned? We have two bimodal variable that are strongly correlated. Hopefully we have also learned that exploratory data analysis (EDA) is just that - exploring. We don't typically find cut-and-dried answers. Real-world data is real messy. We need flexible tools to analyze many varieties of data and to discover patterns. We need minds as flexible as our tools because EDA is often more art than science.

# <span style="color: blue;">V. Data Analysis Example: Births and Day of the Year</span>

Consider how many babies were born the different days of the year. Several patterns are apparent, but what is the cause? ^[Idea and code from *Start Teaching with R* by Prium, Horton and Kaplan. See <a href = http://www.mosaic-web.org/go/teachingRlicense.html>Project Mosaic website</a>].

```{r}
Births78
```


```{r}
xyplot(births ~ day_of_year, data=Births78)
```
Think about what this means. Perhaps some data visualization with color coding will help.

```{r}
xyplot(births ~ day_of_year, data = Births78, 
       groups = wday,
       main = "Births vs. Day of Year for 1978",
       xlab = "Day of Year",
       ylab = "Births"
       )
```

# <span style="color: blue;">VI. Exercises</span>

1. Using the built-in R data frame **ChickWeight** which examines weight vs age of chicks on different diets, conduct an analysis of the variable **weight**. Include all relevant plots, and include titles and axis labels for your histogram and density plot.

<div style="float:right; margin: 8px; border:2px black solid; padding: 0px 10px 5px">
### <span style="color: red;">Built-in R Datasets</span>
R has dozens of built-in data frames like **iris**.</br>
Type variable name only and execute code block.</br>
Output shows headers, variable names and</br>
observations. Search variable name in help tab</br>
of bottom-right panel for details.
</div>

2. Using the built-in R data frame **InsectSprays** which examines the number of insects in an area depending upon type of insecticide used, conduct an analysis of the variable **count**. Include all relevant plots, and include titles and axis labels for your histogram and density plot.

3. Use the built-in R data frame **cars** which compares the numeric variables **speed** measured in miles per hours (mph) and stopping distance (variable is **dist**, measured in feet). The data is from the 1920's, by the way. Create an **xyplot** for the two variables, and include axis labels on your plot.

4. Using the built-in R data frame **mtcars** which includes miles per gallon and ten other variables for 32 different models in 1974, create an **xyplot** for miles per gallon (**mpg** variable) vs. displacement (**disp** variable) using a grouping variable of transmission type, automatic vs. manual (**am**).

5. Using the built-in R data frame **Dimes** which compares the mass of a dime to the year in which is was minted, conduct an analysis of the variable **mass**. Include all relevant plots, and include titles and axis labels for your histogram and density plot.

