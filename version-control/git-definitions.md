# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a way of creating different versions of your project simultaneously and being able to both work on any of them without affecting the others and being able to roll back to any previous version you want. It's incredibly useful for both documenting and safeguarding your own work against bugs or accidental major changes (like deleting a file) and for letting multiple people work on projects at once without getting in each others' way. When changes are made they can all be put together into the main file once they have all been checked against each other and all the work done by anyone working on the project can be collected efficiently and safely.

* What is a branch and why would you use one?

A branch is a new copy of the project that you can add to, remove things from, or edit (or a combination of the three). They are incredibly useful because they both let multiple edit the same project independently and let you isolate aspects of the project to work on so if you create buggy code you can roll back that part and just edit the buggy section without damaging the whole build of the project.

* What is a commit? What makes a good commit message?

Commits are when you take a branch and save any edits made in it (or additions/subtractions). Commits are great because they give you a save point to roll back to in case anything goes wrong and lets others see the progression of the work you've done in case they need to monitor or edit your work (commits themselves don't share your work, but they create something easily sharable). whenever you make a commit you should write a message on it describing what you've done. Commit messages should be specific and informative. When combing back through your previous versions (things you've committed) you can use the messages you've added as a guide so that you can find whatever change you are looking for. Thus, saying "I edited the document" isn't very helpful, even though it's true. What would be better would be something like "Answered all questions in git-definitions.md". Or, if you only answered a subsection of the questions, noting which ones are modified would be important.

* What is a merge conflict?

A merge conflict happens when you have multiple branches attempting to change the same section of code (same line), or delete something that wasn't deleted on a different branch. It's git's way of making sure two people's or version's work isn't contradictory and, if it is, making sure that you get the changes you want in the master repository. 