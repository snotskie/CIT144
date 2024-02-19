# Lab 5

## Group By and Plotting 🧑‍🔬

Labs provide hands-on experience with course material. They have three parts: review questions, guided exercise, open-ended exercise.

The first few Labs provide practice with fundamentals, and the later Labs go hand-in-hand with the term project check-ins.

Tips are at the very bottom. You should read them.

## Part 1/3: Review Questions

1. Explain in good detail what a "group by" operation is (the idea of it), how it works (the logical operations behind it), and give at least two real life examples of where you might use one.
2. Interpret the "story" being told by the Plot from Pew Research below. (It is from [this article](https://www.pewsocialtrends.org/2020/12/09/how-the-coronavirus-outbreak-has-and-hasnt-changed-the-way-americans-work/) if you're curious).
3. What are the units in that plot (as defined in Reading 12)?
4. How are those units grouped?
5. What is being measured?
6. (Come back and answer this question after completing the rest of the assignment) What problems, if any, did you encounter at any point in this Lab? What did you do to overcome them?

![Plot from Pew Research](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2Fdf698109-2068-4197-8e36-3cccf69bcc80.image.png?v=1609955629442)

## Part 2/3: Guided Exercise

As I say in Reading 12, the point of a plot (or a table of stats in a text-based interface) is to convey *that* there is a pattern in your data and *what* that pattern is. And often when you are producing those, there is an underlying group-by operation at play. So, for this last lab, we'll practice that a bit.

First, download the data that you will need for this Lab by right clicking this link, [lab5_data.csv](assets/lab5_data.csv), and saving the link as `lab5_data.csv`. Do NOT just click the link and open it in Excel/etc., as those tools can change the formatting of the data.

Second, add the CSV file to your project and view it. Note that the separator here is comma-space and there are quotes around the string values. The cleanest way to ignore these is with `skipinitialspace=True` in your `read_csv` call (as shown below).

Third, start your Python with these imports:

```python
# Load what we need for CSV data
from pandas import read_csv

# Load what we need to show the built-in GUI.
# Lab 4 we built custom GUIs, this time we'll
# use the built-in one so we can focus on something else
from matplotlib.pyplot import show, subplots

# Load data
data = read_csv("lab5_data.csv", skipinitialspace=True)

# Check the data
print(data)

# Grab the built-in plot
fig, axis = subplots()

# Check the plotting
data.plot(ax=axis, y="Weight")
show()
```

Fourth, you should see that one of the weights is -1 and the rest are around 200. That's correct, since the file uses -1 to represent a "missing" value. (Check for yourself! On line 642 of the file, Kirk Saarloos has a weight of "-1.")

Ignore Kirk Saarloos like so:

```python
# Load data
data = read_csv("mlb_players.csv", skipinitialspace=True)
good_data = data[data.Weight > 0]

# Check the data
print(good_data)

# Grab the built-in plot
fig, axis = subplots()

# Check the plotting
good_data.plot(ax=axis, y="Weight")
show()
```

Embed a screenshot.

Fifth, the data in that plot is plotted at the unit-level. That is, each data point in the plot corresponds to exactly one line of our CSV. Since our CSV tracks data on *players*, we see data at the *player* level. If we want to compare teams, this won't quite work, since some teams might have more/less players, etc.

Update your plot to show grouped-by-team values:

```python
# Load data
data = read_csv("mlb_players.csv", skipinitialspace=True)
good_data = data[data.Weight > 0]
team_data = good_data.groupby(["Team"]).mean(numeric_only=True)

# Check the data
print(team_data)

# Grab the built-in plot
fig, axis = subplots()

# Check the plotting
team_data.plot(ax=axis, y="Weight", kind="bar")
show()
```

Note two things:

1. I used `.mean()` to summarize the player values within each team. Think about it, if there are 20 players in a team, what is "the" weight of the team? The max weight? the min weight? the average weight? the weight of some player named Bob? Whatever value you choose to represent the whole team, it is a choice. Typically we choose the average (mean), but that isn't a given, and you should still reason about why you care about the "average" at all.
2. I changed the plot to a bar plot, since that makes more sense to me when comparing multiple groups. Again though, it's a choice, and you should be deliberate about whatever choices you make in your project.

Embed a screenshot.

Sixth, group by `"Position"` instead of by `"Team"` and embed a screenshot showing your result. If your position labels get cut off, I recommend adding this to your imports section:

```python
# Load what we need for CSV data
from pandas import read_csv
from matplotlib import rcParams
rcParams.update({"figure.autolayout": True})
```

Which position on average has the lightest players? Which has the heaviest? Are you convinced those differences are really there and not a matter of "luck"?

Seventh, let's investigate. In the bar plot, we had to make a choice about what "the" weight of a position was. But in a box-and-whisker plot, we don't have to make that choice. Instead, we use the box-and-whisker to show how *all* of the weights within each position cluster around the median. This allows quick comparisons of *all* of the weights as grouped by positions.

Since we're viewing the data for all weights, we'll plot on the player-level data (`good_data`). And the syntax is a tad different for the box plot for some reason (not my choice, I don't know why the `pandas` coders set it up like that):

```python
good_data.boxplot(
  ax=axis,
  rot=90, # rotate the label
  column=["Weight"], # what data to pay attention to
  by=["Position"] # how to group it up
)
```

Embed a screenshot of your box-and-whisker plot. And reinterpret your answers from before: Do the heaviest and lightest positions *still* appear to be *typically* different?

Finally, demonstrate creating each of the following in Python:

- Scatter plot between age and weight
- Histogram of weights
- Box plot of ages, grouped by team

## Optional Fun Exercise

This is completely optional, not worth extra credit or anything, just a fun warm up. I do encourage you to, as you best see fit, try basing a few Tinker journals on these optional exercises though.

So far we've made images. But what about sound?

```python
# Load what we need to produce sound
from numpy import zeros, float32
from scipy.io.wavfile import write
from math import sin

# Some settings
rate = 44100
seconds = 10
total_size = seconds * rate

# Create an array to hold sound data.
# It will be an array of values between -1 and +1,
# where the value represents the position of a
# speaker head, with -1 being the low position and
# +1 the high position. By moving the speaker head
# very rapidly, we move the air around it, and that
# produces sound.
# Think of this array as our blank sound track.
data = zeros(total_size)

# A function to add a note at a certain
# position on the sound track, at a certain
# frequency, at a certain volumn, for a certain
# length in seconds. To prevent weird clipping
# issues, vol should be between 0 and 1.
def add_note(pos, hz, vol, secs):
  global rate
  global data

  start = int(rate * pos)
  size = int(rate * secs)
  for i in range(start, start+size):
    if i >= len(data):
      break

    data[i] += vol * sin(2 * i * hz / rate)

# It's possible that we can add too many
# notes at one point or that we can add a note
# that is too loud, so this function will "clip"
# our sound so that it stays in the -1 to +1 range.
# Not the best fix, cause it'll sound janky, but it's
# a simple fix.
def clip():
  for i in range(len(data)):
    data[i] = min(+1, max(-1, data[i]))

# Let's Make a Music!
# 440 is the hz for the middle A note,
# and 880 is the hz for the A one octave up
# from there.
add_note(0, 440, 0.1, 3) # note at the start.
add_note(2, 880, 0.1, 3) # layer one on top of that.
                         # we should hear a weird
                         # effect from two waves interacting.
add_note(5, 440, 2.0, 1) # a note that's too loud.
add_note(7, 440, 1000.0, 1) # VERY too loud.

# Clip and save the file when we're done
clip()
write("output.wav", rate, data.astype(float32))

# Friendly message
print("All done! Check out your new sound!")
```

Start with and run the above code, then click on the `output.wav` file it produces and play it. Then try doodling out on a sheet of paper what my three `add_note` calls towards the bottom of my code are adding to the sound track.

I used a middle A (`hz=440`) and the A one octave above that (`hz=880`), since those are easy numbers to remember. For a list of the frequencies for all the other notes, see [https://pages.mtu.edu/~suits/notefreqs.html](https://pages.mtu.edu/~suits/notefreqs.html).

Experiment with what sounds you can make Python produce!

Or see if you can make other methods (like `add_note`) that create different [waveforms](https://en.wikipedia.org/wiki/Waveform), like a square wave!

And when you're done, embed screenshots showing me your final code and upload a copy of your favorite sounds so I can hear them too!

## Part 3/3: Open-Ended Exercise

In your own words, in a clear paragraph, what do you believe is the relationship between "experience" and "knowing"? Why does that matter when trying to make claims based on data? Why does it matter when using automation to process large amounts of data?

## Submission

Complete Parts 1, 2, and 3 in a single Word/etc. document, then submit your document as a Word or PDF file (NOT a .pages file) to Blackboard.

## Grading

Each Lab is worth 6/100 towards your final grade.

6/6 - Great job, maximum points! The student completes the Lab accurately and sufficiently and honestly, demonstrating the best of their ability. 

3/6 - Student completes most but not all of the Lab. Or, student completes the Lab, but only to the minimal letter of the prompt, not actually applying the concepts of the unit. If you encounter problems or have questions, be sure to email me well before 24 hours before the due date, then continue to attempt to resolve the issue on your own while you wait for a reply. 

1/6 - Student completes less than half of the Lab with sufficient work, or student leaves entire sections blank. Make sure that you are leaving yourself enough time to complete assignments, as usually students submit incomplete work because they were rushed at the last minute. 

0/6 - Student does not submit on time or submits plagiarized or unacceptable work. Double check that you have submitted the right file, as usually students get zeros because they submitted a previous week's work by accident.

## Tips

**I'm getting an error when I try to plot!**

In my experience, 80% of the time, there is a problem with your data. In the Guided above, we see three examples:

1. Junk lines at the end
2. Junk data that causes a numeric column to be loaded in as a string column instead
3. Column names contain spaces or other non-letter characters

If you wrote your CSV file by hand in Excel, for example, and you put "1,000,000" for a million, well, that's a string. Yes, the commas make it more readable to a human, but a comma is a comma is a comma, and commas ain't numbers. Just do "1000000" instead.

Next, don't put "none" or "missing" or a blank where a number should go. Put in a "magic" number, like -1, that you can filter out within your program.

Next, keep your column names simple, like "First" or "FirstName," not "first name" (with a space).

The other 20% of the time, there is a problem with your plot function call. Maybe it requires an argument that you are leaving out. Or maybe the argument isn't spelled the way you think it is. Or maybe you need to `.mean()` your data first. It's hard to say the specifics to help you without knowing how your data is structured and what plot you're trying to produce. So, shoot me an email, happy to help. Include a doodle of what your want your plot to look like.