# Lab 1

## Introduction 🧑‍🔬

Labs provide hands-on experience with course material. They have three parts: review questions, guided exercise, open-ended exercise.

The first few Labs provide practice with fundamentals, and the later Labs go hand-in-hand with the term project check-ins.

Tips are at the very bottom. You should read them.

## Part 1/3: Review Questions

1. What is the value of this expression in Python? `4 * 2 + 3 / 2`
2. What order are the subexpressions evaluated in the expression in the previous question?
3. What is the value of this expression in Python? `4 + 2 ** 3 / 2`
4. What order are the subexpressions evaluated in the expression in the previous question?
5. What is the value of this expression in Python? `max(1, -4, min(3, 18), -7)`
6. What order are the subexpressions evaluated in the expression in the previous question?
7. Imagine writing program. First you create `x = 3`. Then you create `y = 2*x`. Then you update `x` with `x = 9`. What is the value of `y` at this point in the program, and why?
8. (Come back and answer this question after completing the rest of the assignment) What problems, if any, did you encounter at any point in this Lab? What did you do to overcome them?

## Part 2/3: Guided Exercise

For this first Lab let's practice a little of all the pieces we will work with later. The goal of this is to make sure everything works so that we can fix problems now instead of later; also, so that when you work with these tools later, it won't be the first time you are seeing them. We'll be putting together a rather complex GUI for showing and interacting with plots. In your term project you'll do something *similar*, but focused around a topic of your choice. We'll talk more about that though in the Check-in activities, and we'll break this kind of programming into *much* smaller pieces in the other Labs.

First, decide how you will run Python. (Options in Journal 1.)

My preference is that you run everything for this class in Repl.it. To do this, visit [https://repl.it/](https://repl.it/) and sign up for a free account. Once you are logged in, visit [https://repl.it/new/python3](https://repl.it/new/python3) to create a new Python repl. Repl.it will automatically install any libraries for you that you might need.

Alternatively, if you are running Python on your own computer, then you will need to install a few libraries. Do this by creating a file named `requirements.txt`, put the following in it...

```txt
matplotlib==3.5.1
pandas==1.3.5
requests==2.26.0
parse==1.19.0
pygubu==0.18.1
```

..., then open a command prompt and run:

```bash
python -m pip install -U pip
pip install -r requirements.txt
```

Second, download the data that you will need for this Lab by right clicking this link, [lab1_data.csv](assets/lab1_data.csv), and saving the link as `lab1_data.csv`. Do NOT just click the link and open it in Excel/etc., as those tools can change the formatting of the data. (This was a very common cause of headaches in past semesters, so we're practicing it up front.)

Do the same to download [lab1_design.ui](assets/lab1_design.ui) and name it `lab1_design.ui`.

Third, let's put the data file next to your Python code. To do this, if you are on Repl.it, click the three dots / upload file. If you are on your own computer, then create a new Python file named `main.py`, save it somewhere easy to find, and make sure the `lab1_data.csv` file is saved right next to it.

Do the same to put the `lab1_design.ui` file next to your Python code.

Fourth, start with this Python code (copy and paste into your `main.py` file) and run it:

```python
# Load the imports we'll need
## We'll use pygubu to make an app
from pygubu import Builder

## We'll use pandas to process data
from pandas import read_csv

## We'll use matplotlib to add plots to our app
from matplotlib import rcParams
from matplotlib.pyplot import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
rcParams.update({"figure.autolayout": True})

# Build our app
app = Builder()
app.add_from_file("lab1_design.ui")
window = app.get_object("window")
canvas_frame = app.get_object("canvas_frame")

# Load our data
data = read_csv("lab1_data.csv")

# Add a plot into our app (no data yet)
fig = Figure(figsize=(4, 3)) # 4 in wide, 3 in tall
axis = fig.add_subplot()
canvas = FigureCanvasTkAgg(fig, master=canvas_frame) 
canvas.draw()
canvas.get_tk_widget().pack()

# Add data to the plot
## Sum up and average the data by author
author_sums = data.groupby(["Author"]).mean(numeric_only=True)

## Plot the TEA averages with a horizontal bar chart
author_sums.plot(
  ax=axis, # where to plot it
  kind="barh", # what kind to plot
  y="TEA" # what to plot
)

# Just an example of adding an action to a button
def say_hello():
  print("HI!")

app.connect_callbacks({
  "say_hello": say_hello
})

# Our app is ready, let's go!
window.mainloop()
```

You should see a window appear with a horizonal bar plot. The plot shows the percentage of paragraphs written by each of the three Bronte sisters that mention some form of "tea." We can see that Emily mentions "tea" (as I defined it in my scraping logic) most frequently. I know that Charlotte mentioned tea the most, but she also wrote more than her sisters overall, so taking the average cancelled that out a bit.

On Repl.it you might get a "Matplotlib created a temporary config/cache" error message, but that is normal, just ignore those.

If you have some other error message, it may be because one or both of your data files are not next to your python code. If not that, it could be because one of your files is not named *exactly* the same as the python code expects it to be. And if not that, it could be that you did not download the files by right-click/save-as exactly as instructed above: If you instead left-clicked on the CSV file link and it opened in your computer's spreadsheet editor, then when you saved it from there, your editor could have changed the formatting from what the code above expected. (These were the common headaches I've seen at this point in the past.)

Once you have this step working, take a screenshot showing me your code and your results and embed that as the first part of your answer to this activity.

Fifth, modify the code to show mentions of some form of "crying." Do this by changing `y="TEA"` to `y="CRY"` around line 38.

Once you have that working, take and embed another screenshot showing me the updated code and result.

Sixth, modify the code to show TEA and CRY at the same time. Do this by changing `y="CRY"` to `y=["TEA", "CRY"]`. Embed another screenshot of the updated code and results.

Seventh, take a look at the contents of the two files I asked you to download. Give a brief, precise, and accurate statement describing the overall structure and content of each file. What kind of information is in it? How is that information structured, organized, formatted? If you were to change these files, what effects do you think it would have on your results (assuming you don't cause an error)?

Finally, interpret your results. Do you believe this data we've collected about these three authors tells us anything interesting about their writing? Why or why not? What are the limitations of just looking at plots? What other ideas for your app can you think of that would make it more interactive for helping the user understand the differences between the authors, answering questions the user might have about the texts, etc.?

## Optional Fun Exercise

This is completely optional, not worth extra credit or anything, just a fun warm up. I do encourage you to, as you best see fit, try basing a few Tinker journals on these optional exercises though.

Start a new python project on Repl.it with this code:

```python
# Load...
from turtle import Turtle

# Initialize...
tim = Turtle()

# Draw!
tim.forward(100)
tim.right(90)
tim.forward(100)
```

Add to and modify the code (trial and error) to make these shapes:

- a square
- a rectangle
- a triangle (any kind)
- a house
- a five-point star

Embed screenshots showing me your art!

## Part 3/3: Open-Ended Exercise

Be sure to see the tips section below.

Create a simple Python program on your own that does these steps:

1. Reads an integer from the keyboard and saves it into a variable named `A`
2. Reads another integer in and save it into a variable named `B`
3. Makes a variable named `added` set equal to `A + B`
4. Similarly, makes variables named `subtracted`, `multiplied`, and `divided`
5. Displays a message like, "The value of {A's value here} + {B's value here} is {added's value here}"
6. Displays a similar message for the other three variables we made

For example, if I enter 3 then 5, your program should display this message:

```txt
The value of 3 + 5 is 8
The value of 3 - 5 is -2
The value of 3 * 5 is 15
The value of 3 / 5 is 0.6
```

Embed screenshots showing your final code and your results. Show results for a few different runs of your program on different inputs.

## Submission

Complete Parts 1, 2, and 3 in a single Word/etc. document, then submit your document as a Word or PDF file (NOT a .pages file) to Blackboard.

## Grading

Each Lab is worth 6/100 towards your final grade.

6/6 - Great job, maximum points! The student completes the Lab accurately and sufficiently and honestly, demonstrating the best of their ability. 

3/6 - Student completes most but not all of the Lab. Or, student completes the Lab, but only to the minimal letter of the prompt, not actually applying the concepts of the unit. If you encounter problems or have questions, be sure to email me well before 24 hours before the due date, then continue to attempt to resolve the issue on your own while you wait for a reply. 

1/6 - Student completes less than half of the Lab with sufficient work, or student leaves entire sections blank. Make sure that you are leaving yourself enough time to complete assignments, as usually students submit incomplete work because they were rushed at the last minute. 

0/6 - Student does not submit on time or submits plagiarized or unacceptable work. Double check that you have submitted the right file, as usually students get zeros because they submitted a previous week's work by accident.

## Tips

**How Do I Take a Screenshot?**

In Windows: Open your Start menu and search for the Snipping Tool. Use that.

In Mac: Cmd+Ctl+Shift+4, then Cmd+V into your Word document

In Linux: If you have a GNOME shell, I recommend the [Screenshot Tool](https://extensions.gnome.org/extension/1112/screenshot-tool/) extension.

On a Chromebook: I recommend the [Full Page Screen Capture](https://chrome.google.com/webstore/detail/full-page-screen-capture/fdpohaocaechififmbbbbbknoalclacl) extension.

**How Do I read an Integer from the Keyboard?**

I recommend reading [https://pythonexamples.org/python-read-number-from-console/](https://pythonexamples.org/python-read-number-from-console/)

**How do I Display Values inside a Message?**

I recommend reading about f-strings from [https://realpython.com/python-f-strings/](https://realpython.com/python-f-strings/)