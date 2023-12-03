# Reading / Journal 6

## Lists and Loops ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

This should be another review of CIT 120, but depending on what language you focused on there, this might require thinking about lists and loops in an entirely new way.

In languages like C, Java, and most compiled languages, loops are based on the idea of *counting*:

```c
for (int i=0; i < 100; ++i){
  // do something here
}
```

But in Python, Julia, and a handful of other languages, you might write loops like this:

```python
for student in students:
  # do something here
```

And in languages like PHP, you have both options, which uses "for" as the name for the C-style loop and "foreach" as the name of the Python-style loop:

```php
for ($i=0; $i < 100; ++$i){
  // do something here
}

foreach ($students as $student){
  // do something here
}
```

Python-style loops work by *iterating over a the elements in a set*. A "set" is a term from theoretical math. It means a collection of things, no more, no less. The items in that set are called its "elements". For example, each of you is an element in my set of students that I'm teaching this semester.

So, the `for student in students` syntax in Python actually comes directly from the math way of saying this:

![](https://render.githubusercontent.com/render/math?math=x%20\in%20X)

(The &in; symbol means "element in.")

So, Python's for loop syntax is *perfect* for looping over the items in a list. If you want to do a simple counter loop though, you have to "create" a set of numbers to loop over, eg, the list of numbers 0, 1, 2, ..., 99. This is done with the `range` function:

```python
for i in range(100):
  # do something
```

The above is the Python equivalent to my C example earlier.

**Now read Chapters 8 and 9** from our textbook

---

A common thing to do with lists and loops is to calculate summary statistics of the values in those lists, like a mean, median, mode, min, or max.

Making our lives easier, `pandas` can do a lot of that work for us, *once we have our data correctly in a DataFrame/CSV format*.

**Now read the "Stats" section from "10 minutes to pandas"** from <https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html>

**And read "Data Correlations"** from <https://www.w3schools.com/python/pandas_correlations.asp>

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *Reflect on your role within teams. What strengths do you bring, and in what areas do you rely on your teammates?* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.