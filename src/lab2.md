# Lab 2

## DataFrames and Logic 🧑‍🔬

Labs provide hands-on experience with course material. They have three parts: review questions, guided exercise, open-ended exercise.

The first few Labs provide practice with fundamentals, and the later Labs go hand-in-hand with the term project check-ins.

Tips are at the very bottom. You should read them.

## Part 1/3: Review Questions

1. You want to find the sine, cosine, square root, floor, or ceiling of a value. What module do you need to import?
2. What's the use of the `dir` and `help` functions in Python, according to the book? (in your own words)
3. What is the value of the following expressions in Python? What data type does each value have?
    - `1 + 1`
    - `1.0 + 1.0`
    - `"1"`
    - `"hello".upper()`
    - `"Happy Birthday!".lower()`
    - `"Hello {0}. I've been waiting for you {0}. Your {1} is getting cold, {0}.".format("Bob", "Soup")`
    - `True or False`
    - `True and False`
    - `not (True or False)`
    - `not (True and False)`
    - `not True or not False`
    - `not True and not False`
4. In your own words, as you understand it, what is a "data frame"? What is a "data structure" in general?
5. What sort of output would be displayed by the following code? Be specific. (Note: I am not asking you to *run* this code with your machine, I am asking you to *interpret* it yourself by hand.)
```python
from pandas import read_csv
data = read_csv("banking_data.csv")
print(data.describe())
```
6. (Come back and answer this question after completing the rest of the assignment) What problems, if any, did you encounter at any point in this Lab? What did you do to overcome them?

## Part 2/3: Guided Exercise

An *extremely* useful data structure in Python, no matter your use of it, is the `DataFrame` object from `pandas`. This is like a spreadsheet or 2D array with a lot of useful tools built in. We'll practice using these this Lab.

First, create a spreadsheet in your preferred tool, like Excel, Google Sheets, etc. Fill it with these contents:

```txt
Last       First       SSN          Test1  Test2  Test3  Test4  Final
Alfalfa    Aloysius    123-45-6789  40.0   90.0   100.0   83.0  49.0
Alfred     University  123-12-1234  41.0   97.0    96.0   97.0  48.0
Gerty      Gramma      567-89-0123  41.0   80.0    60.0   40.0  44.0
Android    Electric    087-65-4321  42.0   23.0    36.0   45.0  47.0
Bumpkin    Fred        456-78-9012  43.0   78.0    88.0   77.0  45.0
Rubble     Betty       234-56-7890  44.0   90.0    80.0   90.0  46.0
Noshow     Cecil       345-67-8901  45.0   11.0    -1.0    4.0  43.0
Buff       Bif         632-79-9939  46.0   20.0    30.0   40.0  50.0
Airpump    Andrew      223-45-6789  49.0    1.0    90.0  100.0  83.0
Backus     Jim         143-12-1234  48.0    1.0    97.0   96.0  97.0
Carnivore  Art         565-89-0123  44.0    1.0    80.0   60.0  40.0
Dandy      Jim         087-75-4321  47.0    1.0    23.0   36.0  45.0
Elephant   Ima         456-71-9012  45.0    1.0    78.0   88.0  77.0
Franklin   Benny       234-56-2890  50.0    1.0    90.0   80.0  90.0
George     Boy         345-67-3901  40.0    1.0    11.0   -1.0   4.0
Heffalump  Harvey      632-79-9439  30.0    1.0    20.0   30.0  40.0
```

(This is fake data.)

Second, export your data to a CSV format. Usually this is an option under "File / Save As" or similar, depending on the tool you're using. Save it as `lab2_data.csv`.

Third, open your `.csv` file with your preferred text editor. If you've been using Repl.it, you can upload it to a new project then open the file there.

For example, I see this when I open mine in Caret:

![CSV in Text Editor example](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F26b8ac79-f0b3-45a5-8d8a-5cc7b4eaf02d.image.png?v=1609689788122)

(My screenshot is a tad old, so I have a Grade column in my screenshots that you won't, just ignore that bit.)

Yours may look formatted differently. That's fine. The point is to notice how your values are separated. Is it with a semicolon? A tab character? A comma (like in mine)? A comma-space? A semicolon-space? etc.

Fourth, start with this Python code (make sure your code and data file are next to each other):

```python
from pandas import read_csv

data = read_csv("lab2_data.csv", sep=",")
print(data)
```

Notice the `sep=","` I have above. Make sure this matches EXACTLY the separator you noted in the previous step. Since I just have commas, I have `sep=","`, but you might need to put `sep=";"` (semicolon) or so on. If you have a space in your separator, then this alternative might give you a cleaner read:

```python
data = read_csv("lab2_data.csv", sep=",", skipinitialspace=True)
```

Embed a screenshot showing your code and your result. For example:

![Loading data example](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F700651bf-5bd6-46c2-8ac2-e81220aa26f0.image.png?v=1609690123056)

If your `sep` was not set properly, then you'll get results like this:

![Loading data wrong sep BAD example](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F5a48242a-21c1-4cf5-8af3-bc9e3b2e273b.image.png?v=1609690196571)

You want nice and neatly separated values like my first screenshot, not a mushed together mess like my second screenshot. That shows us that pandas was able to read our values in and separate them correctly.

Fifth, let's get used to some DataFrame syntax:

```python
print(data.Test1)
print(data.Test1 > 40)
print(data[data.Test1 > 40])
```

Note that `data.Test1` (capitalization matters!) gives us one *column* of our spreadsheet, the one named `Test1`. Next, `data.Test1 > 40` creates a column of true/false values, corresponding with the students that scored more/at most 40 on their first test. And `data[data.Test1 > 40]` selects the *rows* of *only* the students that scored more than 40 on that test.

Sixth, we can use than to find the names of students who scored at least a certain score:

```python
high_on_test2 = data[data.Test2 >= 80]
print(high_on_test2.First)
```

Embed screenshots showing your code and results at this point.

Here's the results I get:

![Instructor's high on test2 results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2Ff9648147-2bfa-4c28-a899-b721bb992b19.image.png?v=1609690937254)

Finally, write code (less is better!) that will select and display:

- The Last name of students who scored less than 80 on Test 3
- The SSN of students who scored less than 50 on the Final
- The First name of students who scored more than 80 on Test 4 AND less than 50 on the Final (there are a few ways to go about this one)

Show screenshots of your code and results for each.

## Optional Fun Exercise

This is completely optional, not worth extra credit or anything, just a fun warm up. I do encourage you to, as you best see fit, try basing a few Tinker journals on these optional exercises though.

We haven't covered loops yet, but that's okay.

Start with this code:

```python
# Load...
from turtle import Turtle
from random import random

# Initialize...
tim = Turtle()

# Loop...
for i in range(100):

  # How to move...
  size = 10
  angle = random() * 90

  # Move!
  tim.forward(size)
  tim.right(angle)
```

The `random()` method returns a value between 0 (inclusive) and 1 (exclusive). So, `random() * 90` returns a value between 0 and 90. If you wanted to shift this, you could do something like `random() * 90 - 45`, which would return a value between -45 and 45. Etc.

Update your "drunk turtle" logic to show the types of patterns we get when we do:

- angle is between -45 and 45
- angle is between 0 and 180
- angle is between 0 and 360
- angle is always 10, but size is between 0 and 20
- anything else you want to test!

Can you explain why those random settings tend to produce those sort of shapes?

Whenver you're done\*, embed screenshots showing me your art!

\* "When is art done? When the check clears."

## Part 3/3: Open-Ended Exercise

Write a simple program that will ask the user to enter three integers, `A`, `B`, and `C`. Then, it should use if/elif/else's to determine which of these three values is in the *middle* of the other two. Finally, it should display a message like "The middle value was {value here}."

For example, if I enter 1, 5, and 10, it should display "The middle value was 5," no matter what order I enter those values.

Embed screenshots of your code and results, showing that it works in all of these cases:

- `A` is the middle
- `B` is the middle
- `C` is the middle
- All three values are the same
- Some values are negative
- Some values are exactly zero
- Some values are very large

## Submission

Complete Parts 1, 2, and 3 in a single Word/etc. document, then submit your document as a Word or PDF file (NOT a .pages file) to Blackboard.

## Grading

Each Lab is worth 6/100 towards your final grade.

6/6 - Great job, maximum points! The student completes the Lab accurately and sufficiently and honestly, demonstrating the best of their ability. 

3/6 - Student completes most but not all of the Lab. Or, student completes the Lab, but only to the minimal letter of the prompt, not actually applying the concepts of the unit. If you encounter problems or have questions, be sure to email me well before 24 hours before the due date, then continue to attempt to resolve the issue on your own while you wait for a reply. 

1/6 - Student completes less than half of the Lab with sufficient work, or student leaves entire sections blank. Make sure that you are leaving yourself enough time to complete assignments, as usually students submit incomplete work because they were rushed at the last minute. 

0/6 - Student does not submit on time or submits plagiarized or unacceptable work. Double check that you have submitted the right file, as usually students get zeros because they submitted a previous week's work by accident.

## Tips

**How do I tell which number is in the middle?**

Think of this as TWO logical statements.

If `B` is between `A` and `C`, then two simpler statements are true: `A` is less than `B` AND `B` is less than `C`.