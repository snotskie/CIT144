# Lab 3

## Scraping and Looping 🧑‍🔬

Labs provide hands-on experience with course material. They have three parts: review questions, guided exercise, open-ended exercise.

The first few Labs provide practice with fundamentals, and the later Labs go hand-in-hand with the term project check-ins.

Tips are at the very bottom. You should read them.

## Part 1/3: Review Questions

1. What does a "negative index" mean in Python?
2. The variable `cart` contains this list: `["apple", "orange", "banana", "cheese"]`. What would you write in Python to print only the first item in the that list?
3. What Python would you write to:
    - print only the last item in that list?
    - print the items in alphabetical order?
    - loop and print the items in alphabetical order, one item at a time?
    - add "pepper" to the end of the list?
    - replace "banana" with "peanut butter" in the list, without modifying anything else about the list?
    - make a loop display the numbers 0 through 99?
    - make a loop display the numbers 1 through 100?
    - make a loop display the even numbers between 1 and 100?
4. (Come back and answer this question after completing the rest of the assignment) What problems, if any, did you encounter at any point in this Lab? What did you do to overcome them?

## Part 2/3: Guided Exercise

Last Lab we saw how to make a data file manually in Excel/etc., then load that into Python and do some logic on it. This time, we'll use Python to create a CSV file for us by scraping content from the web. An existing tool, [pywikibot](https://www.mediawiki.org/wiki/Manual:Pywikibot), exists for scraping Wikipedia like we'll be doing. However, we'll write our own from scratch for learning purposes.

This will be a bit longish compared to our usual Guided Exercises. Each step is small, but there's a good number of them. So, I've broken the steps up and labeled the sections with bold headings, so hopefully that makes things easier to navigate if you scroll away and lose your place.

And one last note before we get started, in the code I have you using the URL `https://en.wikipedia.org/wiki/Catherine,_Duchess_of_Cambridge`. If you have problems towards the end with your code going just waaaay to slow, feel free to change that URL. Something like `https://en.wikipedia.org/wiki/K%C5%8Djima` is good since it has *some*, but not a *lot* of links inside it.

### Downloading the data...

First, start with this Python and make sure you can get it to run without error, as a check that you have all the necessary libraries installed:

```python
# Load what we need for web scraping
from requests import get
from parse import search
from time import sleep
from pandas import DataFrame
```

Second, add this to the bottom and run again (be sure to edit the strings inside the `my_boy_headers` to match your own name! Include your name, the word "bot", a version number, and the url to this assignment):

```python
# HTTP header settings
# We'll use these in a bit to help keep our scraper from getting blocked
my_bot_headers = {
  'User-Agent':
    'Mozilla/5.0 (compatible; MariahKnowlesBot/1.0; +https://cit144.knowles.codes/lab3)'
}

# Download a webpage so we can scrape from its HTML
url = "https://en.wikipedia.org/wiki/Catherine,_Duchess_of_Cambridge"
html = get(url, headers=my_bot_headers).text

# Check that it worked
print(html[0:200])
```

Embed a screenshot and check that you are getting *similar* results to mine:

![Instructor's scraping one file results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F0a2a51a2-2df2-49e9-9013-34f48139a715.image.png?v=1609697336291)

Third, we told Python to download a certain URL. Visit the same URL yourself in your browser. Scroll around and get a sense of what all information is there. This is what *us humans* see when we view this HTML through our browsers.

Fourth, right click / view source on that page. This is what *Python* sees when it downloads that HTML.

---

### Scraping the data for values...

Fifth, ctrl+f and look for "This page was last edited on" in that HTML.

For me, that line looks like this:

```html
<li id="footer-info-lastmod"> This page was last edited on 2 January 2021, at 01:46<span class="anonymous-show">&#160;(UTC)</span>.</li>
```

Or, in other words, it follows this pattern:

```c
...> This page was last edited on {day} {month} {year}, at {time}<...
```

Sixth, scrape those values from the page using:

```python
# A pattern to search for
pattern = "> This page was last edited on {day} {month} {year}, at {time}<"

# Do the search
results = search(pattern, html)

# Display the results
print(results["day"])
print(results["month"])
print(results["year"])
print(results["time"])
```

Embed another screenshot and check against my results again:

![Instructor's scraping one value results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2Fc37cf78d-06ac-41ce-9cac-c56e98c26020.image.png?v=1609699188420)

---

### Chunking the data, scraping the chunks...

Seventh, what if we want to scrape multiple values from the one page of data, like all the links to other wiki pages? Let's do that now. Return to the view-source HTML. Ctrl+f and look for "href". Links to other wiki pages look like this:

```html
<a href="/wiki/Prince_Harry,_Duke_of_Sussex" title="Prince Harry, Duke of Sussex">The Duke of Sussex</a>
```

Or, in other words, they follow this pattern:

```c
...href="/wiki/{wiki_link}" title="{hover_title}">{link_text}<...
```

Eighth, let's write the scraping code.

In order to scrape a lot of values from a single page, imagine the HTML as one big block of text. Then imagine splitting that into a bunch of smaller "chunks." Then imagine checking each chunk to see if it has a valid link we care about and scraping those values out.

Since the links always end with `/a>`, I think splitting on that would be a good idea. That way, each "chunk" should contain exactly one link.

```python
# Split into chunks
chunks = html.split("/a>")

# Check that it worked
print(chunks[1:3])
```

Embed another screenshot and check against my results again:

![Instructor's chunking results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2Fc8ae224d-7df1-43cb-8fe9-8f9bff80c18b.image.png?v=1609699884723)

Ninth, loop through the chunks and attempt to scrape URLs that match our pattern from above:

```python
# Our search pattern
pattern = 'href="/wiki/{wiki_link}" title="{hover_title}">{link_text}<'

# Loop through the chunks and try to get a URL from each
for chunk in chunks:
  results = search(pattern, chunk)
  if results is not None:
    print(results["wiki_link"])
```

Note the `if results is not None` there so we ignore the cases where a chunk does not have a valid link we care about.

Tenth, let's store those scraped URLs in a list instead of just printing them. Update the previous step's for loop to do this instead:

```python
# Loop through the chunks and try to get a URL from each
found_urls = []
for chunk in chunks:
  results = search(pattern, chunk)
  if results is not None:
    wiki_link = results["wiki_link"]
    found_urls.append("https://en.wikipedia.org/wiki/" + wiki_link)

print(found_urls[1:3])
```

Embed another screenshot and check:

![Instructor's storing URLs results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F27d48820-29f1-4809-91e5-7eb2ebfbf62e.image.png?v=1609698720020)

---

### Scraping a list of URLs...

Eleventh, you now know how to scrape one URL for specific values, and you now know how to chunk a single page and scrape those chunks so that you can get multiple values from one page. But we can scrape a *list* of URLs in a similar way, like if you have a list of reddit pages you want to get the comments from. Essentially, you wrap everything we've done so far up in a for loop that loops over a list of URLs you care about.

Since we have a list of URLs we've just scraped, let's load *those* pages' data and scrape them too:

```python
# Loop through those URLs and scrape each for the date
for url in found_urls:
  html = get(url, headers=firefox_headers).text
  pattern = "> This page was last edited on {day} {month} {year}, at {time}<"
  results = search(pattern, html)
  if results is not None:
    day = results["day"]
    month = results["month"]
    year = results["year"]
    time = results["time"]

    print(f"The URL {url} was last updated on {year}-{month}-{day}.")

  # Pause for a second before scraping again.
  # This helps us from getting blocked
  sleep(1)
```

Here's my partial results, embed another screenshot and check:

![Instructor's spider partial results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F6ef2ec30-a308-4a5d-b589-9fb6ee834bea.image.png?v=1609700226658)

You'll notice that it...takes a long time to run. Stop it early once you've seen enough to be convinced your code works.

This code is slow is because there is a `sleep(1)` to slow our "spider" down on purpose. That helps keep us from getting blocked.

But it's also slow because some links go to the same place, so we end up duplicating a lot of work. To fix that "duplicate link" problem, you can do this for your for loop instead:

```python
for url in set(found_urls):
  ...
```

It'll still be slow (there's a lot of links in that list!), but it'll be a tad better.

---

### Saving the data to a CSV file...

Twelfth, so far we're scraping values from a lot of pages. But we're still just throwing that data away. We print it and move on. Since it took a long time to *compute* those results, let's store them in a `.csv` file so we don't have to do that *again and again and again*. And bonus, we could load that CSV data into whatever other Python code we want.

Modify your last for loop to be:

```python
# Create an empty DataFrame, before the loop
data = DataFrame({
  "URL": [],
  "Day": [],
  "Month": [],
  "Year": [],
  "Time": []
})

# Loop through those URLs and scrape each for the date
for url in set(found_urls):
  html = get(url, headers=firefox_headers).text
  pattern = "> This page was last edited on {day} {month} {year}, at {time}<"
  results = search(pattern, html)
  if results is not None:
    day = results["day"]
    month = results["month"]
    year = results["year"]
    time = results["time"]

    print(f"The URL {url} was last updated on {year}-{month}-{day}.")
    
    # Add this one result to the data frame, inside the loop
    # (I personally hate this syntax for appending one row to a dataframe,
    # but in Spring 2022 pandas deprecated another approach that was
    # less efficient but clearer to understand. So, if you want to add
    # one row to a dataframe, remember this non-obvious solution: First,
    # create the row you want to add as a dictionary. Second, use the
    # syntax data.loc[data.shape[0]] to access the part of the dataframe
    # just past the end of the current last row, then put the new row there.)
    row = {
      "URL": url,
      "Day": day,
      "Month": month,
      "Year": year,
      "Time": time
    }
    data.loc[data.shape[0]] = row

  # Pause for a second before scraping again.
  # This helps us from getting blocked
  sleep(1)

# Save the data for later, after the loop
data.to_csv("lab3_data.csv", index=False)
```

This adds three things: before the loop, create an empty DataFrame; during the loop, add each result to the DataFrame; after the loop, save the data to a file.

Be VERY patient letting this one run. 

Fourteenth (I skipped unlucky step 13), view your `lab3_data.csv` file that Python made for you. Open this in Excel/etc. If you are using Repl.it, here's the quickest way I know to download the CSV file: view your CSV file in Repl.it; then make some small edit, like adding a space somewhere, then backspace that space away, just something to "touch" the file but not really change its contents; then download the whole project by clicking the three dots / download as ZIP; then unzip the download and open your CSV from there.

Embed a screenshot showing this file in Excel/etc. Here's mine:

![Instructor's results in Google Sheets](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F92e4cc54-2eff-4552-9ad2-ef9e3670c280.image.png?v=1609701667366)

---

### Writing your own...

Finally, write a scraper of your own that will scrape all the assignment names from <https://cit144.knowles.codes/latest>. Embed screenshots showing your code and results.

## Optional Fun Exercise

This is completely optional, not worth extra credit or anything, just a fun warm up. I do encourage you to, as you best see fit, try basing a few Tinker journals on these optional exercises though.

Start a new python project on Repl.it with this code:

```python
from drawSvg import *

# A Drawing is like, part canvas, part list of shapes to
# be drawn on that canvas. (0, 0) will be the dead center
# of the image
d = Drawing(200, 100, origin='center')

# Make an irregular polygon shape
myLines = Lines(
  -80, -45, # first x/y coordinate
  70, -49, # second x/y
  95, 49, # ...
  -90, 40,
  close=False, # other settings
  fill='#eeee00',
  stroke='black'
)

# Add the shape to the canvas
d.append(myLines)

# Draw a rectangle
r = Rectangle(
      0, 0, # x/y position
      40, 50, # width and height
      fill='#1248ff'
)

# Don't forget to add it to the canvas
d.append(r)

# Draw many circles by using a loop
for i in range(10):
  c = Circle(
    -40 + i*5, -10, # x/y position
    30, # radius
    fill='red',
    stroke_width=2,
    stroke='black'
  )

  d.append(c)

# For a LOT more examples, see
# https://github.com/cduck/drawSvg

# Render the drawing to an SVG and a PNG so we can view it
d.setRenderSize(400,200) 
d.saveSvg('example.svg')
d.savePng('example.png')

# A friendly message
print("Done!")
```

Hit Run then view the `example.png` and `example.svg` images that it generates for you. You should see a doodle like this:

![Instructor's doodle results](https://cdn.glitch.com/0e5725cf-1e7b-4a31-ba36-51513f05d47e%2F23859298-e89d-4c4f-9e80-95e1d2d62b0b.image.png?v=1609774078595)

Next, look at the Manolo examples I have at the bottom of my [Generative Art](https://cdn.glitch.com/4d1ce3eb-1449-4924-ae06-785bd41e996a%2FGenerative_Art.pdf?v=1569862153378) PDF. Try to notice the shapes in one of those drawings. Where do you see a square? a circle? a line? What colors are those shapes? Where are they placed? How big are they? Which are in the back (ie, drawn first) and which are in the front (ie, drawn last)? And how might you generate drawings like that using loops?

For example, in the very very last image in that PDF, there is a blue squiggle in the top left. That squiggle is made out of a bunch of circles drawn right on top of each other, just moved a little each time. It seems like Manolo picked a random x/y position, drew a big white circle there, then drew a smaller blue circle on top of that, then moved his x/y position a little, then drew another blue circle, and so on.

The idea here is to "decompose" the art of others into the steps and shapes that make it up, then take some ideas from that to get our own ideas going.

Then, experiment with what you can make your Python do!

As you revise, look at your picture and check your gut: what do you like about it, what do you not like about it, and so what one small change might you make to do something better? Then check your gut and revise again. Maybe you hate the color. Maybe you hate the size. Maybe you hate the emptyness and want to add another shape. The world is your oyster.

And when you're done, embed screenshots showing me your art!

## Part 3/3: Open-Ended Exercise

Create two copies of the CSV file that you made during Lab 2. (The one with the student grades.) Edit one to have slightly different grades.

We'll say that the original file is the students' grades for CIT 144 Python I and the modified file is their grades for CIT 170 Database Fundamentals.

Create a simple python program that will load both of those files in, then merge them into a single dataframe object. (Be sure to see the tips section below.)

Once you've done that, have it output the first names of all students who got a 70 or higher on *both* of their finals.

## Submission

Complete Parts 1, 2, and 3 in a single Word/etc. document, then submit your document as a Word or PDF file (NOT a .pages file) to Blackboard.

## Grading

Each Lab is worth 6/100 towards your final grade.

6/6 - Great job, maximum points! The student completes the Lab accurately and sufficiently and honestly, demonstrating the best of their ability. 

3/6 - Student completes most but not all of the Lab. Or, student completes the Lab, but only to the minimal letter of the prompt, not actually applying the concepts of the unit. If you encounter problems or have questions, be sure to email me well before 24 hours before the due date, then continue to attempt to resolve the issue on your own while you wait for a reply. 

1/6 - Student completes less than half of the Lab with sufficient work, or student leaves entire sections blank. Make sure that you are leaving yourself enough time to complete assignments, as usually students submit incomplete work because they were rushed at the last minute. 

0/6 - Student does not submit on time or submits plagiarized or unacceptable work. Double check that you have submitted the right file, as usually students get zeros because they submitted a previous week's work by accident.

## Tips

**How do I merge two dataframe objects?**

Pandas has a [merge](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.merge.html) command that allows you to combine two dataframes, similar to how you would join two tables in database programming.

Lets say that the column that we need to [join](https://www.w3schools.com/sql/sql_join.asp) on is called `ID`. (That is, the column that we use to identify that a record in one CSV corresponds to a record in another. If I have two files about my cats, I could join them by the cats' first names, their birthdays, or their species, so long as whatever I choose can be reliably used to identify individual cats.)

In that case, we might write:

```python
from pandas import read_csv, merge

data_first = read_csv("my_first_file.csv")
data_second = read_csv("my_second_file.csv")

data = merge(data_first, data_second, on="ID")
```