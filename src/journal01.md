# Reading / Journal 1

## Up and Running ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

This first unit will be mostly review of CIT 120, and depending on what you covered in your 120, this may be more review for some than others.

First, how do you run Python?

One option is online, in your browser. I recommend <https://repl.it/>, since it's free (requires a free account) and it auto-saves like a Google Doc. There are limitations, but I don't think we will hit them in our class. If you don't have a strong preference in how you run Python, go with this one.

Another option is running Python on your own computer. If you are on Linux or Mac, then Python should already be installed by default. If you are on Windows, then you can install Python from <http://python.org/>. If you need a text editor, I recommend either the IDLE program that comes with Python (on Windows) or the Visual Studio Code (VSC) editor from <https://code.visualstudio.com/>. (See also the Python in VSC tutorial at <https://code.visualstudio.com/docs/languages/python>.)

Second, Python uses indentation religiously.

While good indentation is a good idea in other languages, it is *required* in Python, and you have to get it *perfect*. Good news though, text editors do a good job of helping you out there.

For example, this is incorrect and will cause an error:

```python
if x > 0:
print("x is positive")
```

But this is perfect:

```python
if x > 0:
  print("x is positive")
```

It doesn't matter if you use two spaces, four spaces, fourty-two spaces, or a press of the tab key as your indentation. What matters is that, whatever you choose, you are consistent. I personally prefer two spaces per indentation. So that's two spaces for the first level of indent, then four, then six, ...

```python
if x > 0:
  if x < 100:
    if x % 2 == 0:
      print("x is an even number between 0 and 100 exclusive")
```

I also prefer that, after "coming down" from one or more levels of indentation, I leave a single blank line.

```python
if x > 0:
  if x < 100:
    if x % 2 == 0:
      print("x is an even number between 0 and 100 exclusive")

print("now we're done")
```

That is not required, but makes code more readable.

Finally for today, Python uses dynamic typing.

This means that a variable can be a string one second, then changed to an integer later. This is a big contrast to languages like Java and C which use static typing (once something is a string it is always a string).

```python
x = 1
print("x is a number")
x = "hello world"
print("x is now a string")
```

Also notice that you don't have to say what type a variable is when you make it. Contrast that to this in Java:

```java
// Inside the main
int x = 1;
String y = "hello world";
```

You can largely ignore specifying types in Python, so long as you manually keep track of them in your head and are careful about your logic. Newer versions of Python have added support for "type hinting" which helps external tools verify your logic. (Python itself is more than happy to attempt running logic with incorrect types.) You can read more about type hinting at <https://docs.python.org/3/library/typing.html>.

**Now read Chapters 1 and 2** from our textbook

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *Share a personal achievement or milestone you reached recently, no matter how big or small.* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.