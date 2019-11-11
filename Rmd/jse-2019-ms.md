A framework for mentored data science research projects
================
Frederick J. Boehm and Bret M. Hanlon
8/20/2019

Last modified: 2019-11-11 09:56:36

## Abstract

To explore social media data science as a pedagogical tool, we develop a
teaching and mentoring framework to guide undergraduate researchers
through individualized research projects. We demonstrate our approach by
describing our mentoring experience with two undergraduate researchers.
These projects involved Twitter data, Facebook data, topic modeling, and
sentiment analysis. Our framework involves research question
formulation, data acquisition, data analysis and visualization, and
presentation of results. Our two student projects, which serve as case
studies for our framework, completed all components of the
individualized research projects. We found that research skills,
self-confidence in research ability, and professional interest in data
science increased for both students. Below, we describe our successes,
lessons learned, and ideas for others to build similar frameworks for
future honors projects.

## Introduction

## Methods

We designed and used a framework for mentored undergraduate data science
research projects with big data. Our framework draws heavily on ideas in
Nolan and Temple Lang (2010). Specifically, we incorporate the three key
aspects that Nolan and Temple Lang (2010) identified:

1.  broaden statistical computing to include emerging areas
2.  deepen computational reasoning skills
3.  combine computational topics with data analysis in the practice of
    statistics

### Broaden statistical computing to include emerging areas

Our framework broadens statistical computing by including the emerging
areas of social media data analysis, sentiment analysis, and topic
modeling. Both students used Twitter tweets, which we accessed through a
Twitter streaming API.

Our computational system for acquiring tweets involved several steps. We
interacted with the API via the R package `twitteR` (Gentry 2015). We
used the free Twitter streaming API that gave us access to approximately
one percent stream of all tweets during the specified query time period.
To ensure that we collected tweets continuously, we used the linux tool
`crontab` to execute our R script every five minutes. Each execution of
the R script performed a single streaming API query, lasting five
minutes. Twitter’s streaming API, at the time of our data collection,
enforced rate limits on the frequency and duration of queries. With the
above settings, we continuously collected tweets.

### deepen computational reasoning skills

Our framework, and the projects developed under it, encourage students
to deepen computational reasoning skills in several ways. First, they
work with a variety of internet-based data to answer research questions.
In the two example cases, our students collected tweets over time and
gathered complementary data from other resources, including daily
closing prices of stock market indexes. This gave students opportunities
to think creatively about what data to acquire and how to use multiple
data sources in a single cohesive project.

Second, the students worked with a variety of data structures. The
Twitter streaming API returns tweets as JSON (Javascript Object
Notation, <http://json.org>). Because distinct Twitter users may provide
different pieces of profile information, there is variability in the
structure of each tweet’s JSON. Additionally, tweet metadata fields may
appear in any order
(<https://developer.twitter.com/en/docs/tutorials/consuming-streaming-data>).
Students needed to recognize this and write code that accommodated these
variations in tweet data structure.

Students wrote code to parse and organize tweet JSONs. They organized
their R code into a package, <https://github.com/rturn/parseTweetFiles>.
Each tweet’s JSON included required fields, and, possibly, some optional
fields. The required fields are:

**see
<https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object>**

The evolving nature of JSON tweet structure
(<https://developer.twitter.com/en/docs/tweets/data-dictionary/guides/tweet-timeline>)
required students to write flexible code that could incorporate newly
introduced or deprecated
metadata.

### combine computational topics with data analysis in the practice of statistics

computational topics: LDA & topic modeling; time series analysis;
sentiment analysis.

Both mentored students combined computing with data analysis in the
practice of statistics. They used a combination of latent dirichlet
allocation topic modeling, sentiment analysis, and time series analysis
to reach conclusions about real world data.

Both drew heavily on our collection of tweets. One student examined
Standard and Poor’s 500 index daily closing prices over time. She also
analyzed sentiments from each day’s stock market-related tweets to look
for relationships between tweet sentiment and stock market prices.

Our other student focused on developing detection methods for social
media events through topic modeling of tweets at different time periods.
As a proof of principle, he fitted topic models to collections of tweets
preceding, during, and following the National Football League’s Super
Bowl game. He hypothesized that topics would evolve over time, with
football-related tweets appearing during the football game and
disappearing soon after conclusion of the game.

data analysis and practice of statistics:

Our mentored research framework begins with brainstorming scientific
research ideas based on the student’s interests. This enables us to
craft a project that excites the student. With the results of
brainstorming sessions, we (mentor and student together) formulate the
most promising ideas into scientific hypotheses.

For the most appealing hypotheses, we encourage the student to translate
the scientific question into a statistical question that may be
addressed with data.

Examples may help to demonstrate our approach to identifying a
statistical research question. One of our students had interests in
acquiring and using social media posts. We helped her in brainstorming
ideas for research involving social media like Facebook and Twitter.
Through this brainstorming, we recognized that she had a parallel
interest in financial markets.

study relationships between social media trends and financial market
trends. We helped her to brainstorm related research ideas. We then

**justify each step**

**Maybe use/cite Box’s science and statistics article from… 1976?**

1.  Overview of our framework

<!-- end list -->

1.  student-led, hypothesis-driven research
2.  BH and FB helped with data acquisition
3.  helped with research question formulation
4.  how to describe roles for students v mentors?

Our framework for mentored student research projects involves these
components:

1.  State the questions and research hypotheses that the two students
    chose

2.  Data description

<!-- end list -->

  - how did we/they conceive of projects?

  - how did we balance our input with that of the students?

  - What data did we use?

  - How did we collect data? (which packages, code to sample twitter).
    How did Jinyu get her stock market data?

  - What is the sampling scheme - for the 1% sample - from the entirety
    of Twitter? (Cite the webpage that documents the API)

## Results

We applied the project framework to our mentoring of two students. Both
engaged in 12 months of mentored research during their senior year of
undergraduate studies in statistics in 2015 and 2016.

### Student Outcomes

We subjectively assessed student outcomes through conversations in our
weekly student research meetings.

One student later enrolled in a statistics graduate program, while the
other pursued employment in health care analytics.

### Mentor Outcomes

### Scholarly outcomes & deliverables

## Discussion

### Benefits of our framework

Benefits of our framework include
enhanced

### How does the framework relate to ideas in Nolan and Temple Lang 2010??

### Critiques of our framework

Our measures of students’ self-confidence in research ability was merely
subjective. In future iterations of our framework, we would like to
measure systematic and objective outcomes. One strategy for implementing
this is to administer a survey, such as \_\_\_, both before and after
the mentored research project. We would use validated survey questions
that focused on student beliefs about themselves, their skills, and
their future careers. **maybe list resources for such survey questions**

### Areas for improvement

1.  reproducible research best practices

One shortcoming of our initial framework was the relative lack of
emphasis on best practices for computational reproducibility. This is
one area that we would like to rectify in future iterations. The
University of Wisconsin-Madison has periodically offered a semester
course in best practices for computationally reproducible research. We
especially see version control systems, such as Git and Github, as
essential tools for the modern data scientist.

## References

<div id="refs" class="references">

<div id="ref-twitteR">

Gentry, Jeff. 2015. *TwitteR: R Based Twitter Client*.
<https://CRAN.R-project.org/package=twitteR>.

</div>

<div id="ref-nolan2010computing">

Nolan, Deborah, and Duncan Temple Lang. 2010. “Computing in the
Statistics Curricula.” *The American Statistician* 64 (2). Taylor &
Francis: 97–107.

</div>

</div>
