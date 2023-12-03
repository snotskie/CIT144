# Project Check-in 3

## Clear Plans ☑️

In the last check-in, you wrote a formal pitch. I gave you either a thumbs-up or a thumbs-down about your pitch.

## Third Check-in

For this third check-in, you will collect a *little* data and begin to refine your idea so that we can start really running in the next Check-in.

Start by responding to TWO other students on the previous Check-in. Choose students with the least responses so far and with ideas that interest you, preferring to respond to the same students as you did last time. Comment (politely, kindly, clearly!) on their pitch, ways they might flesh out their pitch further, questions it leaves you with, directions they might take the project, and (most importantly) places they might find data on it. Others in this class will be commenting on your work--treat others as you would like to be treated.

Then, first, start this Check-in with a revision of your Check-in 2, based on all the feedback you've gotten so far, or just based on your own gut-sense coming back to your previous Check-in with fresh eyes.

Second, collect a little bit of data that interests you. Do this by hand, so that we can focus on the data and not on code for right now. Put that data / notes about that data in your submission.

Third, make sure you've read Reading 7.

Fourth, answer in *good* detail:

1. Describe the *overall* content, context, and structure of the data you're collecting.
    - What all kinds of stuff is in it (besides the specific stuff you're interested in)?
    - How *exactly* is the data/file/etc. structured? Your answer here should be mind-numbingly precise.
    - Where did this data come from? What *could* it represent, and what are its clear limitations?
2. Describe what you're looking *for* in that data.
    - Not every single aspect of your data/file/etc. might be interesting for your question. So, what does it provide that helps you answer your question?
    - If you have a tabular file, like a CSV, then perhaps you only care about certain columns.
    - If you have text data, like reddit comments, perhaps you only care about certain concepts that keep coming up in participants' words (we can teach python to scrape for those concepts). Etc. Your answer here should be honest and well thought out -- what do *you need* to answer *your question*?
3. How *exactly* is the thing your looking for (your answer to 2) represented in the thing you're looking at (your answer to 1)?
    - If you have tabular data like a CSV, and you care about a column that stores Weights, how are those weights represented? as floats? in pounds? in kilograms? etc.? how are "missing" weights represented? with a blank? a negative one? etc.?
    - If you have text data like reddit comments, and you care about when people are talking about Tea, how do you know when people are talking about Tea? put your finger on the page, what exact word do you land on that tells you people are talking about Tea? (We can use those words when we teach python to scrape for Tea, etc.)

The purpose of this is to clarify, clarify, clarify your thinking. If your Python code is to work with your data, you need to have a clear understanding of your data itself.

*Take your time.*

This is the *most important* "pre-planning" step for the code you will write later.

As you answer these questions, constantly look back to the little bit of data you've collected so far and the interests you talked about in Check-in 2. Spell your thinking out: What do you believe, why do you believe it, check your gut and *wriiiiite*. Don't assume I am familiar with your topic or have a clear idea for you. If you don't say it, you don't say it.

Once you're done collecting your data and your thoughts, post them to the discussion board for this Check-in. In the next Check-in you'll comment on each others' plans.

## Example

This is an example of me thinking through the Bronte sister example:

1. I am looking at the books written by the Bronte sisters. These were published during the Victorian era, and there are entire journals of scholarly work from people researching and interpreting works from this time period. Each sister is known to have had their own writing style, some focusing more on poetry and some more on novels. All three grew up in a home with several siblings, but only the three of them lived past childhood, due to widespread illness, so death, loss, and domestic life (literally, life lived inside the home) are recurring themes for all three. To download these books, I am pulling them from Project Gutenburg, which makes books available in an ASCII format. Paragraphs are separated by a double newline character, and chapters are labeled with a "CHAPTER I" or similar heading. These ASCII files begin and end with long copyright statements that are not about the book itself. There is also a table of contents before the start of the text. So, before scraping these files, I will manually remove the copyright statements and the tables of content.
2. I want to identify scenes where characters are drinking, making, or talking about tea. It is known that domestic life is an important theme in the Bronte novels, and that tea was an important ritual in domestical life across authors during that time period.
3. My code will identify as a "tea scene" any paragraph that contains the regex pattern "\Wtea\W", ignoring case. It will add the three paragraphs before and the three paragraphs after that central paragraph to the "tea scene," so long as those paragraphs are in the same chapter. And any scenes that overlap this way will be combined. I will continue to revise this logic, adding other possible keywords, such as "\Wcup\W". In this way, I plan to use Python to produce a CSV file with the following columns: Paragraph (string); Author (string); Book (string); Chapter (number); Tea (boolean, 1 or 0).

## Submission

Post your answers/materials for the check-in above to Blackboard to the discussion board for this assignment.

## Grading

This check-in is worth 2/100 towards your final grade.