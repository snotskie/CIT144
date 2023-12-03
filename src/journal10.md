# Reading / Journal 10

## Efficiency ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

Last week I said that the Delete task is a good example for thinking about "efficiency." When we say "efficiency" we either mean time (number of steps taken by the computer) or space (amount of memory required for the program to run). Usually though, we mean time.

Let's demonstrate with examples.

The goal: Delete all students named "Alice" from both the names and the ages list.

In both, we will think about their efficiency in this way:

1. Choose something to count (the number of times the loops run)
2. Think of an example input and mentally add your count up (when we get 5975 in the first example)
3. Reason about the "equation" that tells us how much we would count, based on the size of our inputs (`0.75 N^2 + N/2` and `2N`)
4. Reason about the "family" of that equation ("quadratic" and "linear")
5. Reason about the "goodness" of that family, and call it a day

---

First example:

```python
names = ["Alice", "Bob", "Cindy", "Alice", "Eugene", "Alice"]
ages = [18, 18, 27, 92, 19, 32]

def deleteByName(name):
  global names
  global ages
  
  while True:
  
    # a placeholder
    indexToDelete = -1
    
    # loop through names
    for i in range(len(names)):
      
      # when we find a match, write it down, break out of the for loop
      if names[i] == name:
        indexToDelete = i
        break
    
    # we found nothing, so break the loop, we're done
    if indexToDelete == -1:
      break
      
    # else we did find something, so delete it,
    # then let the while loop continue, we might
    # find something else
    else:
      names.pop(indexToDelete)
      ages.pop(indexToDelete)

# test a "before and after" to see if it worked
print(names, ages)
deleteByName("Alice")
print(names, ages)
```

Does this code work? Yes. Run it for yourself, step through how it works, and convince yourself that it works before you read on.

Is this code fast? Not really.

Let's say that we have 1000 students in our class. And let's say that there are five students named Alice to be deleted. And let's say that they are all at the end of the list.

What will this code do?

First, it will enter the while loop.

Then, it will enter the for loop. The for loop will run 996 times in order to find the first Alice.

Then it will leave the for loop, then delete Alice #1, then repeat the while loop.

Then for loop will run 996 times in order to find the second Alice. Then delete her.

Then 996 times to find the third Alice, then delete her.

Then another 996 times for the fourth Alice.

Then another 996 times for the fifth Alice.

And then--we're not done yet!--a final 995 times, since the for loop's job is to check if there are any matches. Our Delete logic doesn't stop until it's *sure* that there are no matches. So we need this final pass to make sure that we're done.

How many times did the for loop run in the end?

`5*996+995 = 5975`

That's almost 6 times the length of our list!

Turns out, we can make an equation to represent how "efficient" this Delete code is, regardless of the particular numbers we choose for our hypothetical big list of students.

If you have `N` students in our list, and you have `M` students who need to be deleted (worst case, let's assume they are at the end of the list), then this Delete code will need to run that for loop this many times:

`M(N-M+1) + (N-M)`

Notice I mentioned "worst case." When we are evaluating the efficiency of code, we usually care about "worst case." Maybe your code is fast on some data, but if I'm running your code on my big enterprise server, and the worst case happens along, will my server start to lag because of you? Sure, the for loop will finish really fast if Alice is at the start of the list. But I ain't taking the chance on that.

That's the idea.

So what's the worst case of `M(N-M+1) + (N-M)`?

It's when `M=N/2`, ie, there are 500 Alice's in our list of 1000 students, and all the Alices are at the end of the list.

The math on that (`N^2` means "N squared"):

`N/2 * (N - N/2 + 1) + (N - N/2)`

`N^2/2 - N^2/4 + N^2/2 + N - N/2`

`N^2 - N^2/4 + N - N/2`

`0.75 N^2 + N/2`

So is this a *bad* equation?

It falls into a "family" of equations we can just call `N^2`, the "quadratic" family.

But I could have told you that without doing any of that math!

There is a loop inside of a loop. Two nested loops. Thus, `N^2`. If you have three loops nested, then it's `N^3`. If you have 1000 loops nested (why on God's green Earth would you do that), then it's `N^1000`.

All of these are part of the larger `N^k` family, the "polynomial" family. And polynomial-time algorithms are considered okay runtimes. Not great, but okay.

Yes, this Delete code could be better. But it isn't *bad*.

---

"How *could* it be better?" You ask.

Second example:

```python
names = ["Alice", "Bob", "Cindy", "Alice", "Eugene", "Alice"]
ages = [18, 18, 27, 92, 19, 32]

def deleteByName(name):
  global names
  global ages
  
  # an empty list to start us off
  indicesToDelete = []

  # loop through names
  for i in range(len(names)):

    # when we find a match, write it down, then keep looking
    if names[i] == name:
      indicesToDelete.append(i)

  # while we have things to delete,
  # delete them. NOTE: pop() pulls
  # from the end of the list, so this
  # deletes in REVERSE order, that's
  # important. If we delete from the
  # start of the list first, then
  # the indices of all the values
  # will change, so they won't align
  # with the list we jotted down anymore
  while len(indicesToDelete) > 0:
    indexToDelete = indicesToDelete.pop()
    names.pop(indexToDelete)
    ages.pop(indexToDelete)

# test a "before and after" to see if it worked
print(names, ages)
deleteByName("Alice")
print(names, ages)
```

Does this code work? Yes. Run it for yourself, step through how it works, and convince yourself that it works before you read on.

Is this code fast? Better than `N^2`!

First, we for-loop through our entire list. That's `N` steps.

Then we while-loop through the list of items to delete. That's `M` steps.

And we're done. A total of `N+M` steps, simplified to just `2N` steps in the worst case.

And again, I could have told you that without doing any math: We have two loops, one after another, `N` for the first and `N` for the second, so that's worst case `N+N=2N`.

This version of Delete falls into the "linear" family, those that take `k*N` steps. And linear-time algorithms are considered pretty decent!

It's hard to get better than linear-time in a lot of cases, so I'd take the win and call it a day!

---

In most Computer Science programs, CS III (or the equivalent) focuses on the math and tricks that help you answer steps 3-5 from my list of steps at the very top. Maybe in that class, maybe in a later class, you'd learn the common tricks to writing algorithms with better efficiency.

The take-aways for us in this class:

1. You can go a long way with just careful reason alone
2. Your code has to work first, who cares about the efficiency of a bad algorithm
3. Linear is always better than quadratic. If you can, avoid putting loops inside of one another. Loops that come *after* one another is fine.
4. Watch out for time/space trade-offs. Sure, the second version of Delete is faster, but it also takes up more memory: It required a `indicesToDelete` list, which could be size `N` in the worst case, while the first version of Delete just needed `1` slot in memory to hold `indexToDelete`. This is actually *reaaaaaally* common in algorithm design: You can make it faster, *if* you track more data to help you out.
5. Doing better than "linear" gets out of scope for our class, sadly, but I'll leave some extra resources below for those interested in learning more.

**Now watch "Introduction to Big O Notation and Time Complexity (Data Structures & Algorithms #7)"** from <https://www.youtube.com/watch?v=D6xkbGLQesk> (This is a long video, but he does a great job, and it goes well with where we are in this class)

**And read the rest of Chapter 13** from our textbook

Other resources for those interested in learning more:

- <https://www.youtube.com/watch?v=0xBq58IH-jY>
- <http://www.cs.sjtu.edu.cn/~jiangli/teaching/CS222/files/materials/Algorithm%20Design.pdf>
- <https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-046j-design-and-analysis-of-algorithms-spring-2015/lecture-videos/>

(The second link is a PDF for a whole textbook. Takes a good minute to download.)

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *What’s something you’ve done especially well so far this week? Big or small!* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.