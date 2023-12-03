# Reading / Journal 4

## Logic and Modules ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

Again, this should be mostly review of CIT 120.

This week we are learning if/else and modules in Python.

First, in Python, the values for true and false are capitalized like proper nouns. This is unlike every other single language I know, so watch out for this.

```python
isHumidInWisconsinSummer = True
isFreeOfSnowInWinterHere = False
```

Second, when you chain if/else's together, we use `elif` for the middle sections, an abbreviation of "else if":

```python
if age < 13:
  print("Let's get good grades!")
elif age < 18:
  print("Take good care of your skin!")
else:
  print("Dont' forget to file taxes!")
```

Third, on a different topic, so far we've only talked about writing code in a single file.

To import code from other files, we treat them as "modules" and import them. This is useful when you have large project you want to organize, you are working in a team, or you are loading code written by someone else (which we'll do with Pandas/Matplotlib for the term project).

For example:

```python
from pandas import read_csv
```

This will load the `pandas` module then specifically grant your program access to the `read_csv` method that is defined in that module.

You could alternatively do:

```python
from pandas import *
```

This will import *everything* from `pandas`, no matter what it is or what it is called.

In this class, I prefer you used the more explicit version (like `from pandas import read_csv`) unless you have a good reason to ask for everything.

Doing the more explicit version will make you more deliberate in your coding, and it makes it easier to rename things if you want to load things from two different modules that would have the same name. For example, if you are writing a web scraper, you might do:

```python
from parse import search
from re import search as regex
```

Here, we load `search` from `parse` and we also load `search` from `re`. But since those have the same name, we rename the second one to `regex` so we don't [clobber](https://en.wikipedia.org/wiki/Clobbering) the first name.

You might also see syntax like this:

```python
import pandas as pd
```

Here, we import everything from `pandas`, like `read_csv`, but we can only access them by prefixing like `pd.read_csv`. Still, I prefer the more deliberate `from pandas import read_csv` approach. As you will see though, every place you read about Python, authors have their own preferences they stick to, which is perfectly fine. Notice the preferences of others, be aware of your own preferences, and practice converting between the two as you learn from others while designing your own code.

**Now read "Python Modules"** from <https://www.w3schools.com/python/python_modules.asp>

**And read Chapters 5 and 6** from our textbook

And in particular, let's become more familiar with the `pandas` module I've been mentioning.

**Now read "Pandas DataFrames"** from <https://www.w3schools.com/python/pandas_dataframes.asp>

**And read "Pandas Read CSV"** from <https://www.w3schools.com/python/pandas_csv.asp>

**And read the "Viewing Data" section from "10 minutes to pandas"** from <https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html>

**And peruse the site** <https://catalog.data.gov/dataset?res_format=CSV> to get a feel for what kind of CSV data is already out there

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *Share a tech tip, shortcut, or hack that you find invaluable* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.