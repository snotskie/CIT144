# Reading / Journal 2

## Functions and Scopes ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

First, a moment to reflect as we start this semester.

Consider how you have enrolled in an online course.

There are several benefits of online over face-to-face:

- Working online now will prepare you to work online in the future.
- You can "go to class" whenever and wherever you want.
- Lecture notes and other materials can be paused, reviewed, etc. as much as you need to learn in your own way.

But there are also some difficulties students have had in online courses:

- Students not familiar with technology may be asked to perform technological tasks. Keep in mind that you are not being graded on technical expertise unrelated to this course. If you are having problems, email me or post in Ask the Instructor.
- Students will be asked to use the internet more regularly than they are used to. You will need to check your email daily. You will need to engage with your teammates, when applicable, as often as your team requires. I suggest setting the "rules of engagement" that your team will follow on your first day together.
- Online interaction can be intimidating. We cannot see each other to respond to facial expressions, so all of the pressure is put on our writing abilities to communicate well. For those of us not used to this, this will take time and practice, but it will come.

So, there are two messages from me you'll hear over and over again:

- You are doing good work. Keep it up
- I am *always* happy to help, shoot me an email anytime

---

Now, on to the reading.

When you write functions of your own in Python (as a way to help organize your code and make snippets of logic more repeatable), just like last week, *indentation matters*.

For example:

```python
def addEmUp(x, y):
  # This is *inside* the function
  return x + y

# This is *outside* the function
print(addEmUp(10, 1000))
```

All the "logic" for a function must be contained inside it, denoted by indentation under it.

If you have the e-book copy of the textbook, then the indentation might not show up properly, so keep that in mind. Prefer the PDF copy or the hardcopy of the textbook if you have those options.

Another important note about Python is the way it manages "scope."

Scope refers to where in a program a variable can be accessed. Python is a little different from other languages in that it has "function-level local scoping." Languages like C, C++, C#, and Java have *block-level* scoping. JavaScript is actually closer to Python, since it has function-level scoping too, but even then it has small differences.

So, what do you think this code does?

```python
def doSomeMath(parameter):
  x = parameter
  return x

x = 10
doSomeMath(1000)
print(x)
```

Answer, it prints 10.

The `x` on lines 5 and 7 is a *different* `x` than the one inside the function on lines 2 and 3. This is because variables assigned values within a function *only exist within* that function. We have a *global* variable `x` on line 5, and a *local* variable `x` on line 2. This isn't that confusing, though. Two students in the same class can have the same name and we can tell them apart quite easily. The "outside `x`" has value 10, and the "inside `x`" has value 1000. Since we are printing the "outside `x`," we print 10.

If you want a function to be able to modify a variable outside of itself, then it's easy, you just have to tell it that you mean the *global* `x`, not some new local version.

This will print 1000:

```python
def doSomeMath(parameter):
  global x
  x = parameter
  return x

x = 10
doSomeMath(1000)
print(x)
```

On line 2 we specify that we mean the global `x`, so that one `x` changes from 10 to 1000, so on the last line we print 1000.

Long story short though, if you are in a situation where you think you need access to a global, then you are probably going about your logic wrong or in a roundabout way.

**Now read "Python Scope"** from <https://www.w3schools.com/python/python_scope.asp>

**And read Chapter 3** from our textbook

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *What’s your go-to lunch on hectic days?* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.