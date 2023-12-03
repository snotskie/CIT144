# Reading / Journal 9

## Algorithms ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

!!! note "Midpoint Check-in"

    Welcome back from break!

    Since it's the midpoint of our semester, it's a good time check in with how folks are feeling.

    Feel free to reflect in your journal this week on your thoughts on the course so far.

    If you want some survey questions to help get you started, consider these:

    - Approximately how much time have you devoted to this course on a weekly basis thus far?
    - Have you read all of Ms. Knowles' announcements, messages, readings and videos, and other weekly course items? If no, do you pick and choose, or prefer to figure things out on your own?
    - Back in [Lab 1](lab1.md), I had you rank your incoming knowledge on a number of items. Since then, do you feel more knowledgeable with any of those items?
    - Do you have any comments, recommendations, or questions for Ms. Knowles moving forward in the course to help you be successful? Some example things to consider are course design, layout, resources provided, scheduling online meetings, course assistance, assignments, and grades.

Since we are starting to produce plots in Lab 4, I want to start by sharing some reading links that might help support you on that:

**Now read (optional, but recommended) "Plotting"** from <https://www.w3schools.com/python/pandas_plotting.asp>

**And read (optional, but recommended) "Visualization"** from <https://pandas.pydata.org/pandas-docs/stable/user_guide/visualization.html>


**And read (optional, but recommended) the "Boolean indexing" section from "10 minutes to pandas"** from <https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html>

We'll continue to talk about plotting in the next Lab too, but it's good to get some of the reading for it out of the way now.

---

Last week we introduced multiple ways to represent collections of data in Python.

A collection of data is like a database, and a good database lets you do four things: CRUD.

- Create, aka, add new data to your database/collection, like writing a value down when your web scraper finds a positive match.
- Read, aka, access data from your database/collection, like having your program display results. This could be the results for all of your data, results for a certain subset of your data, or all the data for one person/student/website/book/chapter/thing/etc. (whatever your topic is about). This could also be accessing the data from your collection in some particular order, such as the shortest student first.
- Update, aka, modify the data for one item in your database/collection. Maybe you want to count how often a book mentioned Tea and Chair. So we start with a TeaCount=0 and we add +1 to it each time we find a new mention of Tea. That would be an "update" to the data for that book. At the end our program will show the total count, but along the way it would make small, incremental updates. Or, maybe you're in charge of a database for a large bank. Whenever someone makes a deposit, you'll need to make absolutely sure that person's account record is updated properly, else they're gonna be real mad when their rent check bounces next week.
- Delete, aka, remove data for an item from your database/collection. I can't imagine a scenario for your projects in this class where you might need to do this, but we'll talk a little about it, since (1) my imagination is tired today and (2) it's good knowledge to have.

So that's the topic of this week: learning how to think about various CRUD-style algorithms. There's others, but 80% of what you'll do in the future boils down to some creative use of some part of CRUD.

**Now read "CRUD in Series"** from <https://python-tricks.com/crud-in-series/>

---

The *intuition* about what kind of task you're dealing with and how you should approach it, that's the lesson here. The specific code you need to write for your own project, well, that all depends on what your project is.

It's a "teach a man to fish" kind of day.

Let's start with the CUDs and save the R for last, since there's a looong list of Read tasks, while the rest are fairly consistent.

---

**In Create tasks**, you always start with (1) information about a new item you want to add to your collection and (2) a collection that we assume is in a "proper" state. Your task is to ensure that (1) the new item ends up in the collection, (2) no data is deleted, overwritten, or needlessly duplicated, and (3) the collection stays in a "proper" state.

Say our collection is a pair of lists. Paired lists are only "proper" if they stay the same length and in the same order. This would do the trick:

```python
# Our collection: paired lists
students = []
ages = []

# Our Create algorithm
def addItem(student, age):

  # Remember the scope reading back on Week 2ish?
  global students
  global ages
  
  # Modify collections: add the right
  # data to the right collection
  students.append(student)
  ages.append(age)

# Run it!
# Alice should be in our collection with age 18
addItem("Alice", 18)
```

Make sure you're clear on how this code works and how it addresses the task at hand ("creating" and item for our "database") before you move on.

---

**Update tasks** always start with (1) an identifier of what item you want to update, (2) new information to update it with, and (3) a collection we assume is in a proper state. Your task is to ensure (1) the item has the requested changes, (2) no other information changes, and (3) the collection remains in a proper state.

In dictionaries, this is simple:

```python
# Our collection: a dictionary
data = {}

# Our Create algorithm
def addItem(student, age):
  global data
  
  # We assume we're creating it for
  # the first time
  data[student] = age

# Our Update algorithm
def updateAge(student, age):
  global data
  
  # We assume the student already
  # exists so this would update their
  # age
  data[student] = age

# Run it!
# Alice should be in our collection with age 19
addItem("Alice", 18)
updateAge("Alice", 19)
```

But in other collection types, it can get tricky. If multiple items have the same identifier (multiple students have the same name), should you update the information for *all*, *some*, *one*, or *none* of them?

As a default rule, go with *all*. If that seems wrong for your data for your project, ensure that the items have different identifiers. For example, refer to students by their student id numbers, not their first names.

So to do this with paired lists, use a loop with an if:

```python
# Our collection: paired lists
students = []
ages = []

# Our Create algorithm
def addItem(student, age):
  global students
  global ages
  
  students.append(student)
  ages.append(age)

# Our Update algorithm
def updateAge(student, age):
  global students
  global ages
  
  # Find everyone with the requested name,
  # and update their age
  for i in range(len(students)):
    if student == students[i]:
      ages[i] = age

# Run it!
# Four people named Alice should be in our collection all with age 28
addItem("Alice", 18)
addItem("Alice", 19)
addItem("Alice", 20)
addItem("Alice", 32)
updateAge("Alice", 28)
```

This is...fine.

If you have a *loooot* of data, that for loop is going to slow things down. Next week we'll talk more about efficiency. But for most things I can imagine y'all doing in your project, this loop+if tactic will get the job done just fine.

Before we move on, one more Update example:

```python
# Our collection: paired lists
students = []
ages = []

# Our Create algorithm
def addItem(student, age):
  global students
  global ages
  
  students.append(student)
  ages.append(age)

# Our Update algorithm
def happyBirthday(student):
  global students
  global ages
  
  for i in range(len(students)):
    if student == students[i]:
      ages[i] += 1

# Run it!
# Four people named Alice should be in our collection with ages 21, 22, 23, and 35
addItem("Alice", 18)
addItem("Alice", 19)
addItem("Alice", 20)
addItem("Alice", 32)
happyBirthday("Alice")
happyBirthday("Alice")
happyBirthday("Alice")
```

I mentioned way up above that in an Update we might want to increment a value. Here, `happyBirthday` increments the age of all the students whose name match the name given.

---

**Delete** is similar to Update. You begin with an identifier of what to delete and a collection you need to keep in a proper state. And like Update, you need to decide what to do if you have multiple items that match your identifier. And like Update, I recommend defaulting to "all."

Deletes can be tricky, since you can't delete *as* you are looping through the collection finding things to delete. In the for loop in the `updateAge` above, we let `i` run over the length of the list. And if we delete items *inside* the for loop, then the length of our list will change. That can, at best, make logic hard to follow. At worst, it can lead to crashes and accidentally deleted data.

So how *should* you write a Delete?

This is actually such a good efficiency problem that I want to save it for next week. In short: It depends on how much data you have total, how many items you are likely to need to delete in one go, and what type of collection you have.

---

**All that's left is Read**. Like everything above, you begin with a collection. Optionally, you might also begin with information relevant to that collection. But you *never* modify the data in your collection while you read. *Never.*

All Read tasks can be done in three steps:

1. Filter: What items in our collection do we care about for this task?
2. Map: What value(s) do we associate/compute for each of those items?
3. Reduce: What do we do with those values to get "the" answer for this task?

Let's say we want to find the oldest age of students whose names start with the letter "A".

1. Filter: Only students whose names start with the letter "A"
2. Map: Their age, represented as a number
3. Reduce: The maximum of those numbers

This could be written a hundred different ways in Python. A super handy way is the "list comprehension" syntax. It's very odd, but also very worth learning. Don't abuse it.

```python
# Our Read algorithm
def oldestWithLetter(letter):
  global students
  global ages
  
  answer = max([ # the Reduce part: find the max of these ages
    ages[i]      # the Map part: we want the age associated with index i
    for i in range(len(students)) # just a loop
    if students[i].startswith(letter) # the Filter part: we only care about students with matching names
  ])
  
  return answer
```

You don't have to use "list comprehension" syntax. This will do the same job just fine:

```python
# Our Read algorithm
def oldestWithLetter(letter):
  global students
  global ages
  
  answer = students[0] # a bad first guess
  for i in range(len(students)): # a loop
    if students[i].startswith(letter): # the Filter part: we only care about these students
      if ages[i] > answer: # the Reduce part: simple logic for finding the max ourselves
        answer = ages[i]
  
  return answer
```

Read tasks will make up a *lot* more of your code than any of the CUDs.

Why? CUD just gets your data together. Doing that is relatively straightforward.

But all the steps after that? That's the fun stuff. That's where we're summarizing our data in several, different, meaningful ways, and each needs its own custom Read.

You likely have multiple things you want to "see" from your data. Maybe it's minimums, maximums, averages, which of two groups tended to have a bigger value, or even a plot (a plot is just a Reduce in fancy clothes).

But *no matter* what you want to do with your Read though, you can think through it with a Filter/Map/Reduce.

**Now skim "Map, Filter, Reduce"** from <https://web.mit.edu/6.005/www/fa15/classes/25-map-filter-reduce/> (There's Java at the top, which you don't need to understand to get the gist; there's Python after that intro)

**And watch "Intro to Algorithms"** from <https://www.youtube.com/watch?v=rL8X2mlNHPM>

**And watch the first two videos** from <https://www.youtube.com/playlist?list=PLftH_KTPtiBKPAbFwv0srGgzxVZFm65JX> (That's a great set of videos if you want to go much deeper into algorithms. I won't require the whole thing for this class, but bookmark it for yourself for later.)

**And read Chapter 12 and about the first half of Chapter 13** from our textbook (Search is a bare bones Read -- just find one value --, and Sort is a pretty complex Update or Read -- update the order of the items in the list without losing or duplicating anything)

In a few weeks we'll also read about Group By operations. Again, that's just a fancy Read. And when we get to Group By, you might think of them as:

1. Filter individual rows
2. Map
3. Group rows into multiple sub-collections
4. Reduce within each of those sub-collections to get one intermediate result for each
5. Reduce those intermediate results into a single final result

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *Share a science experiment or discovery that seems too strange to be true.* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.