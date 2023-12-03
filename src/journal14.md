# Reading / Journal 14

## The Software Development Life Cycle ✏️

Journals are a combination of a few things. First, the "journal." This is a very small weekly assignment where you write 200+ words (option 1) or submit  "tinker" code (option 2). Second, the "reading." This is where I direct you to read from a book, an online article, or watch a video, and I supplement those with my own lecture notes, graphs, figures, quotes, or so on.

All other assignments and lectures build upon these. Usually, there will be more reading at the start of a unit and less at the end.

## Reading

Many of you have asked me about software engineering, and I had already planned to cover a topic from it this week. In CIT 143 (C# I), this topic was spread out over the entire semester. That's because the very structure of C# itself is inspired by software development ideas. And while these ideas are *present* in Python, they are not so *required*. This is a longer reading than usual, since I'm summing up a lot in one place. Assume all of the linked readings are "optional," but do read through my lecture notes, read what you can of the links, and bookmark the rest.

So, to get started, let's take a step back.

---

Often in intro to programming courses we talk about "complexity" and how some new feature we're teaching you--we promise--will help you manage and/or achieve more complex programs better.

But what *is* a "complex" program? Is complexity a *good thing* to have?

It seems easy to say that there is "good complexity" and "bad complexity." Skyrim is good because its complexity allows for about [225 hours of gameplay](https://howlongtobeat.com/game?id=9859). But Skyrim is bad because with all that complexity comes some at times *very* frustrating [bugs](https://www.ign.com/wikis/the-elder-scrolls-5-skyrim/Bugs_and_Glitches), such as being unable to complete one of your favorite side missions because a necessary NPC failed to spawn and the only fix is starting a new save file.

The line between "good complexity" and "bad complexity" isn't something that we can leave to math. It's something that's nonlinear. It's hard to predict. It's subjective. And it's often measured in *human* terms.

So let's think about "more vs. less" complexity instead. And, let's take Bob Erickson's advice. Erickson says to think about where we are now (zero complexity, since we haven't started even thinking about our app yet) and where we want to be (the perfect app with the ideal levels and types of complexity that makes all our users happy). Our job as a software engineer, then, is to take a good route from here to there. No more, no less.

---

Besides, or alongside, complexity, it's also important to think about "success" and what "success" might mean for your project.

- What does "success" mean for the project you'll make in this course?
- What does it mean if you were to keep working on that app in the real world?
- Who are your customers?
- Who are your co-workers?
- Are there any third-parties that you might work with?
- What role will groupwork play in the final design?
- What role will communication channels play?
- project milestones?
- measures of progress?
- shared ideas in your team of what's "valuable"?
- and so on?

"Success," to return to Erickon's advice, is a certain kind of *journey*, not a certain kind of destination, and there's a *lot* of people, things, and data involved in that process. (As Jenn Schiffer says, "You never (learn to) code alone.")

So, most importantly, in all of those questions above, and all the questions you ask yourself about programming, you should ask: *What do you want **your** role to be?*

---

A phrase I like to use is the "complexity point." This phrase comes from Mark Rosewater, the head designer of Magic the Gathering. I want to share this excerpt from one of his [Drive to Work podcasts](http://dtwtranscripts.blogspot.com/2014/06/62014-episode-133-designing-commons.html):

> ... Our goal here is to minimize just how complex [the game] is. Not to make it not complex. It is impossible to make Magic not complex. It’s complex.
>
>And part of doing that is, you need some breathers. You need to concentrate your complexity where it matters. And the way I like to think about it is, imagine that you have points for your complexity. And you had a limit. You only get so many complexity points. Well, every time you make a common card you have to add, you have to say, “How many complexity points are on this card, and is it worth it? Do I need this to be?”
>
> And the reality is, I need some creatures. Common creatures. I mean, I’m not saying that all of them are vanilla or [simple] and such. You need to have a lot of simple stuff like that, only because you need to allow your brain to be able to focus.
>
> Because what happens is, if you give your brain too much, instead of being able to focus, it kind of just blurs things out. And what will happen is, when we do focus testing and watch people playing Magic, and even more experienced players, watching Magic, that if you get past the overload point, once your brain can’t handle it all, your brain just like dulls out and goes, “Okay…” and you kind of don’t think about things. And what we want to do is we want people to be able to spend the time and energy to think about things, so it’s a matter of focusing your complexity.
>
> And once again, a big part of design is saying, “There’s a cost that comes with making what I’m making, do I want to spend that cost?” And one of which is complexity. That’s a big one, which is, “This is complex. How complex?”
>
> And the way I think of it, I always use the term “complexity points,” and people think we have a system, where we have actual points. We don’t. It’s just easier to think of it this way, which is if I’m looking at a file, and I have three cards at common let’s say, that I know are all sort of causing a certain amount of mental strain on my player. I might have to say to myself, “Where do I want the mental strain?” It’s not that I don’t want to have some mentally taxing cards, but I want to be careful that the mentally taxing cards are what contribute to making it fun. ...

Magic the Gathering has a lot of [metaphors useful for Computer Science](https://arxiv.org/abs/1904.09828), and its rule system was in part inspired by theoretical computer science.

The takeaway from this exerpt for us today is: Where do you want to invest your mental efforts?

You could be making a large project, with several subcomponents, and several classes, and several methods. Practice and reading will help you think about  how to *break down* large projects into separable parts and about the ways those subcomponents/etc. *connect* to one another.

But, individually, as you reflect on things, which subcomponent/etc. do you want to *invest complex effort* in? It's not that you don't want to have any parts that are hard to make, but you should want to be careful that the parts that are hard to make are what contribute to making your project fun.

---

Keep in mind, *just* breaking your large program down into pieces is not the end goal. You *also* need to be conscious of how those pieces will fit together into a coherent whole. And the general pattern of how your project "fits together" is what we mean when we say "architecture" in software development.

There are several common architectures out there software developers have come up with. Even if no two houses look exactly the same, the general idea of Foundation, Walls, and a Roof is pretty consistent. And one *very* common architecture is MVC, or Model, View, and Controller.

The Model is the layer or component that deals with data. The View is the layer or component that deals with displaying information to and collecting information from the user. And the Controller is the layer that deals with the "business logic," like taking money out of bank accounts or adding fun filters to a photo before we store it for the long term.

(We actually used a simple form of MVC in Lab 1 and Lab 4! Our Model was specified by the first line of our CSV file, our View we created with Pygubu Designer and saved as a .ui file, and our Controller was the logic we attached to it with Python.)

**Now read the Systems Architecture slides** from <http://web.mit.edu/6.976/www/notes/Notes1.pdf>

**And read "An MVC Primer"** from <https://danielmiessler.com/study/mvc/>

**And read "Javascript MVC"** from <https://alistapart.com/article/javascript-mvc/> (Yes, it's about Javascript, so skip over the code examples, but the discussion of what each component is in charge of is *very* related to what we're aiming at in this course.)

**And read "MVC vs. MVVM"** from <https://hackernoon.com/mvc-vs-mvvm-how-a-website-communicates-with-its-data-models-18553877bf7d> (Again, the examples are in Javascript, but the discussion is close to home, and it gives a little contrast to an architecture we *won't* be going into much detail in this course yet is still good for you to know the acronym for.)

---

Now consider, *no matter what you do*, your architecture will not be perfect. Programs are not "one and done." The *evolve* over time.

But just like architectures, there are many different ways programmers have come up with for thinking out, and managing, that "evolution process."

This process is what we mean when we say "software development life cycle," or SDLC.

So, say you've planned your large project, you've broken it into subcomponents, you've decided what architecture to use to fit those pieces together, and you've coded and tested it. Are you done? Well, that's never a simple question. What is art done? ("When the check clears.")

One way to think about "done" is the "waterfall" way. It's called a waterfall because you can't go back up. The first step is understanding the requirements, then planning the code, then writing the code. When you're done, you're done.

And because you know that once you move on to the next step you can't go back, you make *sure* that you got things right the first time around. That's the driving force behind this Life Cycle, the first of two that we'll learn today.

**Now read "Waterfall Model"** from <https://airbrake.io/blog/sdlc/waterfall-model>

**And read "The Traditional Waterfall Approach"** from <https://www.umsl.edu/~hugheyd/is6840/waterfall.html>

Next, the Cyclic approach to software development takes the idea of "rapid prototyping" and puts it front and center: *sooooo* often when working with a client, even *they* don't know what they are asking you for until you've already built something they can look at and test.

So, why not make the client part of the design process too?

In the readings below, you'll see this idea play out under the labels "spiral," "agile," and "scrum."

**Now read "6 Basic SDLC Methodologies: Which One is Best?"** from <https://www.roberthalf.com/blog/salaries-and-skills/6-basic-sdlc-methodologies-which-one-is-best>

**And read "Software Development Life Cycle Models and Methodologies"** from <https://melsatar.blog/2012/03/15/software-development-life-cycle-models-and-methodologies/>

**And read "The Beginner’s Guide To Scrum And Agile Project Management"** from <https://blog.trello.com/beginners-guide-scrum-and-agile-project-management>

And finally, we know that both Waterfall and Cyclic approaches can be, in some form, broken down into "sprints," aka, milestones that you have some predetermined about of time to work on, like two weeks. (Coincidentally, our Lab assignments are due in two week chunks too.)

But what if you have a software development position that isn't friendly to "chunking" your time like that? A common reason for that is that tasks constantly come in (as "tickets"), and you simply need to process them in some order, whether that's in the order they come in or according to some measure of importance. Here your time is dictated by the tasks, not the other way around.

So while Waterfall and Cyclic approaches to SDLC can handle time-chunkable kinds of work, it's *Kanban* and its siblings that can handle constant-stream kinds of work.

**Now read (skim) "What's the Difference? Agile vs Scrum vs Waterfall vs Kanban"** from <https://www.smartsheet.com/agile-vs-scrum-vs-waterfall-vs-kanban>

**And read (actually read) "Kanban without kaizen is pointless"** from <https://planet-lean.com/kanban-without-kaizen-pointless/>

## Journal

Choose from one of the following two options as you best see fit:

**Option One:** Submit a brief "200+ Words" reflecting on the reading and/or the course as a whole. These 200+ words are expected to come completely from the student, ignoring words from quotes/etc. The format of these assignments is up to the student as it best helps them: bulleted point notes on the reading; questions directed at the instructor of course material; a paragraph reflecting on the Lab assignment for the week; a poem; a summary of recent technology news; anything, so long as it is turned in on time, is relevant to the course, and meets the required length. 

**Option Two:** Submit a brief "Tinker" where you have attempted to "program" something, using the tools of the course, that is not directly related to another course assignment. Include screenshots of the input work done and the output result (even if it does not work), along with a brief statement of your intentions, the approach you took in getting it to work, and your thoughts on your result so far. Make sure it is clear what code came from you and what came from online/the reading/etc.

!!! note "Short on Words?"
    
    Short a few words in your journal and don't know what else to write about?

    This week's "get to know you" question is:

    *If you could have any unconventional animal as a pet (real or fictional), what would it be and why?* [(Credit)](https://jonitrythall.com/daily-discussion-prompts-wiggle-work-way)

    Feel free to write about this a little bit in your journal.

## Submission

Submit your journal as a Word/PDF (NOT a .pages) document to Blackboard.

## Grading

Journals are each worth 1/100 towards your final grade. Grading is pass/fail based on meeting the requirements of the chosen option.